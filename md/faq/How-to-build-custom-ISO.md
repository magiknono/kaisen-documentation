# How to build custom ISO ?

# kaisen-build
A package called kaisen-build has been developed to allow you to build your custom ISO based on Kaisen Linux. It is also this package and the tools it installs that we use to build official releases. The main objective of building your own ISO is to create your own live system and have one more up to date while awaiting official publications from the Kaisen Linux team.
The second objective of doing this is to integrate into your live system tools which are not integrated by default in Kaisen Linux and which need to use them on a live system.  
Note that creating a custom ISO also includes the Debian installer (default configuration provided by kaisen-build) customized by us (graphic theme, file systems, partitioning, preseed etc ...). Doing this is not useful for having a newer installable system, just do apt update && apt upgrade to have your system constantly updated and with your software installed.
We advise you to use kaisen-build in order to create your own live system.

## The different variants

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

## How to proceed?

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

## Further information

### Support

Please be aware that **we will not provide support to users wishing to create their own ISO**. Not that we don't want to help you, but we are very busy professionally and on the constant development of Kaisen Linux.

### Warning on personal images

One of the strengths of the GNU/Linux world, which we follow to give our users the choice to do what they want with the environment we provide them so that they can adapt it to their needs, is also a problem because the integration of malware, trackers or others can be facilitated.  
To avoid this kind of inconvenience, do not download an ISO image outside the following two mirrors: https://iso.kaisenlinux.org and https://kaisen.lf.je/index.html  
Also check the SHA256 checksums indicated on the official website.
So keep your images created by yourself for yourself, and do not use ISOS images whose origin thereof is not a certainty (check the checksums on the site to be sure).

## Update CUSTOM branch

If you want to start from scratch or update the CUSTOM branch to have our latest pre-configuration (although changes are rare), you must uninstall and completely purge the package then reinstall it.  
To do this, you have to run this command:  

```bash
sudo apt remove --purge kaisen-build
```

You will just have to reinstall the package and you will be on the last pre-configuration of the CUSTOM branch.  
Be careful, this action will delete your settings from the CUSTOM branch (even the automated backups, so that they are not reapplied when the package is reinstalled). Be sure what you are doing, manually save your settings beforehand if you want to keep your settings.