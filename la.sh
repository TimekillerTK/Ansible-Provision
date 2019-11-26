#!/bin/bash
ansible-playbook site.yml -u cloud_user --ask-pass --ask-become-pass
