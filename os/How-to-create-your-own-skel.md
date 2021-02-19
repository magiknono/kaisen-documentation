# How to create your own default profile for user configurations (skel)?

## What is that?
The default profile (commonly called skel) is a folder in which we drop configuration files, for example the terminal configuration, location of icons on the desktop etc.  
The "skeleton" configurations (those to be made by default) are generally located in the `/home/$USER/.config` folder or other hidden folder or file. You will therefore have to copy the content that interests you in the folder provided for this purpose (process).  Search on Google or the name of the software or interface in your files hidden at the root of your user directory, to know how to copy what interests you.

## Operation
Kaisen Linux implements all pre-configuration of graphical interfaces by this means (via the /etc/skel folder). You can however modify or indicate the location of your pre-configurations to have your own default profile.  
All Kaisen Linux default profiles are installed by the kaisen-skeleton package. This same package installs the skel_user directory in /etc. This folder is empty, but will be used to create your own default profile.  

## Process
I advise you to only use the `/etc/skel_user` folder because even when updating packages on the distribution, this folder will be backed up and restored automatically during the package update process so you don't lose your configurations.

### With useradd command only
If you only want to create one user, no need to modify the configuration files. With the useradd command, you can with the -k option specify the location of the skel folder. You need to do this: `sudo useradd -k /etc/skel_user username && sudo passwd username`.  

### Edit adduser configuration files
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

### Edit useradd configuration files
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


