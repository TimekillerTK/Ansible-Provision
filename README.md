# Ansible-Provision
For provisioning new Ansible Hosts.

## How to run
Run this playbook by supplying the username to connect as and supplying the inventory to use. For example: 
* `ansible-playbook ansible-provision.yml -u username -i inventoryfile --ask-pass --ask-become-pass`

## Variables
Variables should be specified in the `vars/vars.yml` file in the following format:
```yml
user: ansible_user
pubkeys:
      - path/to/pubkey1.pub
      - path/to/pubkey2.pub
      - path/to/pubkey3.pub
```

## Requirements
`sshpass` application is required.
* Ubuntu: `apt install sshpass`
* CentOS: `yum install sshpass`
* Arch: `pacman -S sshpass` 


## TODO
* Cleanup
* Add support for various package managers / distros (currently only supporting `yum` / `CentOS`)
* Put few distro specific tasks into block statement and apply conditional to that block statement
* ~~Disable Root Login~~ **Added via new j2 template - task completed**
* ~~Disallow password login~~ **Added via new j2 template - task completed**

