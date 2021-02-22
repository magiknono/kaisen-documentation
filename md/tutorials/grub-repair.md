# GRUB repair

**GRUB repair with CLI method**  

Once the system is installed but after the impossibility of installing GRUB on a system in UEFI, here is the procedure to follow for the installer according to your partitioning.  

You can help yourself with Gparted software for this tutorial.  

Only the CLI method will be presented, because it is the most efficient, relevant, and few tools or none can replace this method.  

## GRUB EFI

### Classic partition

```bash
*sudo fdisk -l (Locate the EFI Linux partition and /)
*sudo mount /dev/sdX /mnt (X represents the drive letter)
*sudo mount --bind /dev /mnt/dev
*sudo mount --bind /dev/pts /mnt/dev/pts
*sudo mount --bind /proc /mnt/proc
*sudo mount --bind /sys /mnt/sys
*sudo mount /dev/sdXY /mnt/boot/efi (X represents the drive letter, and the Y the EFI partition number, it should be 
the first)
*sudo apt install grub-efi-amd64
*sudo cp -rvf /usr/lib/grub/x86_64-efi /mnt/usr/lib/grub/ or sudo cp -rvf /usr/lib/grub/x86_64-efi-signed 
/mnt/usr/lib/grub/
*sudo chroot /mnt
*grub-install --target=x86_64-efi /dev/sdX
*update-grub (cancel the operation in progress at the time it makes Warning (impossible to update the GRUB entries via 
*os-prober which is normal in chrooted environment) 
*mv /boot/grub/grub.cfg.new /boot/grub/grub.cfg
*exit
*sudo reboot
```

Once the system has started, reinstall GRUB correctly with:

```bash
sudo apt install grub-efi
```
The problem should be solved

### LVM without LUKS encryption

```bash
*sudo fdisk -l (Locate the EFI Linux partition and /)
*sudo vgscan
*sudo vgchange -ay
*sudo mount /dev/mapper/name--vg-root /mnt (name--vg-root represents the name of the logical volume returned by the 
vgscan command)
*sudo mount /dev/sdXY /mnt/boot (mount boot partition)
*sudo mount --bind /dev /mnt/dev
*sudo mount --bind /dev/pts /mnt/dev/pts
*sudo mount --bind /proc /mnt/proc
*sudo mount --bind /sys /mnt/sys
*sudo mount /dev/sdXY /mnt/boot/efi (mount the EFI partition often, this partition is often the first)
*sudo apt install grub-efi-amd64
*sudo cp -rvf /usr/lib/grub/x86_64-efi /mnt/usr/lib/grub/ or sudo cp -rvf /usr/lib/grub/x86_64-efi-signed 
/mnt/usr/lib/grub/ 
*sudo chroot /mnt
*grub-install --target=x86_64-efi /dev/sdX
*update-grub (close the terminal 20 seconds after the execution of the command, because it will normally run in a 
vacuum)
*exit
*sudo reboot 
```

CAUTION:  

If the update-grub is spinning, after running sudo reboot, restart the live, and do the following steps:  

```bash
*sudo vgscan
*sudo vgchange -ay
*sudo mount /dev/mapper/name--vg-root /mnt (name--vg-root represents the name of the logical volume returned by the 
vgscan command)
*sudo mount /dev/sdX /mnt/boot (mount boot partition)
*sudo mount --bind /dev /mnt/dev
*sudo mount --bind /proc /mnt/proc
*sudo chroot /mnt
*update-grub
*exit
*sudo reboot
```

Once the system has started, reinstall GRUB correctly with:  

```bash
sudo apt install grub-efi
```

The problem should be solved  

### LVM with LUKS encryption

```bash
*sudo fdisk -l (Locate the EFI Linux partition and /)
*sudo cryptsetup luksOpen /dev/sdXY sdxy_crypt (X represents the drive letter, Y the partition / encrypted number)
*sudo vgscan
*sudo vgchange -ay
*sudo mount /dev/mapper/name--vg-root /mnt (name--vg-root represents the name of the logical volume returned by the 
vgscan command)
*sudo mount /dev/sdXY /mnt/boot (mount boot partition)
*sudo mount --bind /dev /mnt/dev
*sudo mount --bind /dev/pts /mnt/dev/pts
*sudo mount --bind /proc /mnt/proc
*sudo mount --bind /sys /mnt/sys
*sudo mount /dev/sdXY /mnt/boot/efi (mount the EFI partition often /dev/sdX1)
*sudo apt install grub-efi-amd64
*sudo cp -rvf /usr/lib/grub/x86_64-efi /mnt/usr/lib/grub/ or sudo cp -rvf /usr/lib/grub/x86_64-efi-signed 
/mnt/usr/lib/grub/
*sudo chroot /mnt
*grub-install --target=x86_64-efi /dev/sdX
*update-grub (close the terminal 20 seconds after the execution of the command, because it will normally run in a 
vacuum)
*exit
*sudo reboot 
```

CAUTION:  

If the update-grub is running in a vacuum, restart the system, and do the following steps:  

```bash
*sudo fdisk -l (Locate the EFI Linux partition and /)
*sudo cryptsetup luksOpen /dev/sdXY sdxy_crypt (X represents the drive letter, Y the partition / encrypted number)
*sudo vgscan
*sudo vgchange -ay
*sudo mount /dev/mapper/name--vg-root /mnt (name--vg-root represents the name of the logical volume returned by the 
vgscan command)
*sudo mount /dev/sdX /mnt/boot (mount boot partition)
*sudo mount --bind /dev /mnt/dev
*sudo mount --bind /proc /mnt/proc
*sudo chroot /mnt
*update-grub
*exit
*sudo reboot
```

Once the system has started, reinstall GRUB correctly with:

```bash
sudo apt install grub-efi
```

The problem should be solved