# {[{[{project_name}]}]} pimcore #


# Getting started #

## GIT ##

Create personal fork of the project in BitBucket: 

* https://source.youwe.nl/projects/your-name/repos/your-project-name/browse 

Then clone the project to your machine:

* Go in your commandline to /data/projects, and type the following command:
```bash
    cd /data/projects
    git clone ssh://git@source.youwe.nl:7999/[YOUR_NAME]/pimcore-your-project-name.git {[{[{project_short_name}]}]}
```

## Build ##

```mysql
CREATE DATABASE {[{[{local_db_name}]}]} DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
```

```bash
cd /data/projects/{[{[{project_short_name}]}]}
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
    ServerName local.{[{[{project_short_name}]}]}.nl
    DocumentRoot /data/projects/{[{[{project_short_name}]}]}/
    <Directory /data/projects/{[{[{project_short_name}]}]}/ >
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

## Localhost ##
Add this to /etc/hosts

    127.0.0.1       local.{[{[{project_short_name}]}]}.nl


## Restart apache ###

Ubuntu:

    sudo a2ensite {[{[{project_short_name}]}]}.conf
    sudo service apache2 reload

MacOS:

    sudo apachectl restart


Then start the browser to:

* http://local.{[{[{project_short_name}]}]}.nl  (front)
* http://local.{[{[{project_short_name}]}]}.nl/admin  (back)


## Start developing on the project !! ##

You can log in the backend with the following credentials:

    Username: admin
    Password: admin
