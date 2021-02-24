# FAQ

- **FAQ** :       
    - [What are the revisions of the rolling version ?](#what-are-the-revisions-of-the-rolling-version)
    - [Why are all additional services disabled by default ?](#why-are-all-additional-services-disabled-by-default)
    - [How to build a custom ISO ?](#how-to-build-a-custom-iso)
    - [Why no sources on some packages ?](#why-no-sources-on-some-packages)
    - [How to update GUI default profile ?](#how-to-update-gui-default-profile)
    - [Informations on the conky theme](#informations-on-the-conky-theme)
    - [Informations on the rolling version](#how-do-i-know-the-number-of-the-rolling-version-i-use)
    - [Why root account is disabled by default ?](#why-root-account-is-disabled-by-default)
    - [How to switch to root directly with the ZSH terminal ?](#how-to-switch-to-root-directly-with-the-zsh-terminal)
    - [How to change the graphical interface ?](#how-to-change-graphical-interface)
    - [How to update Kaisen Linux Rolling ?](#update-kaisen-linux-rolling)
    - [How to change login wallpaper ?](#how-to-change-login-wallpaper)
    - [Why create user accounts only on /home ?](#why-create-user-accounts-only-on-home)
    - [Why KDE installed with lightdm by default ?](#why-kde-installed-with-lightdm-by-default)
    - [How to create your own default profile for user configurations (skel) ?](#how-to-create-your-own-default-profile-for-user-configurations-skel)
    - [How do I go back to bash ?](#how-do-i-go-back-to-bash)

## What are the revisions of the rolling version ?

### Explanation
Revisions (eg 1.1, 1.2 and so on) are simply a "snapshot" of the project at one point in time.  
The revisions of the rolling version are therefore ISOS updated at a given time when the system has had improvements, additions of tools, bug fixes etc ...

### APT OS update
Since the rolling version and therefore the arrival of the official Kaisen Linux package repositories, the entire system can be updated via APT.  
When switching to a "new version", the base-files package is updated and the / etc / os-release file and the conky will show the current revision.  

### New ISOS
New ISOS are therefore created with each revision to fix any errors on the live system, improvements on the start-up entries, support for a new language, integration of new tools integrated over time on the live etc ...  
Even if you have downloaded Kaisen Linux 1.3 and installed the system, and ISOS 1.4 has just been released, you don't have to completely reinstall the system, using the kaisen-update command will suffice to change from revision 1.3 to 1.4 by updating the packages.

---
## Why are all additional services disabled by default ?

### Explanation
We call additional services, services installed by software provided in Kaisen Linux. The reason is simple. It is about optimizing the performance and resources used by the system.  
When building the ISO, all services are disabled with systemd hooks, which allows once the ISO is built, to be able to use Kaisen Linux with only 500MB to 550MB of RAM on the live as well as on the installed system , which is suitable for very small configurations.  
We also have the vision, despite the wide range of tools provided by default, to let the user choose to use only what they need, so let these services run in the background, is useless and consumes resources unnecessarily. The tool is present (because we provide a complete live), but if not necessary, it therefore does not encumber any resource (except the disk space used by this program).

### Management of these services
So we have to list these services, as well as to facilitate their management (activation, deactivation) created the **"kaisen-services-management"** package which installs scripts which will be referenced on the menu in the **"Services"** tab which will allow activate and deactivate the services listed by sub-tabs for example **"zfs-fuse, avahi, cups etc ..."** as well as two scripts to activate or deactivate everything.

### Problem resolution
If you therefore have an error telling you that the service is not indicated or certain programs (TeamViewer for example) start but are not functional, try to activate the service corresponding to this program (via the menu or simply by typing yourself systemd commands).
If that doesn't solve your problem, contact support.

---
## How to build a custom ISO ?

### kaisen-build
A package called kaisen-build has been developed to allow you to build your custom ISO based on Kaisen Linux. It is also this package and the tools it installs that we use to build official releases. The main objective of building your own ISO is to create your own live system and have one more up to date while awaiting official publications from the Kaisen Linux team.
The second objective of doing this is to integrate into your live system tools which are not integrated by default in Kaisen Linux and which need to use them on a live system.  
Note that creating a custom ISO also includes the Debian installer (default configuration provided by kaisen-build) customized by us (graphic theme, file systems, partitioning, preseed etc ...). Doing this is not useful for having a newer installable system, just do apt update && apt upgrade to have your system constantly updated and with your software installed.
We advise you to use kaisen-build in order to create your own live system.

#### The different variants

We have the following variants:

```bash
KDE
LXDE
MATE
XFCE
SR
CUSTOM
```

ISO image type:

```bash
KDE = Live system ISO and included installer with KDE GUI only
LXDE = Live system ISO and included installer with LXDE/Openbox GUI only (LXDE by default)
MATE = Live system ISO and included installer with MATE GUI only
XFCE = Live system ISO and included installer with MATE GUI only
SR = Live system ISO and not installer included with LXDE/Openbox GUI only (LXDE by default)
CUSTOM = Live system ISO and included installer for user ISO settings
```

These variants include tools:

```bash
KDE = All metapackages are included on this variant
LXDE = All metapackages are included on this variant
MATE = All metapackages are included on this variant
XFCE = All metapackages are included on this variant
SR = All technicians, filesystems, miscellaneous, firmwares are included on this variant
CUSTOM = Variant pre-configured, but no integrated tool. Variant reserved for the user, the user parameters will be kept.
```

### How to proceed?

Install kaisen-build with the `sudo apt install kaisen-build` command. The package will install live-build (a set of scripts used by Debian to build their official ISO images, which we also use), live-manual and live-doc which will help you get started with the live-build configuration and customize your ISO, live-boot to start your live.  
Once the package is installed, in `/home/*` you will have a folder named **kaisen-build**.  
In the `kaisen-build/variant/` folder, there is the folder named **CUSTOM**. This folder is reserved for you so that you can make your ISO live and installable (these options are by default in the live-build configuration file that I do not recommend that you modify), this file is complete and some options are already preconfigured like official Kaisen Linux packages, GUIs, as well as the Debian Installer [preseed LINK TO ADD](#) file.  
In the event of an update, or even in the event of accidental deletion of the package and after a reinstallation, all the modifications made on the custom branch will be kept, thanks to an automated backup and automatic restoration of the CUSTOM branch in the installation process of the package.  
This is why I strongly advise you not to create your ISO by customizing another variant than CUSTOM because your modifications will be lost in the event of an update of kaisen-build.  
Once your branch is fully configured, you can run a compilation at the root of the kaisen-build folder, with the command:

```bash
sudo ./kaisen-build build CUSTOM 
```

If you want to put a version number to your ISO, put this:  

```bash
sudo ./kaisen-build build CUSTOM 1.0
```

Version 1.0 is an example, but you can put whatever you want, I advise you not to put too many letters and numbers because if the name of the ISO volume exceeds 32 characters, the compilation will crash. The name of the ISO volume is "Kaisen Linux Rolling $variant $version" ($variant corresponds here to CUSTOM and $version corresponds here to 1.0), in the example, the name of the ISO volume will be Kaisen Linux Rolling CUSTOM 1.0.

### Further information

#### Support

Please be aware that **we will not provide support to users wishing to create their own ISO**. Not that we don't want to help you, but we are very busy professionally and on the constant development of Kaisen Linux.

#### Warning on personal images

One of the strengths of the GNU/Linux world, which we follow to give our users the choice to do what they want with the environment we provide them so that they can adapt it to their needs, is also a problem because the integration of malware, trackers or others can be facilitated.  
To avoid this kind of inconvenience, do not download an ISO image outside the following two mirrors: https://iso.kaisenlinux.org and https://kaisen.lf.je/index.html  
Also check the SHA256 checksums indicated on the official website.
So keep your images created by yourself for yourself, and do not use ISOS images whose origin thereof is not a certainty (check the checksums on the site to be sure).

### Update CUSTOM branch

If you want to start from scratch or update the CUSTOM branch to have our latest pre-configuration (although changes are rare), you must uninstall and completely purge the package then reinstall it.  
To do this, you have to run this command:  

```bash
sudo apt remove --purge kaisen-build
```

You will just have to reinstall the package and you will be on the last pre-configuration of the CUSTOM branch.  
Be careful, this action will delete your settings from the CUSTOM branch (even the automated backups, so that they are not reapplied when the package is reinstalled). Be sure what you are doing, manually save your settings beforehand if you want to keep your settings.

---
## Why no sources on some packages ?

### Softwares non-free
Software like TeamViewer, Anydesk for example do not have their sources open. We cannot therefore supply them via apt-get source.  

### Free software
Some software such as codium, balena-etcher-electron to name a few, are packages downloaded directly from official GitHub sources in the releases section. Software developers have already tampered with this software, so we don't have to package it ourselves.  

### Check the authenticity of the packages
The safest and most efficient way to check the authenticity of the sourceless packages that we provide to you is to check via the official GitHub repository of the software (for example codium or balena-etcher-electron) the checksum in sha256, md5 or sha1 with sha256sum, md5sum or sha1sum the package we provide as well as the one on GitHub. The amounts are normally the same because the file has not been modified.  
You can find the .deb files added for Kaisen Linux and the sha256, md5, and sha1 checksums of these packages (this also includes packages developed for distribution as well as packages recompiled for distribution) [here](https://kaisendeb.lf.je/dists/kaisen-devel/main/binary-amd64/Packages):  
https://kaisendeb.lf.je/dists/kaisen-devel/main/binary-amd64/Packages

---
## How to update GUI default profile ?

### In what cases?
You might need to update the default profile as provided on the live CD if updating the kaisen-skeleton package.  
However, there are a few things you should know before updating the skel and the two methods of doing so.

### Simple method
A command called kaisen-update-skel exists and allows you to copy all the contents of /etc/skel to /home/* and /root (by reading the file /etc/passwd). However, this method has a problem, it erases all the customization of the user, namely terminal, configurations of the graphic environment (location of icons, etc.), configuration of the .zshrc file (and possibly the conky theme).  
This command therefore overwrites all the modified configurations (if the same file is present in the skel), to be used with caution and only if you know what you are doing.

### Manual method
This method requires only going to find the files that we want to update and to integrate in /etc/skel and copy them in /home/* or /root.  
This gives you more control over what we update and decreases the chances of your configurations being overwritten.
Note, however, that this method is the least simple, but the most refined, it is not suitable for less experienced users.

### When to do it?
When the kaisen-skeleton package is updated, it means that the default GUI profile has been updated. The kaisen-update-skel command can be used to copy new content from /etc/skel to /home/* and /root.  

### Profile created in /etc/skel_user
If you have created your default profile as mentioned [here](https://kaisenlinux.org/documentation/how-to-create-your-own-skel), you can run the `kaisen-update-skel-user` command to update your profile on all users present on the system.

---
## Informations on the conky theme

### How is conky installed?
Conky is installed as a dependency of the package associated with your GUI. The conky configuration is then copied to `/etc/skel` and this automatically copied to the `/home/$USER` directory of all users on the system.  

### How to update conky?
In case you are using the default conky theme provided by your GUI, you don't have to do anything. For example, if you are using MATE, when the kaisen-mate package is updated, the conky theme will also be updated automatically!

### Launch conky with a custom theme
It's easy to run your own conky setup. You must modify the conffile `/etc/xdg/autostart/conky.desktop` This file contains this by default:

```bash
[Desktop Entry]
Name=Kaisen Linux Conky
Exec=/usr/bin/conky
Hidden=false
Type=Application
X-KDE-Autostart-enabled=true
X-LXDE-Autostart-enabled=true
X-MATE-Autostart-enabled=true
X-XFCE-Autostart-enabled=true
```

In this example, your conky configuration file will be called: `.myconkyconf`

You will simply have to replace the file like this:

```bash
[Desktop Entry]
Name=Kaisen Linux Conky
Exec=/usr/bin/conky --config ~/.conkyconf
Hidden=false
Type=Application
X-KDE-Autostart-enabled=true
X-LXDE-Autostart-enabled=true
X-MATE-Autostart-enabled=true
X-XFCE-Autostart-enabled=true
```

The next time you start conky, your own configuration will be executed. If it does not perform as you expect, it could probably be an error in your configurations.  
When updating the kaisen-kde, kaisen-lxde, kaisen-mate or kaisen-xfce package, select the option "N" or "O" to keep your configurations.

### Disable conky launch
You cannot therefore remove the conky-all package, otherwise you risk removing your entire GUI.  
But do not panic ! You have a very easy way to not start conky even if it is installed.  
You must go and modify the file: `/etc/xdg/autostart/conky.desktop`.  

This file contains this by default:

```bash
[Desktop Entry]
Name=Kaisen Linux Conky
Exec=/usr/bin/conky
Hidden=false
Type=Application
X-KDE-Autostart-enabled=true
X-LXDE-Autostart-enabled=true
X-MATE-Autostart-enabled=true
X-XFCE-Autostart-enabled=true
```

Just replace the line `Hidden=false` with `Hidden=true` to completely disable launching Conky (the process won't even be started, conky, so it won't consume any resources.)  

So the file will look like:

```bash
[Desktop Entry]
Name=Kaisen Linux Conky
Exec=/usr/bin/conky
Hidden=true
Type=Application
X-KDE-Autostart-enabled=true
X-LXDE-Autostart-enabled=true
X-MATE-Autostart-enabled=true
X-XFCE-Autostart-enabled=true
```

When updating the kaisen-kde, kaisen-lxde, kaisen-mate or kaisen-xfce package, select the option "N" or "O" to keep your configurations.  

### Problems with KDE desktop
#### Explanations
I have seen some issues with KDE.  
The conky is initially configured to be completely transparent and integrated into the wallpaper. KDE does not natively allow to do this, to make its integration possible, I used the software feh which via a script in `/usr/share/kaisen-kde` will read the file `~/.config/plasma-org.kde.plasma.desktop-appletsrc` to determine the wallpaper image and display it.  
Unfortunately today, I have no way to completely correct this problem (unless you run the script all the time, which has a significant impact on performance), this section will aim to help you fully customize the KDE environment provided according to your settings.

#### Problems
However, this technique has a limit. Although the main problem is bypassed, the wallpapers in slideshow mode are not updated via the script, and would imply relaunching it at each image change. The user parameters being very personal, it is impossible for me to correctly determine the refresh sequence.  

#### Resolution
The problem of updating images in slideshow mode with Conky can be solved either by disabling Conky or by loading a custom configuration according to your settings.  
Be careful however, the script to run feh consumes resources, running it constantly or too often can significantly reduce the performance of your machines.  

Here are several examples of how to modify Conky for slideshow mode:
The slideshow refreshes every minute, and Conky should do the same, so replace in the `.conkyrc`:

```bash
${texeci 999999 /usr/share/kaisen-kde/conkyfeh}
```

By:

```bash
${texeci 60 /usr/share/kaisen-kde/conkyfeh}
```

The slideshow refreshes every ten minutes, and Conky should do the same, so replace in the .conkyrc:

```bash
${texeci 999999 /usr/share/kaisen-kde/conkyfeh}
```

By:

```bash
${texeci 600 /usr/share/kaisen-kde/conkyfeh}
```

Once you have edited the file, copy the `~/.conkyrc` file to for example `~/.conkyrc_custom` and modify the `/etc/xdg/autostart/conky`.desktop file as mentioned [here](#launch-conky-with-a-custom-theme). When restarting the session, the new congiuration will be loaded.

Alternatively, you can disable conky launch if you don't want to reconfigure the conky theme, as shown [here](#disable-conky-launch).

### Relaunch conky manually
Sometimes, Conky may not automatically relaunch after a package update. To relaunch it, it is very simple. Open a terminal window, and type this command:  

```bash
conky&
```
Next this command, press `ctrl +D` until closing the terminal. Conky is now relaunched.

---
## How do I know the number of the rolling version I use?

### With "cat" method
Just do the command `cat /etc/debian_version` and read the number marked after Rolling to know your version number.

### With lsb-release
Just do the command `lsb_release -r` and read the number marked after Release to know your version number. 
The `lsb-release -a` command give more informations at release.

---
## Why root account is disabled by default ?

### The disable explanation
Thanks to the preseed file used by the insllator, we deactivate the password request for the root user.  
The reason is very simple. As a security measure, on UNIX systems, never use the root account but rather use sudo. This allows the increase of the security of the system (also reduces the risks of malware infections), allows to have better control over the actions of the user as well as the traceability of his actions.  
We have also based our entire default profile for normal users, especially with zsh, which is the default shell for normal users, but is not that of root (that of root is bash, to facilitate chroot systems).  
We have therefore chosen to deactivate this possibility.

### So how do you get root rights?
By default, when installing the system with a user and a password entered (which is not offered when we enter a password for root, because root becomes our current user), the installer puts default this user in the sudo group without any restriction on the machine, the sudo command gives you all access.  
We have not, despite our attachment to system security, not disabled the possibility of putting a password on root after installation (sudo passwd root command) nor have we disabled the sudo su or su root.  
We believe that as users, you are free to use the system as you see fit, without any particular constraints.
However, we always advise you to use sudo when you need root is to leave root disabled (without password), this can save you from some errors that can harm your system.

### Advice
We do not recommend using the root account from a graphical session.  
And this because increases the risk of making a false manipulation, creating directories with root rights when root is not necessary, and others.  
Some scripts developed for Kaisen Linux are also developed only for regular user accounts (even without sudo rights), because root should not be used from a graphical session.  
This will surely never change, admittedly I remove you by default the possibility to put a password on root, but you can entirely use it in command line via the commands sudo `su -` or `sudo -i`.  
Using the root account from a graphical session is unnecessary, dangerous and stupid. It can also cause problems for some scripts developed for Kaisen like for example the kaisen-interface-switcher or any other script saving standard user configurations. You have been warned.  

### Conclusion
Use sudo when you need root.  
Log in as root with the `sudo su -`, `sudo -i`, and su command (su command only works if you have set a root password with the passwd root command).

---
## How to switch to root directly with the ZSH terminal ?

### Explanation
By default, the root user defaults to bash because it is not expected in good practice to be used for human operations, except in cases where there is no choice. It also allows us to be able to chroot at a specific location in the system without having any errors.

### Solution
To go directly to a root terminal, type the following command:

```bash
sudo zsh
```

---
## How to change graphical interface ?

### To do what?
The KDE, LXDE and XFCE interfaces arrived some time after the first versions, and migrating to a new graphical interface is not easy.
You have to purge the old one (not mandatory, but avoids overloading the system and avoiding potential conflicts), and install the new interface.  
A package has been created for each GUI officially supported by Kaisen Linux installing all of the predefined configurations.  
For this a tool has been created to do it simply and fully automated!  
This tool was also created so that the user does not come to reinstall his OS in the event of difficulties.

### kaisen-interface-switcher

The script since Kaisen Linux revision 1.4 is designed when the script starts up (after all checks have been made), to update itself if a new, more recent version of the script (installed by the kaisen-kde package, kaisen-lxde, kaisen-mate, kaisen-xfce depending on your current GUI). This is intended if you do not update often, to be able to change your interface and update the list of packages to uninstall. The main purpose of this is to automate the task even more, saving you time.  
The kaisen-interface-switcher script allows you to change your graphical interface by installing the one of your choice by removing your current graphical interface. It can be started by the `sudo kaisen-interface-switcher` command.  
The first versions of this script reinstalled for each user the default profile of each interface (execution of the kaisen-interface-switcher command during the script) but this lost the personalization of the user if he wishes to reinstall his graphical interface. 'original (e.g. switching from MATE to KDE then from KDE to MATE).  
This problem has been corrected by replacing the installation of a default profile per interface with a package installing the default profile for all graphical interfaces (see [kaisen-skeleton](https://kaisenlinux.org/documentation/packages). You can therefore change the graphical interface at will, without losing a single one of your settings!

### Prerequisites
Since revision 1.4, the `kaisen-interface-switcher` script has been corrected to fix some issues that occurred when using the script (eg when using wifi or with wrong proxy settings).  
To be able to use kaisen-interface-switcher, the script will check two things:  
- Connectivity to APT (if behind a proxy, only the configuration of the APT proxy is sufficient)
- The network interface through which network packets pass.
The script will remove all packages installed by your current GUI, it will also remove network-manager, and without network-manager the wifi cannot work. This therefore prevented the installation of your new graphical interface, and the old one was deleted, the next time you restart your machine, you would find yourself without a graphical interface.  
So I added as many checks as possible to limit the risk of losing the graphic interface during the process. I strongly advise against modifying the script yourself to modify checks or the like unless you know exactly what you are doing.  

### Working
The script will automatically save the graphics settings and profile of all system users (except root) who have a home directory in /home, regardless of the UID number.  
The directories will be saved in `/usr/share/kaisen-interface-switcher/$users/INTERFACE_NAME` depending on the interface selected (and therefore the script launched, therefore MATE, KDE, LXDE or XFCE version).  
The selected interface will be installed after uninstalling the initial interface.  
Once the installation is complete, if automatic backups of the interface installed by the script exist in the dedicated directory, they will be copied to the users present on the system. In the event of an error (a user has been deleted in the meantime, as well as his home directory, or other reason), the content of the `/etc/skel` folder will be copied (only where it failed, if possible).

---
## Update Kaisen Linux Rolling

### Classic method
With Kaisen Linux now in rolling mode, the entire system can be updated without having to systematically reinstall it.  

The classic method is to use the following command:

```bash
sudo apt update;sudo apt -y full-upgrade
```

This method is the update method used on Debian and other derivatives.

### Kaisen Linux method
On Kaisen Linux, an update automation script has been created. It uses the classic update method but additionally plans to fix any errors if there are during the update process and automatically removes the no longer used package dependencies. 

To use the Kaisen method, you must type this command:

```bash
sudo kaisen-update
```

---
## How to change login wallpaper ?

### Text edition method
On MATE, LXDE, XFCE and KDE (defined by default by kaisen-kde postinst script), lightdm manages the login wallpaper. 

To change it, place the command:

```bash
sudo nano /etc/lightdm/lightdm-gtk-greeter.conf
```

You should find this:

```bash
[greeter]
background = /usr/share/backgrounds/dna-left/1920x1080.png
theme-name = Kaisen-Dark-Material
default-user-background = /usr/share/backgrounds/dna-left/1920x1080.png
icon-theme-name = Kaisen
default-user-image = /usr/share/icons/Kaisen/kaisen.png
user-background = false
font-name = Cantarell 11
```

Change these lines:

```bash
background = /usr/share/backgrounds/dna-left/1920x1080.png
default-user-background = /usr/share/backgrounds/dna-left/1920x1080.png
```

For example in:

```bash
background = /home/user/Pictures/image.png
default-user-background = /usr/share/backgrounds/dna-left/1920x1080.png
```

Which will give:

```bash
[greeter]
background = /home/user/Pictures/image.png
theme-name = Kaisen-Dark-Material
default-user-background = /home/user/Pictures/image.png
icon-theme-name = Kaisen
default-user-image = /usr/share/icons/Kaisen/kaisen.png
user-background = false
font-name = Cantarell 11
```

### Graphic method
The **lightdm-gtk-greeter-settings** tool is integrated by default on MATE, LXDE, XFCE and KDE to be able to easily change the lightdm settings. This will produce the same result as editing the `/etc/lightdm/lightdm-gtk-greeter.conf` file as the software will modify it to reflect your settings made.

---
## Why create user accounts only on /home ?

### Explanation
By convention (FHS standard), users intended to be accounts for users must have their home directory on /home, as it is intended for that.  
On Kaisen Linux, this convention as on all distributions respecting the standards is respected.  
The kaisen-update-skel scripts as well as the kaisen-interface-switcher, were developed to read with awk all users who have a home directory in a directory in / home via the /etc/passwd file. If you do not respect this standard and are led to use one of these scripts, they will not work normally if at all.  
I am aware that I cannot cover all cases, I try to do it as much as possible, however this kind of scripts can only work correctly by respecting the standards, to avoid any additional problems.  

---
## Why KDE installed with lightdm by default ?

### Explanation
KDE uses SDDM display manager by default.  
I didn't have a problem with that until it started behaving strangely with the `kaisen-interface-switcher` script, and its configuration and customization was complicated.  
For the sake of simplicity and standardization, I decided using the postinst script on kaisen-kde, to change SDDM to LIGHTDM only when installing the package. This will allow you to reset SDDM or other display manager to default, without updating the package or the entire system, modifying your settings.  

### Return to SDDM
#### Universal method
The universal and potentially error-prone method is to modify the `/etc/X11/default-display-manager` file by hand and fill in the new display manager (for this example, replace `/usr/sbin/lightdm` by `/usr/bin/sddm`) and the changes will be visible the next time you start the computer.

### Debian method
You just have to use the `sudo dpkg-reconfigure lightdm` command and select SDDM. This reconfiguration will be visible the next time you restart the computer. I advice this method, because is less error-prone.

---
## How to create your own default profile for user configurations (skel) ?

### What is that?
The default profile (commonly called skel) is a folder in which we drop configuration files, for example the terminal configuration, location of icons on the desktop etc.  
The "skeleton" configurations (those to be made by default) are generally located in the `/home/$USER/.config` folder or other hidden folder or file. You will therefore have to copy the content that interests you in the folder provided for this purpose (process).  Search on Google or the name of the software or interface in your files hidden at the root of your user directory, to know how to copy what interests you.

### Operation
Kaisen Linux implements all pre-configuration of graphical interfaces by this means (via the /etc/skel folder). You can however modify or indicate the location of your pre-configurations to have your own default profile.  
All Kaisen Linux default profiles are installed by the kaisen-skeleton package. This same package installs the skel_user directory in /etc. This folder is empty, but will be used to create your own default profile.  

### Process
I advise you to only use the `/etc/skel_user` folder because even when updating packages on the distribution, this folder will be backed up and restored automatically during the package update process so you don't lose your configurations.

#### With useradd command only
If you only want to create one user, no need to modify the configuration files. With the useradd command, you can with the -k option specify the location of the skel folder. You need to do this: `sudo useradd -k /etc/skel_user username && sudo passwd username`.  

#### Edit adduser configuration files
To make your change permanent, you can modify the adduser configuration files. 

In the `/etc/adduser.conf` file modify the line:

```bash
SKEL=/etc/skel
```

By:

```bash
SKEL=/etc/skel_user
```

With this change, the default folder for the skel will now be /etc/skel_user.
When updating the adduser package, select the option "N" or "O" to keep your configurations.

#### Edit useradd configuration files
To make your change permanent, you can modify the adduser configuration files. 

In the `/etc/default/useradd` file modify the line:

```bash
# SKEL=/etc/skel
```
By (Be careful, the line is commented out, be careful to remove the # at the start of the line to make your modification effective.):

```bash
SKEL=/etc/skel_user
```
With this change, the default folder for the skel will now be `/etc/skel_user`.
When updating the shadow package, select the option "N" or "O" to keep your configurations.

---
## How do I go back to bash ?

### Simple user method
Many users or others who have seen this have had a feeling of disgust over this choice which to them seems "amateur" and illogical. While this bothers me, I don't think bash will become the default terminal for users (non-root, root stayed in bash by default to allow the chroot command to work), and you can fall back on bash.  
Kaisen Linux's default terminal is ZSH installed with the oh-my-zsh framework.  
You are only one user and you only have one account installed, use the following command (as your user and not as root):  

```bash
chsh -s /bin/bash
```

The next time you reconnect to your session, you will be back in bash.

### Multiple user method

#### Useradd command
Type this when adding a user with the useradd command to give them the bash shell by default:

```bash
sudo useradd -s /bin/bash user
```

#### Modify useradd configuration

In the file `/etc/default/useradd`, change the following line:

```bash
SHELL=/bin/zsh
```

In:

```bash
SHELL=/bin/bash
```

After that, with the useradd command the bash shell will be set by default, and you will no longer need to specify -s option.  
When updating the shadow package, select the option "N" or "O" to keep your configurations.

#### Adduser command

Type this when adding a user with the adduser command to give them the bash shell by default:

```bash
sudo adduser --shell /bin/bash user
```

#### Modify adduser configuration

In the file `/etc/adduser.conf`, change the following line:

```bash
DSHELL=/bin/zsh
```

In:

```bash
DSHELL=/bin/bash
```

After that, with the adduser command the bash shell will be set by default, and you will no longer need to specify --shell option.
When updating the adduser package, select the option "N" or "O" to keep your configurations.

