pimcore.registerNS("pimcore.plugin.pimcorequickstart");

pimcore.plugin.pimcorequickstart = Class.create(pimcore.plugin.admin, {
    getClassName: function() {
        return "pimcore.plugin.pimcorequickstart";
    },

    initialize: function() {
        pimcore.plugin.broker.registerPlugin(this);
    },
 
    pimcoreReady: function (params,broker){
        // alert("PimcoreQuickstart Plugin Ready!");
    }
});

var pimcorequickstartPlugin = new pimcore.plugin.pimcorequickstart();

