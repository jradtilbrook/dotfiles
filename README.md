#### Todo's

- bash/zsh config
    - powerline (git integration)
- environment variables
- vim config
    - setup ide for HE code & style
- other dotfiles/templates
- tmux

# MacBook Pro Setup

I use ansible to setup a new Mac rather than using the built in migration
assistant. The steps below outline how to set up a new Mac. __Note:__ I've also
added Ubuntu support but haven't used it fully yet.

1. Install Xcode.
    - Also run `xcode-select --install` from the terminal to install command
      line options. **Restart required**.
2. Install Homebrew from [here](http://brew.sh/).
    - Run `brew doctor` and fix any issues.
3. Install `ansible` using Homebrew.
4. Clone this repo (using https because no ssh key exists yet).
6. Run the ansible playbook: `./dotfiles.yml`.
7. Change any other app settings as desired.
8. Change the repo url to use ssh.

Ubuntu requires manual install of git and ansible. Use the PPA for Ansible
because version 2.2 or greater is required.

The playbook will install my apps, generate an SSH key and upload it to GitHub
and move dotfiles into place. The Bitbucket key must be uploaded manually.

## Resources

- A helpful guide to setting up a Mac for development [here](http://sourabhbajaj.com/mac-setup/).
- Another cool configuration repo [maximum-awesome](https://github.com/square/maximum-awesome).

## System Preferences

Only non-defaults shown.

#### General

- [x] Use dark menu bar
- [x] Automatically hide and show menu bar
- Sidebar icon size: small
- Click in scroll bar: Jump to spot clicked

#### Desktop & Screen Saver

- Turn screen saver off
- Change background to personal preference

#### Language & Region

- Time format: 24hr

#### Security & Privacy

- FileVault: on
- Firewall: on

#### Displays

- [ ] Show mirroring options when available

#### Energy Saver

- Battery display turn off: 5min

#### Keyboard

- [ ] Adjust backlight in low light
- Disable spotlight shortcuts (in favour of Alfred)

#### Trackpad

- Light click pressure
- Tracking speed: 5th notch from right
- [x] Swipe between pages: _three fingers_
- [x] App Expose

#### Sound

- [x] Show volume in menu
- Input volume: left most (almost muted)

#### iCloud

- [ ] Photos

#### Internet Accounts

- Link up Google with Mail, Contacts, Calendars
- Sign in with Facebook (uncheck Contacts)
- Linkedin
- Twitter

#### App Store

- [ ] Download newly available in the background

#### Bluetooth

- [x] Show in menu bar
- Default to off

#### Users & Groups

- Disallow guests

#### Date & Time

- [x] Show date

## Menu Bar

- [x] Show battery percentage

## Finder Preferences

- New windows open in user home
- [x] Show Mac device
- [ ] Recent tags
- [x] Show all filename extensions
- [x] Remove items from trash after 30 days
- [x] Keep folders on top when sorting
- Arrange by: name
- Icon size: 36x36
- Grid spacing: 2nd notch from left
- Text size: 11pt
- [x] Show item info
- [x] Show library folder
- Light-grey background colour
- [x] Set as Defaults
