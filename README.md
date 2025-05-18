Minimal GNOME Setup Script — README
What is this?

A simple script to install a barebones GNOME desktop on Debian with only what you really need:

    GNOME Shell (desktop environment)

    Nautilus (file manager)

    GNOME Settings (control panel)

    Kitty (terminal emulator, set as default)

    Firefox ESR (browser)

    NetworkManager + Bluetooth support (so ethernet and Bluetooth work out of the box)

No extra apps, no bloat.
Why use this?

GNOME usually comes stuffed with a bunch of apps you don’t want or need — games, music players, calendars, etc. This script strips all that away so your desktop is lean, fast, and distraction-free.
How to use?

    Save the script as minimal-gnome.sh

    Make it executable:

chmod +x minimal-gnome.sh

    Run it with sudo:

./minimal-gnome.sh

    Reboot your system to apply changes:

sudo reboot

What does it do?

    Updates package lists

    Installs only core GNOME packages plus Firefox, Kitty, Nautilus, network, and Bluetooth support

    Sets Kitty as the default terminal emulator

    Leaves out everything else — no purging or removing of packages

Who is it for?

Power users, minimalists, or anyone wanting a clean GNOME desktop without the usual bloat.
