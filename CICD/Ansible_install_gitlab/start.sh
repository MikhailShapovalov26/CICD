#!/bin/bash

echo

gitlab_ubuntu_host=$1

shift

remote_user=$1

cat <<EOF > inventory
   [gitlab_ubuntu]
   gitlab_ubuntu ansible_host=${gitlab_ubuntu_host}
EOF

#ansible-playbook -i inventory instance.yaml -e remote_user=${remote_user}
rm inventory