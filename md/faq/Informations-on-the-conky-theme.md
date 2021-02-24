# Informations on the conky theme

## How is conky installed?
Conky is installed as a dependency of the package associated with your GUI. The conky configuration is then copied to `/etc/skel` and this automatically copied to the `/home/$USER` directory of all users on the system.  

## How to update conky?
In case you are using the default conky theme provided by your GUI, you don't have to do anything. For example, if you are using MATE, when the kaisen-mate package is updated, the conky theme will also be updated automatically!

## Launch conky with a custom theme
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

## Disable conky launch
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

## Problems with KDE desktop
### Explanations
I have seen some issues with KDE.  
The conky is initially configured to be completely transparent and integrated into the wallpaper. KDE does not natively allow to do this, to make its integration possible, I used the software feh which via a script in `/usr/share/kaisen-kde` will read the file `~/.config/plasma-org.kde.plasma.desktop-appletsrc` to determine the wallpaper image and display it.  
Unfortunately today, I have no way to completely correct this problem (unless you run the script all the time, which has a significant impact on performance), this section will aim to help you fully customize the KDE environment provided according to your settings.

### Problems
However, this technique has a limit. Although the main problem is bypassed, the wallpapers in slideshow mode are not updated via the script, and would imply relaunching it at each image change. The user parameters being very personal, it is impossible for me to correctly determine the refresh sequence.  

### Resolution
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

## Relaunch conky manually
Sometimes, Conky may not automatically relaunch after a package update. To relaunch it, it is very simple. Open a terminal window, and type this command:  

```bash
conky&
```
Next this command, press `ctrl +D` until closing the terminal. Conky is now relaunched.