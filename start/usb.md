# How to USB creation

## Simple method and supported any system
You can use the [balenaEtcher tool](https://www.balena.io/etcher/).

This tool is available on Windows, MacOS and GNU/Linux. The tool is graphical and extremely intuitive. It is a simple and efficient method to create a bootable USB stick for GNU/Linux system quickly.

## Method with CLI
Suppose here that the command `sudo fdisk -l` tells us that our USB key is the device `sdb`.

- So we will type this command:

```bash
sudo dd if=iso_path/iso_file.iso of=/dev/sdb bs=4M
```

At the end of the process, you will have a bootable USB stick.

## Other method or tools
You can use other tools or methods to create your Kaisen Live bootable USB drive, however, note that the two methods mentioned above have been tested and approved by our team. Some problems have been reported to us following the use of Rufus, in particular for installation on certain configurations.

## Create live USB key with persistence
### Prerequisite
WARNING: A USB key configured to support live persistent will not work with Apple hardware, surely due to their specific BIOS.

We recommend that you have at least a 64GB USB key to take full advantage of this feature. Delete your current partition entirely with Gparted and create a partition table in GPT, dd will do the rest for you. You don't need to format the partition with any file system.
Check with the command sudo fdisk -l what your key is called. Here we will assume that our USB drive is /dev/sdb.

### USB creation
This documentation was made with the live MATE ISO but also works with KDE, LXDE and XFCE and SR (System Rescue).
Make sure you are in the same folder as the ISO to do all this !!

- Create a bootable Kaisen USB drive with the following command:

```bash
sudo dd if=kaisenlinuxrolling1.5-amd64-MATE.iso of=/dev/sdb bs=4M
```

Normally two partitions were created by dd. You can check this with the `sudo fdisk -l` command. You need to create a third to add persistence to it.

- To do this, type the following commands (always in the same folder where the ISO is):

```bash
end=55gb (if key is 64gb, for security we will put the key ending at 55gb plus the size of the ISO so 3gb)
read start _ <<(du -bcm kaisenlinuxrolling1.5-amd64-MATE.iso | tail -1); echo $start
sudo parted /dev/sdb mkpart primary $start $end
```

- Here is what to answer with parted:

```bash
Warning: Not all of the space available to /dev/sdb1 appears to be used, you can fix the GPT to use all of the space (an extra
117235328 blocks) or continue with the current setting?
Fix/Ignore?
```

Answer: Fix

```bash
Error: Can't have overlapping partitions.
Ignore/Cancel?
```

Answer: Ignore

```bash
Partition name?  []?
```

Answer: persistence

```bash
File system type?  [ext2]?
```

Answer: ext4

```bash
Start?
```

Answer $start value (I get 3577 just after echo $start with MATE ISO)

```bash
End?
```

Answer: 55gb

You may be asked the questions below. Just ignore the messages.

```bash
Error: Error informing the kernel about modifications to partition /dev/sdb1 -- Device or resource busy.  This means Linux won't know about any changes you made to /dev/sdb1 until you reboot -- so you shouldn't mount it or use it in any way before rebooting.
Ignore/Cancel?
```

Answer: Ignore

```bash
Error: Partition(s) 3 on /dev/sdb have been written, but we have been unable to inform the kernel of the change, probably because it/they are in use.  As a result, the old partition(s) will remain in use.  You should reboot now before making further changes.
Ignore/Cancel?
```

Answer: Ignore

- **To initialize /etc/mtab, disconnect then reconnect your key!!**

You should now have 3 partitions on your `/dev/sdb` device.  

- Then do this for create filesystems and partition label:

The `mkfs.ext4` command below will ask a question (on the size of the blocks). Just press enter to use the default settings (not affected here).

```bash
sudo mkfs.ext4 -L persistence /dev/sdb3
sudo e2label /dev/sdb3 persistence
```

To take into account this new persistence partition, we should have a file named persistence.conf at the root of this partition with in this file marked: **/ union**

- We are going to proceed like this:

```bash
sudo mkdir -p /mnt/persistence
sudo mount /dev/sdb3 /mnt/persistence
echo "/ union" | sudo tee /mnt/persistence/persistence.conf
sudo umount /mnt/persistence
```

- Your key is now ready!

Restart a live Kaisen with the persistence option enabled. To test that the persistence is functional, for example change the theme of the graphical interface then restart your live session by always choosing "persistence". If the theme you modified has been kept instead of the default one, persistence is functional :-)

