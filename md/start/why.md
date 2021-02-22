# Why use Kaisen Linux ?

## Kaisen Linux objective

Kaisen Linux aims to provide a comprehensive tool base for systems and network administrators, DevOps engineer, systems/network/security engineers etc, as well as to meet the needs of IT technicians with tools to perform many operations.
It was originally designed and built as a rescue system as its primary function, but finding it too "classic and warmed up", I decided to develop a wider and more extensive distribution than a "simple" rescue system with tools such as containerization, virtualization, diagnostic tools for network configurations and services such as DNS, etc.
This is why the slogan of distribution has gradually become "The distribution for professional IT". IT is a generic term widely used in France (the country of origin of Kaisen Linux) to designate technicians/administrators/systems and network engineers.
I therefore combined tools intended for system and network administrators as well as technicians within the same distribution to meet the greatest number of needs. In small businesses, systems administrators are also computer technicians.
This allowed to extend the main function of system rescue, while providing diagnostic tools mainly for the network section.
You will find on this section, some arguments to distinguish it from other more or less similar projects.

## Base

Kaisen linux is based at Debian GNU/Linux (testing version) distribution. The system uses Debian packages, however custom packages follow the Debian model as much as possible and are tested before production to limit bugs. Kaisen Linux respects the FHS (File Hierarchy System) standard to remain as faithful as possible to this magnificent distribution that is Debian.

## Designed for beginners

Kaisen Linux is designed to be as simple as possible, which is part of why the MATE KDE, LXDE and XFCE GUI were chosen and the menus are also expanded to list all the tools present by category and subcategory. This will surely facilitate access and management of distribution as well as integrated tools.

## Improved live system

Kaisen Linux offers a live system with several options such as persistence, RAM loading and forensic mode. Examples of usage and their purposes can be found in the Live informations section.

## Improved terminal

The terminal of Kaisen Linux is based on zsh and has been modified using many scripts to improve for example the auto-completion such as for example the correction of case errors, allows to navigate in the directories with the tab key, list the packages to install when ordering **apt-get install** and many others!

## Installable

Kaisen Linux has the functionality of being installed on a hard drive for daily use or to create machines dedicated to certain tasks that can be performed with Kaisen Linux. The installation is possible even in UEFI and certain tasks during the installation have been automated to facilitate the installation of the distribution, automate it a little, and customize the installation. The textual installation (reduced graphics) of classic Debian as well as the installation in graphical mode are incorporated to meet a maximum of tastes.  
More details here: Kaisen Linux installation

## Number of tools

Kaisen Linux has more than 300 built-in tools for system administrators and also has full management of many file systems, such as tools for XFS, OCFS, F2FS, EXT, NTFS, Exfat, FAT and others, with maintenance tools of these integrated file systems! More details here: List of tools Some tools are not listed in the distribution menu or even on the documentation, but the most important are listed here.

## Kernel custom

The Kaisen Linux kernel has been recompiled and optimized as much as possible to optimize the system, secure it and have the latest patches and hardware support. Today, the kernel integrated into Kaisen Linux allows support for the exfat file system, and thus improves the support of original Windows hardware for technicians such as, for example, external disks. The kernel sources and all the dependencies for recompiling them have been integrated into the system so that you can compile your own kernel, from the base of Kaisen Linux!

## Support

Kaisen Linux offers support for anyone and questions, today, this supports is present by mail and soon by a forum.

## System free

Kaisen Linux is free and will stay !

## Rolling updates

Since its release in stable version, Kaisen Linux is updated continuously, possible to our repository created for Kaisen Linux. This allows if you choose to install the system, to be able to update the whole system without having to reinstall it, it is an important stage of the project which will remove big constraints to the users concerning the maintenance of the system.
However, if you only use Kaisen Linux in live version, you will have to download the most up-to-date ISO if necessary, even if you do the updates on live, they will disappear on the next restart (USB persistence has its limits).
This can quickly become binding, unfortunately there is no solution to this on the live system.