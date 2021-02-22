# Kaisen Linux downloads

## Advices
Only download ISO from the official link:

```bash
https://kaisenlinux.org/downloads
```

The officials mirrors:

```bash
https://iso.kaisenlinux.org
https://kaisen.lf.je/index.html
```

**Download a Kaisen Linux ISO only via the links mentioned above.**  
**We cannot be held responsible for any problem with an unofficial ISO.**  

## Recommendations

### Linux
Even if you have downloaded ISO from an official source, still perform checksum verification.
At each release, we publish the checksums in sha256. To check the ISO, proceed as follows:

```bash
Use sha256 command => Example: sha256sum kaisenlinuxrolling1.0-amd64.iso => 1843aad731a9c01f3e196e222baa92c8022cb9069fb2b02fb10dcad127d066a8 kaisenlinuxrolling1.0-amd64.iso
You can verify all ISO checksums at => https://kaisenlinux.org/checksums.txt
```

### Windows
For Windows, use **HackTab** software and check sha256 value.
Right click on the file to analyze and go to the **hashes** section.

### MacOS

For MacOS, use shasum command => Example:

```bash
shasum -a 256 /path/your/ISO/kaisenlinuxrolling1.0-amd64.iso
1843aad731a9c01f3e196e222baa92c8022cb9069fb2b02fb10dcad127d066a8 /path/your/ISO/kaisenlinuxrolling1.0-amd64.iso
```