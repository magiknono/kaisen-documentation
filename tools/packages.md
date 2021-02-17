# Packages

**This section presents the different packages modified for Kaisen Linux and their function on the system.**

## Forked packages

### adduser

This package allows user creation via the adduser command (the binary is a perl script) and also to delete a user with the deluser command. I modified this package to modify the following configurations:

```bash
*Replace the default bash shell on zsh for user levels in file /etc/adduser.conf
*Allow the deletion of the folder associated with a deleted user (/home/userdelete) when it is deleted with the delsuer command in file /etc/deluser.conf
```

### base-files

The base-files package will simply provide the following files on the system:

```bash
*/etc/debian_version
*/etc/issue
*/etc/issue.net
*/etc/os-release
```

These files are used to identify the system version in details, such as the system version number, distribution name, code name, etc.
These files are used by the live system during the welcome message on the system (here Debian has been replaced by Kaisen Linux).
They are also used to customize GRUB thanks to the lsb_release package which, in its default configuration will read the /etc/os-release file to find out the version of the OS.   

By consequently, personalize the GRUB entries in its default configuration by the command lsb_release -i -s (information present in /etc/default/grub at the line GRUB_DISTRIBUTOR) when executing the update-grub command. The goal here was to replace Debian with Kaisen on the GRUB entries of the installed system. This package surely has many other uses, but I have not encountered them so far.  

The package has therefore been recompiled to formalize the name of the distribution on the system and customize it a little more.

### linux

The kernel has been recompiled to generate .udeb files (used by the Debian installer) as well as .deb files needed to install it via apt or dpkg.  
The Kaisen Linux kernel has its own lean configuration.

### cron

The package has been modified to automatically add the "kaisen-basemenu-purge" package to automatically clean up duplicate icons on the menu.

### debian-installer

This package is forked to build the installer with the custom Kaisen Linux kernel as well as our packages used by the installer (rootskel-gtk for example). It is necessary to rebuild the installer to integrate the modified packages for the installer and thus integrate them into the rolling release ISO.

### rootskel-gtk

This package has been modified because it provides the graphical configuration of the installer (theme, banners). The theme of the Kaisen Linux graphical installer is based on the original Clearlooks theme.

### apt-setup

This package allows you to configure the /etc/apt/sources.list file after installing the system.  
Since the Kaisen Linux installer is configured to request no network configuration, this package has been forked to add the Kaisen Linux repository, because by default, without internet connection (therefore no mirror selection), apt-setup will configure the Debian security repositories.  

### choose-mirror

This package configures the mirrors to be used to download packages. This package has been forked in anticipation of the future, an ISO netinstall is planned.

### partman-auto

This package, as its name suggests, allows you to automatically partition the disk during installation.
This package was forked for three things:  
- Use of BTRFS as default file system on all partitions of the disk (except /boot if the partition is separated)
- Definition of EXT4 as the default file system for /boot if the partition is separate from / (this is the case for example during the installation of the system with LVM and cryptsetup).
- Modification of the size of the partitions allocated by partman to adapt it to the size required by Kaisen Linux and thus limit any problems that may appear on insufficient disk space (especially in case of separation of the partitions /home /var /tmp and /).

### debootstrap

This package builds and installs the base system (the packages mentioned as required). This package is forked to integrate the specific configurations of Kaisen Linux (build the base system from the distribution repository).

### desktop-base

This package provides wallpapers for the desktop, login screen, grub etc ...  
This package is forked to add the different Kaisen themes on the system to provide wallpapers as well as "alternatives" to define by default the theme to use. It is by default configured on kaisen-theme.  

### grub2

This package was forked to integrate the kaisen-grub-configuration package as a dependency. This allowed the possibility of providing a GRUB image even when the machine is encrypted and activating the plymouth theme.

### live-build

It is the official Debian tool for building system images. It was forked to add support for the "kaisen-rolling" repository.

### win32-loader

This package allows you to start the installation of a Debian system directly from a Windows system. The package was forked to simply add the Kaisen Linux logo.

### shadow

This package was forked because the /etc/default/useradd file was modified to support /bin/zsh as the default terminal when adding a user.  
The number of users to add to the system has also been changed. Maximum 100 users can be added (by default, 58999 users can be added).

### live-installer
Forked to support the kaisen-calamares-settings package.

### plymouth
Forked to define kaisen-theme by default for Plymouth.

## Kaisen Linux packages

### kaisen-basemenu-purge

