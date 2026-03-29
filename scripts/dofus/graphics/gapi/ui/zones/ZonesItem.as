if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus["\r\x13"])
{
   _global.dofus["\r\x13"] = new Object();
}
if(!dofus["\r\x13"].gapi)
{
   _global.dofus["\r\x13"].gapi = new Object();
}
if(!dofus["\r\x13"].gapi.ui)
{
   _global.dofus["\r\x13"].gapi.ui = new Object();
}
if(!dofus["\r\x13"].gapi.ui.zones)
{
   _global.dofus["\r\x13"].gapi.ui.zones = new Object();
}
_global.dofus["\r\x13"].gapi.ui.zones.ZonesItem = function()
{
   super();
};
dofus["\r\x13"].gapi.ui.zones.ZonesItem.prototype = new dofus["\r\x13"].gapi.core["\x10\x18"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.zones.ZonesItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._lblName.text = oItem.name;
   }
   else if(this._lblName.text != undefined)
   {
      this._lblName.text = "";
   }
};
_loc1.init = function()
{
   super.init(false);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
};
_loc1.click = function(oEvent)
{
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
