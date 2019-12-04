# Arch Linux Setup

Install Arch following the [installation guide](https://wiki.archlinux.org/index.php/Installation_guide) on the wiki.
Setup partitions depending on encryption and dual booting needs. Install the `base` and `base-devel` package groups with
the pacstrap command. At the end of the `chroot` step perform the following:

1. Install the following extra dependencies:
    - ansible
    - dhcpcd
    - git
    - intel-ucode or amd-ucode
    - iw (if using wireless)
    - python2
    - sudo
    - wpa_supplicant (if using wireless)
2. Create a new user.
3. Give the user sudo access.

Reboot and log into the new user. Now the Ansible playbook can be run:

1. Clone this repo (using https because no ssh key exists yet).
2. Run the ansible playbook: `./dotfiles.yml`.
    - The playbook requires admin rights to install packages so run `sudo -v` beforehand to cache credentials.
    - There seems to be a bug in ansible 2.8 so create a virtual env and install `ansible>=2.7,<2.8`
3. Change any other app settings as desired.
4. Change the repo url to use ssh.
5. Install `yaourt` to help with AUR packages.
6. Change shell to Zsh.

Now perform other system admin/management/security tasks as needed that are not easily automated with Ansible. See the [References](#references) below.

## Notes for future install

Next install should make use of more disk partitions: one for /boot, one for / and one for /home. The latter two should
be encrypted. The root partition could be unlocked on boot and the /home partition unlocked on user login (ideally
automatically using a file key somewhere or something).  
This would allow keeping user data separate from the OS to make completely wiping and starting again easier.  
See https://wiki.archlinux.org/index.php/PAM, https://wiki.archlinux.org/index.php/GNOME/Keyring, https://wiki.archlinux.org/index.php/Polkit

#### References

- [General recommendations](https://wiki.archlinux.org/index.php/General_recommendations)
- [List of applications](https://wiki.archlinux.org/index.php/List_of_applications)
- [Eye candy](https://wiki.archlinux.org/index.php/Category:Eye_candy)
