# Menu and tools overview

## Role of the applications menu

The application menu on Kaisen Linux is custom built and categorized and is updated very often. The main reason for this menu so big and consequent is to be able to indicate to the user which tools are at its disposal classified by category.

## Launchers

### Graphical applications

Some launchers like Gparted or Wireshark are launchers for graphical applications and these tools can be launched directly via the menu, if root rights are required, the session password will be requested (by sudo) and will open the software directly as root as if it were run as root from the terminal.

### CLI applications

The CLI (Command Line Interface, therefore launching with the terminal) launchers have for a very large majority a different behavior. Since the overwhelming majority of command line tools have multiple options and user parameters (e.g. ls with ls -a ls -l etc ...), it is too complicated to make a launcher by option offered by the software. The software therefore returns a man page or a help page to indicate how the tool is used.

### Icons next to the launchers

The icons next to launchers (applications) also have their meaning. Each graphic tool has its icon as its logo. The launchers of applications that can be used on the terminal have a terminal as their icon. This is to indicate to the user that this is a command line tool or a graphical tool.  

In the context of veracrypt for example, the command line executable as well as the graphical executable are integrated by default. So there is a launcher for the graphical launcher and a launcher for command line use.

## Layout

The applications menu consists of two menus:

### User applications

The user applications menu is the default menu in this category. It is in this menu and all these sub-menus (Internet, Office, Development, etc.) that all the graphical application launchers that you will install via a package will put. Some software integrated by default in Kaisen Linux like VLC, LibreOffice, Qbittorrent, Firefox, and VScodium to name a few, are however stored in this menu, creating a specific category in the Kaisen Linux menu was not useful in my opinion. , and would have overloaded this menu for nothing.

### Kaisen Linux

It is in this menu where all the launchers of the software integrated in Kaisen Linux for the administration of systems and networks and tools for troobleshooting of all kinds are stored. This menu is updated very often to add launchers when there are new tools, improve the services menu etc. You can add as many launchers as you want, but do not modify the menu itself, otherwise you will lose your customizations, or you will not have the updates of this menu (choice to be made at the time of the update of the menu package if the menu configuration files are modified).

## Kaisen Linux submenus

The Kaisen Linux submenus are composed like this:

### Tools for administrators

This category is split into two categories, network tools and system tools.  
Network tools are divided into several categories such as DNS (DNS diagnostic tools), PCAP (frame capture tools), SSL (TLS certificate analysis) and many others. The tools present in the network tools section are mainly diagnostic and troubleshooting tools on almost all layers of the OSI model. Some security tools such as Nmap or Wireshark are integrated, even if they are used a lot in offensive security, they can also be major assets when securing an IS.  
The system tools are mainly remote administration, backup and virtualization (level 2), containerization, automation tools. It is therefore a category purely focused on the administration of Windows and Linux systems. Tools like Ansible, Docker, parallel-ssh, rsync, zsync to name a few are classified into this category and subcategories.

### Tools for technicians

In this menu, are stored all the tools dedicated to the maintenance of computers and their hardware peripherals and operating systems. Several subcategories exist in this menu like disk scan, data recovery, mount tools etc ... Tools like gsmartcontrol, gparted, ddrescue, testdisk, photorec can be found. These tools can also be used by system administrators as part of some of their functions and not just by IT technicians. Data and disk encryption tools are also classified as well.

### Various tools

In this menu, are stored the launchers that cannot be entered in the menu for system and network administrators or technicians, because they are too generic. Can be found there for example midnight commander, progress, and also some scripts developed for Kaisen Linux like for example, the kaisen-interface-switcher and kaisen-update (automation of updates and cleaning of non-essential packages). The kaisen-interface-switcher as well as kaisen-update can be launched directly via the menu because they do not require specific arguments to run.

### Filesystems

The menu for file systems is a menu that allows to simply reference the tools and commands that can be used to administer, repair, create, diagnose different file systems such as BTRFS, ExFAT, NTFS, XFS, EXT4 etc ... In this category, is contained for example the commands mkfs (create a filesystem on a partition), fsck (repair the filesystem of a partition) etc ...
These launchers open a full help or man page.

### Services

This menu has been specially designed to simplify the management of services in a simple way. All the services added by the tools present by default in the distribution are disabled for performance and resource saving reasons. Launchers point to scripts in / opt / services, and are sorted by the name of the service, for example, Avahi, 2ping, etc. Certain categories like containerization as well as virtualization encompass multiple launchers. For example in virtualization, the services for QEMU / KVM, VirtualBox and VMWare are arranged here, this allows to reduce the size of the menu. There are also two additional scripts that allow them to turn everything on or off, to avoid having to manually turn each service on or off in the categories. On these two scripts, logical conditions exist to allow you to run these scripts even if the commands executed by this script return an error because the service does not exist. Scripts can also be started manually with the terminal, but are not intentionally present in /usr/sbin or /sbin because they are intended to be used from the menu (which will only reference the launchers of the installed services).

## Dynamic menu update

All launchers of each category are present in the menu only if the package associated with the program executed by the launcher is present on the system. So if you uninstall a package, or use the ISO dedicated to the rescue system, only the launchers associated with installed software will be listed. This behavior is the same as for the services menu, the scripts will still be present in /opt/services but will no longer be listed in the menu.