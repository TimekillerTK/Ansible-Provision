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

## TODO
* Cleanup
* Add support for various package managers (currently only supporting `yum`)
* Put few distro specific tasks into block statement and apply conditional to that block statement
* Disable Root Login
* Disallow password login


## Requirements
`sshpass` application is required.
* `apt install sshpass`