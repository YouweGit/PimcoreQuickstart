<?php


namespace Object\Traits;

use Pimcore\Model\Object;
use Pimcore\Model\Object\AbstractObject;

trait DefaultParentObject
{

    /**
     * @return string
     */
    abstract public function getDefaultParentPath();

    /**
     * @return AbstractObject
     * @throws \Exception
     */
    public function getDefaultParent()
    {
        return Object\Service::createFolderByPath($this->getDefaultParentPath());
    }

}
