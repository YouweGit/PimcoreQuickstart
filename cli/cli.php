<?php

require_once __DIR__ . '/bootstrap.php';
use Pimcore\Cache;
use \Pimcore\Model\Version;

//this is optional, memory limit could be increased further (pimcore default is 1024M)
ini_set('memory_limit', '1024M');
ini_set("max_execution_time", "-1");

$time = microtime(true);
$memory = memory_get_usage();

//execute in admin mode
define("PIMCORE_ADMIN", true);

$actionen = [
    'copy-project-files-to-plugin',
    'copy-plugin-files-to-project',
];

try {
    $opts = new Zend_Console_Getopt(array(
        'action|a=s' => '',
        'ignore-maintenance-mode' => 'forces the script execution even when the maintenance mode is activated',
    ));
    $opts->parse();

    if (!isset($opts->action) || !in_array($opts->action, $actionen)) {
        throw new Exception(
            "\n" .
            "USAGE INSTRUCTIONS" .
            "\n" .
            'Action parameter should be one of the following:' . "\n" .
            'copy-plugin-files-to-project   : set up project' . "\n" .
            'copy-project-files-to-plugin   : update plugin (DEV ONLY)' . "\n" .
            "\n" .
            'Example:' . "\n" .
            'php migration.php -a export-definition' . "\n" .
            "\n" .
            '');
    }

} catch (Zend_Console_Getopt_Exception $e) {
    echo $e->getUsageMessage() . "\n";
    exit(1);
} catch (Exception $e) {
    echo $e->getMessage() . "\n";
    exit(1);
}

Version::disable();
Cache::disable();

$plugin = 'PimcoreQuickstart';
if (!\Pimcore\ExtensionManager::isEnabled('plugin', $plugin)) {
    echo "\nEnabling plugin on the fly.\n";
    \Pimcore\ExtensionManager::enable('plugin', $plugin);
    $command = 'php ' . implode(' ', $argv);
    echo "\nRe-executing command: [ $command ] \n";
    echo shell_exec($command);
    die();
}

$handler   = new \PimcoreQuickstart\Manager();

switch ($opts->action) {
    case 'copy-plugin-files-to-project':
        $handler->copyPluginFilesToProject();
        break;
    case 'copy-project-files-to-plugin':
        $handler->copyProjectFilesToPlugin();
        break;
}



