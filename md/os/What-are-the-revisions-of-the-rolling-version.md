# What are the revisions of the rolling version ?

## Explanation
Revisions (eg 1.1, 1.2 and so on) are simply a "snapshot" of the project at one point in time.  
The revisions of the rolling version are therefore ISOS updated at a given time when the system has had improvements, additions of tools, bug fixes etc ...

## APT OS update
Since the rolling version and therefore the arrival of the official Kaisen Linux package repositories, the entire system can be updated via APT.  
When switching to a "new version", the base-files package is updated and the / etc / os-release file and the conky will show the current revision.  

## New ISOS
New ISOS are therefore created with each revision to fix any errors on the live system, improvements on the start-up entries, support for a new language, integration of new tools integrated over time on the live etc ...  
Even if you have downloaded Kaisen Linux 1.3 and installed the system, and ISOS 1.4 has just been released, you don't have to completely reinstall the system, using the kaisen-update command will suffice to change from revision 1.3 to 1.4 by updating the packages.