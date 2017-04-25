# Arch Linux Setup

Install Arch following the [installation guide](https://wiki.archlinux.org/index.php/Installation_guide) on the wiki.
Setup partitions depending on encryption and dual booting needs. Install the `base` and `base-devel` package groups with
the pacstrap command. At the end of the `chroot` step perform the following:

1. Install the following extra dependencies:
    - ansible
    - git
    - intel-ucode
    - iw
    - sudo
    - wpa_supplicant
2. Create a new user.
3. Give the user sudo access.

Reboot and log into the new user. Now the Ansible playbook can be run:

1. Clone this repo (using https because no ssh key exists yet).
2. Run the ansible playbook: `./dotfiles.yml`.
    - The playbook requires admin rights to install packages so run `sudo -v` beforehand to cache credentials.
3. Change any other app settings as desired.
4. Change the repo url to use ssh.

Now perform other system admin/management/security tasks as needed that are not easily automated with Ansible. See the [References](#references) below.


#### References

- [General recommendations](https://wiki.archlinux.org/index.php/General_recommendations)
- [List of applications](https://wiki.archlinux.org/index.php/List_of_applications)
