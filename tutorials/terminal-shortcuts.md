# Convenient Kaisen Terminal shortcuts

## Kaisen Terminal?

The Kaisen Terminal launcher is actually just the **terminator** terminal emulator (written in Python) which is executed, but has been fully customized. This tool is great because it has a lot of features including the main one which is device deduplication.

## Main keyboard shortcuts

To open a new tab from the current terminal window, use the command:

```bash
CTRL + T
```
To quickly open a new terminal window, do:


```bash
CTRL + I
```
To split the terminal into two or more horizontally, use this combination:


```bash
CTRL + O
```
To split the terminal into two or more vertically, use this combination:

```bash
CTRL +E
```

## Tips

On the default Terminator setup on the distro, the scroll bar is disabled, and you might need it. To activate it, nothing could be simpler do this:

```bash
Right click + Show scrollbar
```

This will activate the scroll bar and can be turned on and off at will.

On the default configuration, windows open in full screen. You can also change this setting by right-clicking on the terminal window and clicking **Preferences**.  

```bash
Then on the global tab, replace the value in Windows state.
```

To change the background color, transparency or color of the text, you can as before right click on the terminal window, and click on Preferences. In the Profiles tab, you have access to many parameters such as the background, the colors, and also have the possibility of creating as many profiles and therefore parameters as you wish.  

To make your settings effective on all users on your system, you can copy the following path to /etc/skel_user:  

```bash
cp -rf ~/.config/terminator /etc/skel_user
```

Then use the kaisen-update-skel-user command to update this theme for all your users.

