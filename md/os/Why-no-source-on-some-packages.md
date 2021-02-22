# Why no sources on some packages ?

## Softwares non-free
Software like TeamViewer, Anydesk for example do not have their sources open. We cannot therefore supply them via apt-get source.  

## Free software
Some software such as codium, balena-etcher-electron to name a few, are packages downloaded directly from official GitHub sources in the releases section. Software developers have already tampered with this software, so we don't have to package it ourselves.  

## Check the authenticity of the packages
The safest and most efficient way to check the authenticity of the sourceless packages that we provide to you is to check via the official GitHub repository of the software (for example codium or balena-etcher-electron) the checksum in sha256, md5 or sha1 with sha256sum, md5sum or sha1sum the package we provide as well as the one on GitHub. The amounts are normally the same because the file has not been modified.  
You can find the .deb files added for Kaisen Linux and the sha256, md5, and sha1 checksums of these packages (this also includes packages developed for distribution as well as packages recompiled for distribution) [here](https://kaisendeb.lf.je/dists/kaisen-devel/main/binary-amd64/Packages):  
https://kaisendeb.lf.je/dists/kaisen-devel/main/binary-amd64/Packages
