# MacBook Pro Setup

I use ansible to setup a new Mac rather than using the built in migration
assistant. The steps below outline how to set up a new Mac.

1. Install Xcode.
    - Also run `xcode-select --install` from the terminal to install command
      line options. **Restart required**.
2. Install Homebrew from [here](http://brew.sh/).
    - Run `brew doctor` and fix any issues.
3. Install `ansible` using Homebrew.
4. Clone this repo.
5. Run the ansible playbook: `./macbook.yml`.
6. Change any other app settings as desired.

The playbook will install my apps, generate an SSH key and upload it to GitHub
and move dotfiles into place. The Bitbucket key must be uploaded manually.

#### Notes

- `git` installed with Homebrew doesn't seem to set up properly, so manually add
  a symlink `/usr/local/bin/git` pointing to `/usr/local/Cellar/git/...`.
- `packer` also doesn't set up links properly.

## Resources

- A helpful guide to setting up a Mac for development [here](http://sourabhbajaj.com/mac-setup/).
- Another [gist](https://gist.github.com/balupton/5259595) for setting up a new
  environment.

## System Preferences

Only non-defaults shown.

#### General

- [x] Use dark menu bar
- [x] Automatically hide and show menu bar
- Highlight colour: pink
- Sidebar icon size: small
- Click in scroll bar: Jump to spot clicked

#### Desktop & Screen Saver

- Turn screen saver off
- Change background to personal preference

#### Dock

- Size: 10-15%
- [x] Magnification: 20-25%
- Position: left
- [x] Automatically hide and show

#### Mission Control

- [x] Group windows by application

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

- Key repeat: right most
- Delay repeat: right most
- [ ] Adjust backlight in low light
- Disable spotlight shortcuts (in favour of Alfred)

#### Trackpad

- [x] Tap to click
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

- Change avatar
- Disallow guests

#### Date & Time

- [x] Show date

## Menu Bar

- [x] Show battery percentage

## Dock

- Remove all built in cruft

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
- [x] Show path bar
- [x] Show status bar
