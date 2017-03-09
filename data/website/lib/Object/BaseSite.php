<?php

namespace Object;

abstract class BaseSite extends \Object\Base\Concrete
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
        return '/sites';
    }

    /**
     * @return string
     */
    public function getDefaultKeyFormat()
    {
        return 'site';
    }

    protected function update()
    {
        parent::update();
    }

}
