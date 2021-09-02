# Arch Linux Setup

Install Arch following the [installation guide](https://wiki.archlinux.org/index.php/Installation_guide) on the wiki.
Setup partitions depending on encryption and dual booting needs. Install the `base` and `base-devel` package groups with
the pacstrap command. At the end of the `chroot` step perform the following:

FIX THIS ORDER
1. Install the following extra dependencies:
    - dhcpcd
    - git
    - intel-ucode or amd-ucode
    - python-virtualenvwrapper
    - sudo
    - wpa_supplicant (if using wireless)
2. Create a new user.
3. Give the user sudo access.
4. Install `virtualenvwrapper` with pip

```bash
# add a sudo group
# create a user
# install base pip dependencies
pip install virtualenvwrapper botocore
```

Reboot and log into the new user. Now the Ansible playbook can be run:

FIX THE CHICKEN/EGG PROBLEMS WITH NEW INSTALL
- wifi is an issue and having some other binaries around still before running ansible
- probably dont need vim? just use neovim?
- need to handle gpg and password store somehow
- ordering of things doesnt quite work i think (at least trying to run ssh tag fails because no aws credentials). not
  sure if i just ran the whole playbook if it would work nicely
  - so i think it kind of did work after i added some failed_when: no and ran the script as a whole
- hibernation
- add my extra gitconfig files for users
- configure sshd
- configure firewall
- move ansible vault to bitwarden if possible so i dont need gpg and password-store
  - or; is it a bad idea to put my gpg key into bitwarden? i could do that and then either just use bitwarden for
    everything, or grab the private key out of bitwarden so i can use the password store for things
  - might be okay to create a new gpg key with stronger passphrase and put that in bitwarden
- fix jira 
- aws step requires aws-vault and a session token - try to fix


1. Clone this repo (using https because no ssh key exists yet).
2. Setup virtualenv for this repo.
2. Run the ansible playbook: `./dotfiles.yml`.
    - The playbook requires admin rights to install packages so run `sudo -v` beforehand to cache credentials.
3. Change any other app settings as desired.
4. Change the repo url to use ssh.
5. Install `yay` to help with AUR packages.
6. Change shell to Zsh.
7. Change `/etc/makepkg.conf` [to improve compression](https://wiki.archlinux.org/index.php/Makepkg#Utilizing_multiple_cores_on_compression)

Now perform other system admin/management/security tasks as needed that are not easily automated with Ansible. See the [References](#references) below.

#### References

- [General recommendations](https://wiki.archlinux.org/index.php/General_recommendations)
- [List of applications](https://wiki.archlinux.org/index.php/List_of_applications)
- [Eye candy](https://wiki.archlinux.org/index.php/Category:Eye_candy)
