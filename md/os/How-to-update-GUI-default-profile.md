# How to update GUI default profile ?

## In what cases?
You might need to update the default profile as provided on the live CD if updating the kaisen-skeleton package.  
However, there are a few things you should know before updating the skel and the two methods of doing so.

## Simple method
A command called kaisen-update-skel exists and allows you to copy all the contents of /etc/skel to /home/* and /root (by reading the file /etc/passwd). However, this method has a problem, it erases all the customization of the user, namely terminal, configurations of the graphic environment (location of icons, etc.), configuration of the .zshrc file (and possibly the conky theme).  
This command therefore overwrites all the modified configurations (if the same file is present in the skel), to be used with caution and only if you know what you are doing.

## Manual method
This method requires only going to find the files that we want to update and to integrate in /etc/skel and copy them in /home/* or /root.  
This gives you more control over what we update and decreases the chances of your configurations being overwritten.
Note, however, that this method is the least simple, but the most refined, it is not suitable for less experienced users.

## When to do it?
When the kaisen-skeleton package is updated, it means that the default GUI profile has been updated. The kaisen-update-skel command can be used to copy new content from /etc/skel to /home/* and /root.  

## Profile created in /etc/skel_user
If you have created your default profile as mentioned [here](https://kaisenlinux.org/documentation/how-to-create-your-own-skel), you can run the `kaisen-update-skel-user` command to update your profile on all users present on the system.