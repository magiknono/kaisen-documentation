# How to change graphical interface?

## To do what?
The KDE, LXDE and XFCE interfaces arrived some time after the first versions, and migrating to a new graphical interface is not easy.
You have to purge the old one (not mandatory, but avoids overloading the system and avoiding potential conflicts), and install the new interface.  
A package has been created for each GUI officially supported by Kaisen Linux installing all of the predefined configurations.  
For this a tool has been created to do it simply and fully automated!  
This tool was also created so that the user does not come to reinstall his OS in the event of difficulties.

## kaisen-interface-switcher

The script since Kaisen Linux revision 1.4 is designed when the script starts up (after all checks have been made), to update itself if a new, more recent version of the script (installed by the kaisen-kde package, kaisen-lxde, kaisen-mate, kaisen-xfce depending on your current GUI). This is intended if you do not update often, to be able to change your interface and update the list of packages to uninstall. The main purpose of this is to automate the task even more, saving you time.  
The kaisen-interface-switcher script allows you to change your graphical interface by installing the one of your choice by removing your current graphical interface. It can be started by the `sudo kaisen-interface-switcher` command.  
The first versions of this script reinstalled for each user the default profile of each interface (execution of the kaisen-interface-switcher command during the script) but this lost the personalization of the user if he wishes to reinstall his graphical interface. 'original (e.g. switching from MATE to KDE then from KDE to MATE).  
This problem has been corrected by replacing the installation of a default profile per interface with a package installing the default profile for all graphical interfaces (see [kaisen-skeleton](https://kaisenlinux.org/documentation/packages). You can therefore change the graphical interface at will, without losing a single one of your settings!

## Prerequisites
Since revision 1.4, the `kaisen-interface-switcher` script has been corrected to fix some issues that occurred when using the script (eg when using wifi or with wrong proxy settings).  
To be able to use kaisen-interface-switcher, the script will check two things:  
- Connectivity to APT (if behind a proxy, only the configuration of the APT proxy is sufficient)
- The network interface through which network packets pass.
The script will remove all packages installed by your current GUI, it will also remove network-manager, and without network-manager the wifi cannot work. This therefore prevented the installation of your new graphical interface, and the old one was deleted, the next time you restart your machine, you would find yourself without a graphical interface.  
So I added as many checks as possible to limit the risk of losing the graphic interface during the process. I strongly advise against modifying the script yourself to modify checks or the like unless you know exactly what you are doing.  

## Working
The script will automatically save the graphics settings and profile of all system users (except root) who have a home directory in /home, regardless of the UID number.  
The directories will be saved in `/usr/share/kaisen-interface-switcher/$users/INTERFACE_NAME` depending on the interface selected (and therefore the script launched, therefore MATE, KDE, LXDE or XFCE version).  
The selected interface will be installed after uninstalling the initial interface.  
Once the installation is complete, if automatic backups of the interface installed by the script exist in the dedicated directory, they will be copied to the users present on the system. In the event of an error (a user has been deleted in the meantime, as well as his home directory, or other reason), the content of the `/etc/skel` folder will be copied (only where it failed, if possible).