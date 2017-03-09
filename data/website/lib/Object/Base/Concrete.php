<?php

namespace Object\Base;

abstract class Concrete extends \Pimcore\Model\Object\Concrete
{

    use \Object\Traits\DefaultParentObject;
    use \Object\Traits\DefaultKeyFormat;

    /**
     * @return string
     */
    public function __toString()
    {
        return (string)$this->getName();
    }

    /**
     * @return string
     */
    public function getDefaultParentPath()
    {
        return '/' . $this->getClassName();
    }

    /**
     * @return string
     */
    public function getDefaultKeyFormat()
    {
        return  $this->getClassName();
    }

    protected function update()
    {
        parent::update();
    }

}
