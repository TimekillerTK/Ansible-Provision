# Ansible-Provision
For provisioning new Ansible Hosts. Created mostly for myself in order to set up LinuxAcademy cloud servers with public keys from multiple computers for easy accessibility.

End result is one or more Ansible Managed hosts, ready for you to run ansible commands against & SSH into using SSH keypair.

## How to run
**TLDR**; Run this playbook by supplying the username to connect as and supplying the inventory to use. For example: 
* `ansible-playbook site.yml -u username -i inventoryfile --ask-pass --ask-become-pass`

## Variables
Variables should be specified in the `provision/vars/main.yml` file in the following format, you can see an example in `provision/defaults/main.yml`:
```yml
user: ansible_user
pubkeys:
      - path/to/pubkey1.pub
      - path/to/pubkey2.pub
      - path/to/pubkey3.pub
```
---
## Requirements
`sshpass` application is required.
* Ubuntu: `apt install sshpass`
* CentOS: `yum install sshpass`
* Arch: `pacman -S sshpass` 
---
## TODO
* Some minor cleanup (too many group_vars files)
* ~~Apply best practices: https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html~~
  * **Applied best practices, works perfectly**
* ~~Add support for various package managers / distros (currently only supporting `yum` / `CentOS`)~~
  * **Support for Ubuntu added (Tested with 16.04, 18.04, 19.04)**
  * **Support for CentOS6 added (epel repository needs to be added for Python3)**
  * Works on CentOS8 without issues
* ~~Disable Root Login~~ **Added via new j2 template - task completed**
* ~~Disallow password login~~ **Added via new j2 template - task completed**
