<?php

namespace Object;

abstract class BaseProductSite extends \Object\Base\Concrete
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
    public function getName() {
        return 'productsite-' . $this->getId();
    }

    /**
     * @return string
     */
    public function getDefaultParentPath()
    {
        return '/productsite';
    }

    /**
     * @return string
     */
    public function getDefaultKeyFormat()
    {
        return 'productsite';
    }

    protected function update()
    {
        parent::update();
    }

}
