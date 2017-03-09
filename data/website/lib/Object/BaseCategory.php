<?php

namespace Object;

abstract class BaseCategory extends \Object\Base\Concrete
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
    abstract public function getName();

    /**
     * @return string
     */
    public function getDefaultParentPath()
    {
        return '/categories';
    }

    /**
     * @return string
     */
    public function getDefaultKeyFormat()
    {
        return 'category';
    }

    protected function update()
    {
        parent::update();
    }

}
