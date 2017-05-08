<?php

namespace PimcoreQuickstart;

class Manager
{

    const UPDATE_PLUGIN = 1;
    const UPDATE_PROJECT = 2;

    public $files = [
        // readme
        '/README.md',
        '/.gitignore',
        // environment configurations
        '/website/var/config/production.system.php',
        '/website/var/config/acceptance.system.php',
        '/website/var/config/testing.system.php',
        // active configuration
        '/website/var/config/system.php',
        // configuration template
        '/website/var/config/system.example.php',
        // extensions config (enabled / disabled)
        '/website/var/config/extensions.php',
        // deployment-plugin jsons to generate pimcore classes
        '/website/var/plugins/PimcoreDeployment/migration/classes/class_Category.json',
        '/website/var/plugins/PimcoreDeployment/migration/classes/class_OutputChannel.json',
        '/website/var/plugins/PimcoreDeployment/migration/classes/class_Product.json',
        '/website/var/plugins/PimcoreDeployment/migration/classes/class_ProductSite.json',
        '/website/var/plugins/PimcoreDeployment/migration/classes/class_Site.json',
        // fixtures-plugin ymls to load some default data from fixtures
        '/website/var/plugins/PimcoreFixtures/fixtures/000_permissions.yml',
        '/website/var/plugins/PimcoreFixtures/fixtures/003_user.yml',
        '/website/var/plugins/PimcoreFixtures/fixtures/50_categories.yml',
        '/website/var/plugins/PimcoreFixtures/fixtures/51_categories.yml',
        '/website/var/plugins/PimcoreFixtures/fixtures/52_categories.yml',
        '/website/var/plugins/PimcoreFixtures/fixtures/100_sites.yml',
        '/website/var/plugins/PimcoreFixtures/fixtures/150_outputchannels.yml',
        '/website/var/plugins/PimcoreFixtures/fixtures/223_product.yml',
        // Pimcore Object Classes parent structure
        '/website/lib/Object/Base/Concrete.php',
        '/website/lib/Object/Traits/DefaultKeyFormat.php',
        '/website/lib/Object/Traits/DefaultParentObject.php',
        // Pimcore Object parent classes for defined classes
        '/website/lib/Object/BaseCategory.php',
        '/website/lib/Object/BaseOutputChannel.php',
        '/website/lib/Object/BaseProduct.php',
        '/website/lib/Object/BaseProductSite.php',
        '/website/lib/Object/BaseSite.php',
        // build files
        '/tools/build/common.func.sh',
        '/tools/build/local.cfg',
        '/tools/build/local.cfg.template',
        '/tools/build/local-build.sh',
        '/tools/build/server-build.sh',
        '/tools/build/dumps/db_structure.sql',
        '/tools/build/dumps/kill_tables.sql',
        '/tools/build/dumps/post_install.sql',
        '/tools/build/steps/clear_cache_local.sh',
        '/tools/build/steps/composer.sh',
        '/tools/build/steps/import_db.sh',
        '/tools/build/steps/import_db_server.sh',
        '/tools/build/steps/load_fixtures.sh',
        '/tools/build/steps/update_classdefinitions.sh'
    ];

    public $placeholders = [
        "local_db_username"                         => "root",
        "local_db_password"                         => "root",
        "local_db_name"                             => "your_project_name_pimcore",
        "local_db_host"                             => "127.0.0.1",
        "local_db_port"                             => "3306",
        "project_name"                              => "Your Project Name",
        "project_short_name"                        => "project-name-pimcore",
        // source files are in capistrano git, so we should not auto-fill them:
//        "deployment_server_global_ip_address"       => "333.333.333.333",
//        "deployment_server_testing_username"        => "testing_login_name",
//        "deployment_server_acceptance_username"     => "acceptance_login_name",
//        "deployment_server_production_username"     => "production_login_name",
    ];

//    * PimcoreDeployment
//    * PimcoreFixtures
//    * PimcoreHrefTypeahead
//    * PimcoreObjectBridge
//    * PimcoreQuickstart (this plugin)
//    * PimcoreShop
//    * PimcoreObjectDefaults

    public $pimcoreFilesRoot = PIMCORE_DOCUMENT_ROOT;
    public $pluginFilesRoot = PIMCORE_PLUGINS_PATH . '/PimcoreQuickstart/data';


    public function __construct()
    {
    }

    public function copyProjectFilesToPlugin()
    {
        $source = $this->pimcoreFilesRoot;
        $target = $this->pluginFilesRoot;
        $files = $this->files;
        $this->copyFiles($source, $target, $files, self::UPDATE_PLUGIN);
    }

    public function copyPluginFilesToProject()
    {
        $this->getUserPlaceholderInput();
        $source = $this->pluginFilesRoot;
        $target = $this->pimcoreFilesRoot;
        $files = $this->files;
        $this->copyFiles($source, $target, $files, self::UPDATE_PROJECT);
    }

    public function copyFiles($source, $target, $files, $direction) {
        foreach($files as &$file) {
            $sourcefile = $targetfile = $file;

            // @TODO: change to array if more files need to be renamed
            if($file == '/.gitignore') {
                if($direction == self::UPDATE_PLUGIN)
                {
                    $targetfile = '/_____.gitignore';
                }
                elseif ($direction == self::UPDATE_PROJECT)
                {
                    $sourcefile = '/_____.gitignore';
                }
            }
            $s = $source . $sourcefile;
            $t = $target . $targetfile;
            echo "\nCopying:\n" . $s . " to\n" . $t . "\n\n";

            if(file_exists($t) && $direction == self::UPDATE_PLUGIN) {
                echo "Target file exists - skipping\n";
            }
            else {
                if (file_exists($s)) {
                    $path = dirname($t);
                    //                echo "[". $path . "]\n";
                    if (!file_exists($path)) {
                        mkdir($path, 0777, true);
                    }
                    copy($s, $t);
                    echo "Copied\n";
                    if($direction == self::UPDATE_PROJECT) {
                        $this->parse($t);
                        echo "+ Parsed\n";
                    }
                }
                else {
                    echo "Source file not found!\n";
                }
            }
        }
    }

    public function parse($file) {
        $content = file_get_contents($file);
        foreach($this->placeholders as $p => &$v) {
            $content = str_replace('{[{[{' . $p . '}]}]}', $v, $content);
        }
        file_put_contents($file, $content);
    }

    public function getUserPlaceholderInput() {
        foreach($this->placeholders as $p => &$v) {
            // get input for $p ...
            $input = readline('Enter ' . $p . ' [' . $v . ']: ');
            if($input) {
                $v = $input;
            }
        }
        print_r($this->placeholders);
        readline("\n\nPress enter to continue, or ctrl-c to abort\n\n");
    }

}

