<?php

namespace Object;

use Pimcore\Model\Object\Product;

abstract class BaseProduct extends \Object\Base\Concrete
{

    use \Object\Traits\DefaultParentObject;
    use \Object\Traits\DefaultKeyFormat;

    /**
     * @return string
     */
    public function __toString()
    {
        /** @var Product $this */
        return (string)$this->getSku() . ' ' . $this->getName();
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
        return '/products';
    }

    /**
     * @return string
     */
    public function getDefaultKeyFormat()
    {
        return 'product';
    }

    protected function update()
    {
        parent::update();
    }

}
