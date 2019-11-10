# Ansible-Provision
For provisioning new Ansible Hosts.

## How to run
Run this playbook by supplying the username to connect as and supplying the inventory to use. For example: 
* `ansible-playbook ansible-provision.yml -u username -i inventoryfile --ask-pass --ask-become-pass`

## TODO
* Cleanup
* Add hostname change
* Include NW config (Gateway & DNS)
