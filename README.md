Datacharmer Deployment guide
==============================

# Introduction
This step-by-step guide describes how to deploy a simple PHP script that outputs the list of employees that are:
* Male
* which birth date is `1965-02-01`
* the hire date is `greater` than `1990-01-01`
* ordered by the `Full Name` of the employee. 

# Requrements

# System components
* Ubuntu 16.04 LTS
* NGINX web server 
* PHP 
* MySQL server 
* Configuration Management tool for configuring server (Saltstack/Ansible/Puppet/Chef)


# Список каталогов
ansible - (К) плэйбуки и роли Ansible
README.md (Ф)
setup.sh - (Ф) Исполняемый скрипт
site (К) - index.php 


# Installation process
1. Download the repository from GitHub
git clone https://github.com/ITSvitCo/Datacharmer.git
1.1. Запускаем скрипт setup.sh с параметрами 1-й адрес хоста на который будет произведен деплой, 2-й имя пользлователя для подключения к удаленному хосту, 3-й пароль (если подключение будет осущ. по ключу - пароль не нужен)
./setup.sh 192.168.206.182 root or ./setup.sh 192.168.206.182 root 123
```
command
```



2. Change to the `directory` directory

```
command
```

3. Execute the following Ansible command:

```
command <parameters>
```

4. setup.sh
    ROOT_DIR=/opt/itsvit-devops - директория на удаленном хосте, в которой будет хранится все необходимые файлы.
    function get_distr_family - определяем семейство дистрибутива Linux
    

# Testing the installation
* Navigate to the following address:
```
Открываем браузер и вводим адрес удаленного хоста


```

Once finished, you should see final results similar to those showed below:


```
```

It means that the testing process was completed successfully.
