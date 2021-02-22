# Kaisen Linux system updates

## Alpha and beta
The alpha and beta versions (from version 20191214 to 20200413) had a "fixed" update system, which means that each new release was a system update. The user had to reinstall the system each time to update the system components not distributed by Debian.  
The repositories used were those of Debian, which forced me with each new thing to correct / do / integrate to publish a new ISO and have to reinstall the system (can also be used live, but not able to update via APT is very restrictive).
This update system is totally outdated and difficult to manage, what is more, the system gets heavier because each package was added by hand, and a lot of flourishes were added as versions were released. This update system has been released for distributing updates in **rolling** mode.

## Rolling

This update system distributes continuously via the kaisen-rolling repository all updates from Debian testing. This is the mode of updates closest to a rolling distribution. This is the mode we have chosen unlike LTS. It is the distribution mode that I prefer, and the rest of the team joined this opinion, the stable version of Kaisen Linux (called rolling) is therefore based on this model.

## How to update rolling release

All methods here: [Update Kaisen Linux Rolling](https://kaisenlinux.org/documentation/Update-Kaisen-Linux-Rolling)

## Know my version

open terminal:

```bash
cat /etc/debian_version
```