This package removes "double" launchers. These duplicate icons appear when updating packages containing a launcher for a graphical application, for example ettercap, lftp, kismet etc ... Custom launchers have been created for the Kaisen menu to organize them by categories (monitoring, scanner etc). The custom launchers are also launched with sudo if necessary by the software.  
This package therefore removes the original launchers contained in `/usr/share/applications`

### kaisen-grub-configuration

The GRUB package has been recompiled to change the configuration of the /etc/default/grub file to add support for the default splash screen for the user on the installed system (graphical boot) and also allow in case the command lsb_release -i -s cannot be executed because the lsb-release script is not present, you can still display Kaisen and not Debian in the GRUB entries.

The kaisen-grub-configuration package is installed automatically during system installation and automates this customization.

### kaisen-archive-keyring

This package provides the public GPG keys needed to use our secure repository with identity verification via a GPG key (used by official Debian repositories and implemented security by default).

### kaisen-menu

This package provides the custom menu. This includes the "skeleton" of the menu (allows you to organize the location of the different folders), the directories as well as the launchers of the applications. This menu is mainly used to reference the tools present in the distribution.

### kaisen-services-management

This package provides various bash scripts allowing you to easily manage additional services (added by software supplied with the distribution).  
The scripts are installed in `/opt/services`. This package coupled with the "kaisen-menu" package allows you to reference and execute directly via the menu the scripts classified by service to activate or deactivate additional services. Two activation and deactivation scripts exist for all services.

### kaisen-update

This package just provides a script to perform an apt update && apt upgrade in one command. The kaisen-update command also allows to remove the most necessary packages (dependencies no longer used).

### kaisen-build
This package contains all configurations for build Kaisen Linux ISO.

### kaisen-interfaces
All Kaisen Linux MATE Desktop Environment configurations (themes, icons etc). This package also installs the default Firefox configurations for Kaisen Linux as well as its translations, terminator, vim and others.
This package installs the kaisen-interface-switcher command (MATE version).

All Kaisen Linux KDE Desktop Environment configurations (themes, icons etc). This package also installs the default Firefox configurations for Kaisen Linux as well as its translations, terminator, vim and others.
This package installs the kaisen-interface-switcher command (KDE version).

All Kaisen Linux LXDE Desktop Environment configurations (themes, icons etc). This package also installs the default Firefox configurations for Kaisen Linux as well as its translations, terminator, vim and others.
This package installs the kaisen-interface-switcher command.

All Kaisen Linux XFCE Desktop Environment configurations (themes, icons etc). This package also installs the default Firefox configurations for Kaisen Linux as well as its translations, terminator, vim and others.
This package installs the kaisen-interface-switcher command.

### kaisen-skeleton

This allows you to have launchers on the desktop, the conky theme...  
This package replaces the old kaisen-*-default-profile packages which installed only the default profile of the related interface.
This package installs the kaisen-update-skel command.  

### kaisen-manpages
This package is simply an offline implementation of the entire https://kaisenlinux.org/manpages domain in order to access the centralized manpages of the tools built into Kaisen Linux without requiring an internet connection. An Apache server is installed with this package to read HTML pages via localhost.

### veracrypt
Tool to HDD, SSD and system disks encryption.

### woeusb
Tool to create Windows USB bootable key.

### gns3-server
Tool to network simulator (server package)

### gns3-gui
Tool to network simulator (client package)

### apfs-fuse
FUSE driver for Apple FileSystem

### ubridge
Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces

### vpcs
Simple Virtual PC Simulator

### dynamips
Router emulator for GNS3

### neo4j
Graph for everyone

### bettercap
Tool to testing the possibility of MITM attacks on Bluetooth, Wi-Fi, Ethernet and more.

### ldapdomaindump
Tool to dump Active Directory informations dumper.

### hfsprescue
Tool specialized in recovering data from HFS + partitions.

### conkycolors
Tool developed with the aim of simplifying the configuration of the Conky theme. Some contributions have been made on the official GitHub repository of the software to facilitate its integration into Kaisen Linux.

### sentry-python
Updated tool for integrating GNS3 tools in Kaisen Linux.

### python-cpuinfo
Updated tool for integrating GNS3 tools in Kaisen Linux.

### pystatgrab
Packaged tool because is a dependency of certain features offered by Conkycolors.

### python3-getdevinfo
Repackaged to make it compatible with Kaisen Linux, is a dependency on ddrescue-gui.

## Source of packages
All the sources of the packages can be found here:

https://gitlab.com/kaisenlinux/packages

