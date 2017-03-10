# Hotbath pimcore #


# Getting started #

## GIT ##

Create personal fork of the hotbath project in BitBucket: 

* https://source.youwe.nl/projects/hotbath/repos/hotbath-pimcore/browse 

Then clone the project to your machine:

* Go in your commandline to /data/projects, and type the following command:
```bash
    cd /data/projects
    git clone ssh://git@source.youwe.nl:7999/[YOUR_NAME]/hotbath-pimcore.git
```

## Build ##

```mysql
CREATE DATABASE hotbath DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
```

```bash
cp website/var/config/system.example.php website/var/config/system.php
cp tools/build/local.cfg.template tools/build/local.cfg
```

Edit the following files to verify/correct local database credentials:
    
    tools/build/local.cfg
    website/var/config/system.php

```./tools/build/local-build.sh```

Make git ignore permissions:
````bash
git config core.fileMode false
````

## Apache vhost ##

```apacheconfig
<VirtualHost *:80>
    ServerName hotbath.localhost
    DocumentRoot /data/projects/hotbath-pimcore/
    <Directory /data/projects/hotbath-pimcore/ >
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

## Localhost ##
Add this to /etc/hosts

    127.0.0.1       hotbath.localhost


## Restart apache ###

Ubuntu:

    sudo a2ensite hotbath.conf
    sudo service apache2 reload

MacOS:

    sudo apachectl restart


Then start the browser to:

* http://hotbath.localhost  (front)
* http://hotbath.localhost/admin  (back)


## Start developing on the project !! ##

You can log in the backend with the following credentials:

    Username: admin
    Password: admin
