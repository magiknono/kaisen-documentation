# Why KDE installed with lightdm by default ?

## Explanation
KDE uses SDDM display manager by default.  
I didn't have a problem with that until it started behaving strangely with the `kaisen-interface-switcher` script, and its configuration and customization was complicated.  
For the sake of simplicity and standardization, I decided using the postinst script on kaisen-kde, to change SDDM to LIGHTDM only when installing the package. This will allow you to reset SDDM or other display manager to default, without updating the package or the entire system, modifying your settings.  

## Return to SDDM
### Universal method
The universal and potentially error-prone method is to modify the `/etc/X11/default-display-manager` file by hand and fill in the new display manager (for this example, replace `/usr/sbin/lightdm` by `/usr/bin/sddm`) and the changes will be visible the next time you start the computer.

## Debian method
You just have to use the `sudo dpkg-reconfigure lightdm` command and select SDDM. This reconfiguration will be visible the next time you restart the computer. I advice this method, because is less error-prone.