#!/bin/bash

currentPath=$(pwd)
roles_template="roles/common"
mkdir -p {group,host}_vars  playbooks $roles_template/{defaults,files,handlers,tasks,templates,vars,meta}
touch $roles_template/{defaults,handlers,tasks,vars,meta}/main.yml
touch $roles_template/templates/temp.j2
touch $roles_template/files/{file.conf,requrement.txt}
touch group_vars/group{1,2}.yml 
touch host_vars/hostname{1,2}.yml
