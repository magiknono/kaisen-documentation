# Why create user accounts only on /home?

## Explanation
By convention (FHS standard), users intended to be accounts for users must have their home directory on /home, as it is intended for that.  
On Kaisen Linux, this convention as on all distributions respecting the standards is respected.  
The kaisen-update-skel scripts as well as the kaisen-interface-switcher, were developed to read with awk all users who have a home directory in a directory in / home via the /etc/passwd file. If you do not respect this standard and are led to use one of these scripts, they will not work normally if at all.  
I am aware that I cannot cover all cases, I try to do it as much as possible, however this kind of scripts can only work correctly by respecting the standards, to avoid any additional problems.  