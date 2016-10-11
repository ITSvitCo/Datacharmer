#!/usr/bin/env bash

#set -o xtrace
#set -e

function get_distr_famaly(){
  if [ -a /etc/debian_version ]; then
    echo "Debian"
  elif [ -a /etc/redhat-release ]; then
    echo "RedHat"
  else
    echo "This script workin only on Ubuntu, Debian or Centos OS"
    exit 2
  fi
}


DISTR=`get_distr_famaly`
echo ${DISTR}

ANSIBLE=`which ansible` 2> /dev/null
GIT=`which git` 2>/dev/null


if [ "RedHat" == ${DISTR} ]; then
  [ -z ${ANSIBLE} ] && yum install -y ansible
  [ -z ${GIT} ] && yum install -y git
else 
  [ -z ${ANSIBLE} ] && apt-get install -y ansible
  [ -z ${GIT} ] && apt-get install -y git
fi


ROOT_DIR=`pwd`
cd ansible

ansible-playbook -vv setup.yml -e "host=$1 site_root=${ROOT_DIR} r_user=$2"
