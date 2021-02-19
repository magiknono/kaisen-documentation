# How to switch to root directly with the ZSH terminal?

## Explanation
By default, the root user defaults to bash because it is not expected in good practice to be used for human operations, except in cases where there is no choice. It also allows us to be able to chroot at a specific location in the system without having any errors.

## Solution
To go directly to a root terminal, type the following command:

```bash
sudo zsh
```