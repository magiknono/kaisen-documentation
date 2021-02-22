# Hardware requirements

Hardware recommandations for using Kaisen Linux:

**Kaisen Linux is only compatible with 64bit processors.**

32-bit ISOs have never been produced by computers for over 10 years and support the amd64 architecture. Kaisen Linux being a distribution intended for IT professionals regardless of their activity, the chances of seeing a computer not supporting the amd64 architecture which is almost nil at present (except IT technicians for individuals with old hardware, but chances are slim anyway), that's why only 64-bit was produced.

Kaisen Linux uses 600Mb of RAM in live and installed version (on a physical machine, not on a VM) on MATE version, and uses 7GB at 9GB of disk space in installed version.

On VM (on VMWare), between 700 and 800MB of RAM are consumed.

The **LXDE version is the lightest**, and consumes barely 400MB of post-installation RAM (with all additional services disabled).

## Minimal configuration

To use Kaisen Linux, you need at least the following configuration:

```bash
Hard disk: 20Gb
RAM: 2Gb
Processor:1 core @1.5GHz (AMD or Intel)
```

With this configuration, you can start and use the system to do small operations like launching some tools in command line. This is not the recommended configuration, as you will be very limited.

## Recommended configuration

To use Kaisen Linux comfortably, use at least this configuration:

```bash
Hard disk: 30Gb
RAM: 4Gb
Processor: 2 core @2GHz (AMD or Intel)
```

With this configuration, you can comfortably use Kaisen Linux for your system / network administration tasks, do several internet searches simultaneously, etc.

## Optimal configuration

To use Kaisen Linux optimally, at least use this configuration:

```bash
Hard disk: 50Gb
RAM: 8Gb
Processor: 4 core @2,5GHz (AMD or Intel)
```

With this configuration, you can comfortably use Kaisen Linux for your system/network administration tasks, do several internet searches simultaneously, etc.

## BIOS and UEFI

Kaisen Linux is 100% compatible with computers with a classic BIOS called LEGACY and a UEFI BIOS. The UEFI BIOS is different and more recent than its predecessor and allows disk support for more than 2TB and 255 primary partitions (unlike the LEGACY BIOS which only supported 4 maximum).  
If your computer is less than 10 years old, you have a 99% chance of having a UEFI BIOS.