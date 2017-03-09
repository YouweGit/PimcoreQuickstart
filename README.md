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
* include plugins through composer:
    * PimcoreDeployment
    * PimcoreFixtures
    * PimcoreHrefTypeahead
    * PimcoreObjectBridge
    * PimcoreObjectDefaults
    * PimcoreQuickstart (this plugin)
    * PimcoreShop
* include the tools / build stuff --> from ssh://git@source.youwe.nl:7999/pimb2b/pimcore-capistrano.git
    
We replicate the pimcore tree structure inside the plugin,
so we can easily put all the files into place using magic.


Commands
--------

Initialize the project from the plugin:
* /plugins/PimcoreQuickstart/cli/quickstart.sh

DO NOT USE (only for development):
* /plugins/PimcoreQuickstart/cli/copy-project-files-to-plugin.sh


Installation
------------

```sh
composer require youwe/pimcore-quickstart
```

