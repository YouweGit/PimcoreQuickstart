PimcoreQuickstart Plugin
------------------------

This plugin should:

* copy config files to the project
    * /website/var/config/acceptance.system.php
    * /website/var/config/testing.system.php
    * /website/var/config/system.php
    * /website/var/config/system.example.php
    * /website/var/config/extensions.php
* copy json class definitions to project 
    * /website/var/plugins/PimcoreDeployment
* copy fixture files to project
    * /website/var/plugins/PimcoreFixtures
* copy overriding parent BASE object
    * /website/lib/Object/BaseConcrete.php
* copy overriding parent objects
    * /website/lib/Object/Product.php
    * /website/lib/Object/Category.php
    * /website/lib/Object/ProductSite.php
    * /website/lib/Object/OutputChannel.php
* copy trait files to the project (used by the object classes)
    * /website/lib/Object/Traits/DefaultParentObject.php
    * /website/lib/Object/Traits/DefaultKeyFormat.php
* copy /tools/build/*  (all the build tools)
* include the tools / build stuff --> from ssh://git@source.youwe.nl:7999/pimb2b/pimcore-capistrano.git
* include plugins through composer:
    * PimcoreDeployment
    * PimcoreFixtures
    * PimcoreHrefTypeahead
    * PimcoreObjectBridge
    * PimcoreObjectDefaults
    * PimcoreQuickstart (this plugin)
    * PimcoreShop
* run composer update
* instruct the user of what is left to do 
    
We replicate the pimcore tree structure inside the plugin,
so we can easily put all the files into place using magic.


Getting started
---------------

* create a new repository on ie. bitbucket

* create the project (https://www.pimcore.org/docs/latest/Installation_and_Upgrade/System_Setup_and_Hosting/Composer_Install.html)

```bash
cd /data/projects/
composer create-project pimcore/pimcore ./your-project-name-pimcore
cd your-project-name-pimcore
composer dumpautoload -o
```

* require quickstart

```bash
composer require youwe/pimcore-quickstart
```

* run the quickstart script to complete the baseproject

```bash
./plugins/PimcoreQuickstart/cli/quickstart.sh
```

* verify the output of the script!!

* follow the instructions on screen

* push your new project to your new git repo

```bash
cd /data/projects/your-project-name-pimcore
git init
git add --all
git commit -m "Initial Commit"
git remote add origin ssh://git@source.youwe.nl:7999/pimb2b/pimcore-your-project-name.git
git push -u origin master
```

* continue local setup instructions from the README.md of the new project


Commands
--------

Initialize the project from the plugin:
* /plugins/PimcoreQuickstart/cli/quickstart.sh

DO NOT USE (this is only for quickstart-plugin-development purposes):
* /plugins/PimcoreQuickstart/cli/copy-project-files-to-plugin.sh


Installation
------------

```sh
composer require youwe/pimcore-quickstart
```

Add to /.gitignore :

```
/plugins/PimcoreQuickstart
```
