#!/usr/bin/env bash

#set -o xtrace
#set -e

# директория на удаленном хосте, в которой будет хранится все необходимые файлы.
ROOT_DIR=/opt/itsvit-devops

# Определяем семейство ОС
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

# Определяем установлены ли следующие компоненты
ANSIBLE=`which ansible` 2> /dev/null
GIT=`which git` 2>/dev/null
SSHPASS=`which sshpass` 2>/dev/null

# If not install
if [ "RedHat" == ${DISTR} ]; then
  [ -z ${ANSIBLE} ] && yum install -y ansible 
  [ -z ${GIT} ] && yum install -y git
  [ -z ${SSHPASS} ] && yum install -y sshpass
else 
  [ -z ${ANSIBLE} ] && apt-get install -y ansible
  [ -z ${GIT} ] && apt-get install -y git
  [ -z ${SSHPASS} ] && apt-get install -y sshpass

fi

# Переходим в каталог с ансибл плэйбуком
cd ansible

# Проверка как нужно подключаться к хосту: По ключу или по паролю
if [[ -z "$3" ]]; then
    ansible-playbook -vv setup.yml -e "host=$1 root_dir=${ROOT_DIR} r_user=$2"
else
    ansible-playbook -vv setup.yml -e "host=$1 root_dir=${ROOT_DIR} r_user=$2 ansible_ssh_pass=\'$3\'"
fi
