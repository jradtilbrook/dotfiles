#!/usr/bin/env python

import sys
import json
import re


API_BASE = 'https://api.bitbucket.org/2.0'


class BitbucketResponse(object):
    def __init__(self, response, info):
        self.content = response.read()
        self.info = info

    def json(self):
        return json.loads(self.content)


class BitbucketSession(object):
    def __init__(self, module, username, password):
        self.module = module
        self.username = username
        self.password = password

    def request(self, method, url, data=None):
        headers = {
            'Authorization': basic_auth_header(self.username, self.password),
            'Content-Type': 'application/json'
        }

        # add username to placeholder
        url = url.replace('<user>', self.username)

        response, info = fetch_url(
            self.module, url, method=method, data=self.module.jsonify(data), headers=headers)

        if not (200 <= info['status'] < 400):
            self.module.fail_json(
                msg=(" failed to send request %s to %s: %s"
                     % (method, url, info['msg'])))

        return BitbucketResponse(response, info)

def get_all_keys(session):
    url = API_BASE + '/users/<user>/ssh-keys'

    r = session.request('GET', url)
    for key in r.json()['values']:
        yield key

def create_key(session, name, pubkey, check_mode):
    if check_mode:
        from datetime import datetime
        now = datetime.utcnow()
        return {
            'uuid': 0,
            'key': pubkey,
            'label': name
        }
    else:
        return session.request(
            'POST',
            API_BASE + '/users/<user>/ssh-keys',
            data={'label': name, 'key': pubkey})

def delete_keys(session, to_delete, check_mode):
    if check_mode:
        return

    for key in to_delete:
        session.request('DELETE', API_BASE + '/users/<user>/ssh-keys/%s' % key['uuid'])

def ensure_key_absent(session, name, check_mode):
    to_delete = [key for key in get_all_keys(session) if key['label'] == name]
    delete_keys(session, to_delete, check_mode=check_mode)

    return {'changed': bool(to_delete),
            'deleted_keys': to_delete}

def ensure_key_present(session, name, pubkey, force, check_mode):
    matching_keys = [k for k in get_all_keys(session) if k['label'] == name]
    deleted_keys = []

    if matching_keys and force and matching_keys[0]['key'] != pubkey:
        delete_keys(session, matching_keys, check_mode=check_mode)
        (deleted_keys, matching_keys) = (matching_keys, [])

    if not matching_keys:
        key = create_key(session, name, pubkey, check_mode=check_mode).json()
    else:
        key = matching_keys[0]

    return {
        'changed': bool(deleted_keys or not matching_keys),
        'deleted_keys': deleted_keys,
        'matching_keys': matching_keys,
        'key': key
    }

def main():
    argument_spec = {
        'username': {'required': True, 'no_log': True},
        'password': {'required': True, 'no_log': True},
        'name': {'required': True},
        'pubkey': {},
        'state': {'choices': ['present', 'absent'], 'default': 'present'},
        'force': {'default': True, 'type': 'bool'},
    }

    module = AnsibleModule(
        argument_spec=argument_spec,
        supports_check_mode=True
    )

    username = module.params['username']
    password = module.params['password']
    name = module.params['name']
    state = module.params['state']
    force = module.params['force']
    pubkey = module.params.get('pubkey')

    if pubkey:
        pubkey_parts = pubkey.split(' ')
        # Keys consist of a protocol, the key data, and an optional comment.
        if len(pubkey_parts) < 2:
            module.fail_json(msg='"pubkey" parameter has an invalid format')
    elif state == 'present':
        module.fail_json(msg='"pubkey" is required when state=present')

    session = BitbucketSession(module, username, password)

    if state == 'present':
        result = ensure_key_present(session, name, pubkey, force=force,
            check_mode=module.check_mode)
    elif state == 'absent':
        result = ensure_key_absent(session, name, check_mode=module.check_mode)

    module.exit_json(**result)

from ansible.module_utils.basic import AnsibleModule
from ansible.module_utils.urls import fetch_url, basic_auth_header

if __name__ == '__main__':
    main()
