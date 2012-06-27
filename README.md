Fated Mariner Gentoo Overlay
============================

This is the overlay I use for my local Gentoo machines. It primary contains
ebuilds related to Compiz and running Gentoo on a MacBook. It also contains
ebuilds for my personal projects, such as the xf86-input-mtrack multitouch
trackpad driver.

Installation
------------

Check out this repository to some place convenient:

    git clone git://github.com/BlueDragonX/fm-overlay.git fm

Include the overlay make.conf in your main make.conf:

    include /path/to/overlays/fm/make.conf

Rebuild the eix cache, if applicable:

    sudo eix-update

Scripts
-------

There are a few scripts I use regularly when managing this overlay. They take
no arguments and operate on all ebuilds in subdirectories of the cwd. They are
located at the root of the repo. They are:

- **listpkgs** List the packages in the overlay.
- **redigest** Regenerate Manifests for all the ebuilds.

License
-------

Copyright (C) 2012 Ryan Bourgeois <bluedragonx@gmail.com>

The contents of this repository are licensed under the [GPLv2][1].

[1]: http://www.gnu.org/licenses/gpl-2.0.html                                   "GNU General Public License, version 2"

