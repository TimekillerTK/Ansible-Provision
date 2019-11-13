# Ansible-Provision
For provisioning new Ansible Hosts.

## How to run
Run this playbook by supplying the username to connect as and supplying the inventory to use. For example: 
* `ansible-playbook ansible-provision.yml -u username -i inventoryfile --ask-pass --ask-become-pass`

## Variables
Variables are in the `vars/pubkeys.yml` file in the following format:
```yml
pubkeys:
      - path/to/pubkey1.yml
      - path/to/pubkey2.yml
      - path/to/pubkey3.yml
```

## TODO
* Cleanup
* Add hostname change
* Include NW config (Gateway & DNS)

## Requirements
`sshpass` application is required.
* `apt install sshpass`