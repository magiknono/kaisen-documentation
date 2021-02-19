# Why are all additional services disabled by default ?

## Explanation
We call additional services, services installed by software provided in Kaisen Linux. The reason is simple. It is about optimizing the performance and resources used by the system.  
When building the ISO, all services are disabled with systemd hooks, which allows once the ISO is built, to be able to use Kaisen Linux with only 500MB to 550MB of RAM on the live as well as on the installed system , which is suitable for very small configurations.  
We also have the vision, despite the wide range of tools provided by default, to let the user choose to use only what they need, so let these services run in the background, is useless and consumes resources unnecessarily. The tool is present (because we provide a complete live), but if not necessary, it therefore does not encumber any resource (except the disk space used by this program).

## Management of these services
So we have to list these services, as well as to facilitate their management (activation, deactivation) created the **"kaisen-services-management"** package which installs scripts which will be referenced on the menu in the **"Services"** tab which will allow activate and deactivate the services listed by sub-tabs for example **"zfs-fuse, avahi, cups etc ..."** as well as two scripts to activate or deactivate everything.

## Problem resolution
If you therefore have an error telling you that the service is not indicated or certain programs (TeamViewer for example) start but are not functional, try to activate the service corresponding to this program (via the menu or simply by typing yourself systemd commands).
If that doesn't solve your problem, contact support.