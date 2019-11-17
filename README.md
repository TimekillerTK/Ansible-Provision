# Ansible-Provision
For provisioning new Ansible Hosts. Created mostly for myself in order to set up LinuxAcademy cloud servers with public keys from multiple computers for easy accessibility.

End result is one or more Ansible Managed hosts, ready for you to run ansible commands against & SSH into using a SSH keypair.

---
## How to run
**TLDR**; Run this playbook by supplying the username to connect as and supplying the inventory to use. For example: 
* `ansible-playbook site.yml -u username -i inventory --ask-pass --ask-become-pass`

Here are step-by step instructions for absolute ansible beginners (assuming you're running this on Ubuntu Linux):
1. Install `git`:
   * `sudo apt update && sudo apt install git -y`
2. Install `python3` and `ansible`:
   * `sudo apt install software-properties-common`
   * `sudo apt-add-repository --yes --update ppa:ansible/ansible`
   * `sudo apt install ansible`
3. Create a ssh keypair:
   * `ssh-keygen` (accept all defaults)
     * The path to the generated public key will be in `~/.ssh/id_rsa.pub`
4. Clone the repository. This will create a directory called `Ansible-Provision` in your current directory.
   * `git clone https://github.com/TimekillerTK/Ansible-Provision.git`
5. Go into the `Ansible-Provision` directory
   * `cd Ansible-Provision`
6. Create an `ansible.cfg` file:
```
[defaults]
inventory = inventory
remote_user = ansible_user
private_key_file = ~/.ssh/id_rsa
ansible_managed = "!!! MANAGED BY ANSIBLE DO NOT TOUCH !!!"

[privilege_escalation]
become = True
become_method = sudo
become_user = root
become_ask_pass = False
```
7. Create an `inventory` file, and fill it in with the IP Addresses or hostnames of the linux hosts you'd like to become ansible managed hosts:
```
192.168.1.10
192.168.1.11
hostname1.example.com
hostname2.example.com
hostname3.example.com
```
8. You're set, run the following command, supplying the username and entering the password when prompted:
   * `ansible-playbook site.yml -u yourusernamehere -i inventory --ask-pass --ask-become-pass`
   * **NOTE**: The username must be either `root` or a user with `sudo` privileges!


---
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
