#!/usr/bin/env bash

#set -o xtrace
#set -e

# Directory on the remote host that will store all the necessary files
ROOT_DIR=/opt/itsvit-devops

# Defining OS family
function get_distr_family(){
  if [ -a /etc/debian_version ]; then
    echo "Debian"
  elif [ -a /etc/redhat-release ]; then
    echo "RedHat"
  else
    echo "This script works only on Ubuntu, Debian or Centos OS"
    exit 2
  fi
}


DISTR=`get_distr_family`

# Defining whether the following components are installed
ANSIBLE=`which ansible` 2> /dev/null
SSHPASS=`which sshpass` 2>/dev/null

# If not - installing them
if [ "RedHat" == ${DISTR} ]; then
  [ -z ${ANSIBLE} ] && yum install -y ansible 
  [ -z ${SSHPASS} ] && yum install -y sshpass
else 
  [ -z ${ANSIBLE} ] && apt-get install -y ansible
  [ -z ${SSHPASS} ] && apt-get install -y sshpass

fi

# Changing directory to that with ansible playbook
cd ansible

# Defining how to connect to the host: using key or password
if [[ -z "$3" ]]; then
    ansible-playbook -vv setup.yml -e "host=$1 root_dir=${ROOT_DIR} r_user=$2"
else
    ansible-playbook -vv setup.yml -e "host=$1 root_dir=${ROOT_DIR} r_user=$2 ansible_ssh_pass=\'$3\'"
fi
