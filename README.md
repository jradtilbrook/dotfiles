# My Dotfiles

This repo holds my configuration files for the different OSes I use; Arch Linux and MacOS.

I use Ansible to help automate the initial setup and manage changes. The [`dotfiles.yml`](./dotfiles.yml) file is the
global playbook used to configure any of the above OSes. It installs the applications I use, moves dotfiles into place
and sets up SSH keys.

To use this repo, simply install Ansible (see [OS specific notes](#os-specific-notes) below) and execute
`./dotfiles.yml`. *Note* that it will ask for my vault password which I'm obviously not going to share here but it
should be pretty simple to work around if you are looking for a better dofiles solution.

To allow this to work on multiple OSes I use a dynamic inventory file for Ansible that determines the current system and
outputs different aliases to allow specific tasks to be executed. See [`inventory.py`](./inventory.py) for the code.


### OS specific notes

- [Arch Linux](./archlinux.md)
- [MacOS](./macbook.md)


### Other references
- All [awesome lists](https://awesome.re)