## Create live USB key with encrypted persistence
### Prerequisite
WARNING: A USB key configured to support live persistent will not work with Apple hardware, surely due to their specific **BIOS**.

We recommend that you have at least a 64GB USB key to take full advantage of this feature. Delete your current partition entirely with Gparted and create a partition table in **GPT**, dd will do the rest for you. You don't need to format the partition with any file system.
Check with the command sudo fdisk -l what your key is called. Here we will assume that our USB drive is `/dev/sdb`.

## USB creation
This documentation was made with the live MATE ISO but also works with KDE, LXDE and XFCE and SR (System Rescue).
Make sure you are in the same folder as the ISO to do all this !! 

- Create a bootable Kaisen USB drive with the following command:

```bash
sudo dd if=kaisenlinuxrolling1.5-amd64-MATE.iso of=/dev/sdb bs=4M
```

Normally two partitions were created by dd. You can check this with the sudo fdisk -l command. You need to create a third to add persistence to it.

- To do this, type the following commands (always in the same folder where the ISO is):

```bash
end=55gb (if key is 55gb, for security we will put the key ending at 10gb plus the size of the ISO so 3gb)
read start _ <<(du -bcm kaisenlinuxrolling1.5-amd64-MATE.iso | tail -1); echo $start
sudo parted /dev/sdb mkpart primary $start $end
```

- Here is what to answer with parted:

```bash
Warning: Not all of the space available to /dev/sdb1 appears to be used, you can fix the GPT to use all of the space (an extra
117235328 blocks) or continue with the current setting?
Fix/Ignore?
```

Answer: Fix

```bash
Error: Can't have overlapping partitions.
Ignore/Cancel?
```
Answer: Ignore

```bash
Partition name?  []?
```

Answer: persistence

```bash
File system type?  [ext2]?
```
Answer: ext4

```bash
Start?
```

Answer $start value (I get 3577 just after echo $start with MATE ISO)

```bash
End?
```
Answer: 55gb

- You may be asked the questions below. Just ignore the messages.

```bash
Error: Error informing the kernel about modifications to partition /dev/sdb1 -- Device or resource busy.  This means Linux won't know about any changes you made to /dev/sdb1 until you reboot -- so you shouldn't mount it or use it in any way before rebooting.
Ignore/Cancel?
```

Answer: Ignore

```bash
Error: Partition(s) 3 on /dev/sdb have been written, but we have been unable to inform the kernel of the change, probably because it/they are in use.  As a result, the old partition(s) will remain in use.  You should reboot now before making further changes.
Ignore/Cancel?
```
Answer: Ignore

**To initialize /etc/mtab, disconnect then reconnect your key!!**

You should now have 3 partitions on your `/dev/sdb` device.
**WARNING: do not forget the passphrase to unlock the partition, otherwise you will have to completely redo your key and your data cannot be recovered. You have been warned.**

```bash
sudo cryptsetup --verbose --verify-passphrase luksFormat /dev/sdb3
sudo cryptsetup luksOpen /dev/sdb3 my_usb
```

- Then do this for create filesystems and partition label:

```bash
The mkfs.ext4 command below will ask a question (on the size of the blocks). Just press enter to use the default settings (not affected here).
```

```bash
sudo mkfs.ext4 -L persistence /dev/mapper/my_usb
sudo e2label /dev/mapper/my_usb persistence
```

To take into account this new persistence partition, we should have a file named persistence.conf at the root of this partition with in this file marked: / union

- We are going to proceed like this:

```bash
sudo mkdir -p /mnt/my_usb
sudo mount /dev/mapper/my_usb /mnt/my_usb
echo "/ union" | sudo tee /mnt/my_usb/persistence.conf
sudo umount /dev/mapper/my_usb
```

- Let's close the encrypted channel:

```bash
sudo cryptsetup luksClose /dev/mapper/my_usb
```
Your key is now ready!

Restart a live Kaisen with the encrypted persistence option enabled. To test that the persistence is functional, for example change the theme of the graphical interface then restart your live session by always choosing "encrypted persistence". If the theme you modified has been kept instead of the default one, encrypted persistence is functional :-)