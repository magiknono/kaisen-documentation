# Why root account is disabled by default?

## The disable explanation
Thanks to the preseed file used by the insllator, we deactivate the password request for the root user.  
The reason is very simple. As a security measure, on UNIX systems, never use the root account but rather use sudo. This allows the increase of the security of the system (also reduces the risks of malware infections), allows to have better control over the actions of the user as well as the traceability of his actions.  
We have also based our entire default profile for normal users, especially with zsh, which is the default shell for normal users, but is not that of root (that of root is bash, to facilitate chroot systems).  
We have therefore chosen to deactivate this possibility.

## So how do you get root rights?
By default, when installing the system with a user and a password entered (which is not offered when we enter a password for root, because root becomes our current user), the installer puts default this user in the sudo group without any restriction on the machine, the sudo command gives you all access.  
We have not, despite our attachment to system security, not disabled the possibility of putting a password on root after installation (sudo passwd root command) nor have we disabled the sudo su or su root.  
We believe that as users, you are free to use the system as you see fit, without any particular constraints.
However, we always advise you to use sudo when you need root is to leave root disabled (without password), this can save you from some errors that can harm your system.

## Advice
We do not recommend using the root account from a graphical session.  
And this because increases the risk of making a false manipulation, creating directories with root rights when root is not necessary, and others.  
Some scripts developed for Kaisen Linux are also developed only for regular user accounts (even without sudo rights), because root should not be used from a graphical session.  
This will surely never change, admittedly I remove you by default the possibility to put a password on root, but you can entirely use it in command line via the commands sudo `su -` or `sudo -i`.  
Using the root account from a graphical session is unnecessary, dangerous and stupid. It can also cause problems for some scripts developed for Kaisen like for example the kaisen-interface-switcher or any other script saving standard user configurations. You have been warned.  

## Conclusion
Use sudo when you need root.  
Log in as root with the `sudo su -`, `sudo -i`, and su command (su command only works if you have set a root password with the passwd root command).