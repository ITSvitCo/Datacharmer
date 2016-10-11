Datacharmer Deployment Guide
==============================

# Introduction
This step-by-step guide describes how to deploy a simple PHP script that outputs the list of employees that are:
* Male
* which birth date is `1965-02-01`
* the hire date is `greater` than `1990-01-01`
* ordered by the `Full Name` of the employee.

# System on test
* Ubuntu 16.04 LTS
* NGINX web server 
* PHP 
* MySQL server 
* Configuration Management tool for configuring server (Saltstack/Ansible/Puppet/Chef)

# Installation process
1. Clone/download the repository from GitHub:
```
git clone https://github.com/ITSvitCo/Datacharmer.git
```
2. Change to the `Datacharmer` directory:
```
cd Datacharmer
```
3. Launch the `setup.sh` script:
```
./setup.sh 192.168.206.182 root
```
or 

```
./setup.sh 192.168.206.182 root 123
```

where
* `192.168.206.182` - address of the host that will be used for deployment
* `root` - username to be used to connect to the remote host
* `123` - password (no password required if connection is established using a key)

# Testing the installation
* Open your web browser and specify the following address:
```
http://192.168.206.182
```

Once specified, you should see the final query sample as shown below:

```
```

It means that the script was executed successfully and testing is completed.

# List of files and catalogs
* `ansible` - Folder that contains playbooks and roles for Ansible
* `README.md` - This README file
* `setup.sh` - The main executable script
* `site` - Folder that contans `index.php` file to perform a request to the database
