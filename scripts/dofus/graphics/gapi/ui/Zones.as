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
_global.dofus["\r\x13"].gapi.ui.Zones = function()
{
   super();
};
_global.dofus["\r\x13"].gapi.ui.Zones.prototype = new ank.gapi.core["\x1e\n\x0e"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.Zones.prototype;
_loc1.__set__data = function(eaData)
{
   this.addToQueue({object:this,method:function(d)
   {
      this._eaData = d;
      if(this.initialized)
      {
         this.initData();
      }
   },params:[eaData]});
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.Zones.CLASS_NAME);
};
_loc1.callClose = function()
{
   this.api.network.Zones.leave();
   return true;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initTexts = function()
{
   this._winBg.title = this.api.lang.getText("ZONES_LIST");
   this._lblName.text = this.api.lang.getText("AREA") + " (" + this.api.lang.getText("SUBAREA") + ")";
   this._btnClose2.label = this.api.lang.getText("CLOSE");
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnClose2.addEventListener("click",this);
   this._lstZones.addEventListener("itemSelected",this);
};
_loc1.initData = function()
{
   if(this._eaData != undefined)
   {
      this._eaData.sortOn("fieldToSort",Array.CASEINSENSITIVE);
      this._lstZones.dataProvider = this._eaData;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnClose":
      case "_btnClose2":
         this.callClose();
   }
};
_loc1.itemSelected = function(oEvent)
{
   var _loc2_ = oEvent.row.item;
   if(_loc2_.isCurrent)
   {
      return undefined;
   }
   this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_U_USE_ZONE",[_loc2_.name]),"CAUTION_YESNO",{name:"Zone",listener:this,params:{mapaID:_loc2_.id}});
};
_loc1.yes = function(oEvent)
{
   this.api.network.Zones.use(oEvent.target.params.mapaID);
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.ui.Zones.CLASS_NAME = "Zones";
