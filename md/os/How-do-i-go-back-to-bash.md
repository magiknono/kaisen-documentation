# How do I go back to bash?

## Simple user method
Many users or others who have seen this have had a feeling of disgust over this choice which to them seems "amateur" and illogical. While this bothers me, I don't think bash will become the default terminal for users (non-root, root stayed in bash by default to allow the chroot command to work), and you can fall back on bash.  
Kaisen Linux's default terminal is ZSH installed with the oh-my-zsh framework.  
You are only one user and you only have one account installed, use the following command (as your user and not as root):  

```bash
chsh -s /bin/bash
```

The next time you reconnect to your session, you will be back in bash.

## Multiple user method

### Useradd command
Type this when adding a user with the useradd command to give them the bash shell by default:

```bash
sudo useradd -s /bin/bash user
```

### Modify useradd configuration

In the file `/etc/default/useradd`, change the following line:

```bash
SHELL=/bin/zsh
```

In:

```bash
SHELL=/bin/bash
```

After that, with the useradd command the bash shell will be set by default, and you will no longer need to specify -s option.  
When updating the shadow package, select the option "N" or "O" to keep your configurations.

### Adduser command

Type this when adding a user with the adduser command to give them the bash shell by default:

```bash
sudo adduser --shell /bin/bash user
```

### Modify adduser configuration

In the file `/etc/adduser.conf`, change the following line:

```bash
DSHELL=/bin/zsh
```

In:

```bash
DSHELL=/bin/bash
```

After that, with the adduser command the bash shell will be set by default, and you will no longer need to specify --shell option.
When updating the adduser package, select the option "N" or "O" to keep your configurations.