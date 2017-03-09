<?php


namespace Object\Traits;

use Pimcore\Model\Object;
use Pimcore\Model\Object\AbstractObject;

trait DefaultKeyFormat
{

    /**
     * @return string
     */
    abstract public function getDefaultKeyFormat();

    /**
     * @return AbstractObject
     * @throws \Exception
     */
    public function getDefaultKey()
    {
//        return $this->getDefaultKeyFormat() . '-' . $this->getSku()?:uniqid();
        return uniqid($this->getDefaultKeyFormat() . '-');
    }
}
