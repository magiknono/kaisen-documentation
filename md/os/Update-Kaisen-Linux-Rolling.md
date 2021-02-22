# Update Kaisen Linux Rolling

## Classic method
With Kaisen Linux now in rolling mode, the entire system can be updated without having to systematically reinstall it.  

The classic method is to use the following command:

```bash
sudo apt update;sudo apt -y full-upgrade
```

This method is the update method used on Debian and other derivatives.

## Kaisen Linux method
On Kaisen Linux, an update automation script has been created. It uses the classic update method but additionally plans to fix any errors if there are during the update process and automatically removes the no longer used package dependencies. 

To use the Kaisen method, you must type this command:

```bash
sudo kaisen-update
```