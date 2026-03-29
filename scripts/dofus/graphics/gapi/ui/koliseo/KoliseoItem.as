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
if(!dofus["\r\x13"].gapi.ui.koliseo)
{
   _global.dofus["\r\x13"].gapi.ui.koliseo = new Object();
}
_global.dofus["\r\x13"].gapi.ui.koliseo.KoliseoItem = function()
{
   super();
};
dofus["\r\x13"].gapi.ui.koliseo.KoliseoItem.prototype = new dofus["\r\x13"].gapi.core["\x10\x18"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.koliseo.KoliseoItem.prototype;
_loc1.__set__data = function(oSprite)
{
   this._oSprite = oSprite;
   if(this.initialized)
   {
      this.updateData();
   }
};
_loc1.__get__isInGroup = function(bIsInGroup)
{
   return this._bIsInGroup;
};
_loc1.setHealth = function(oSprite)
{
   if(oSprite.life == undefined)
   {
      return undefined;
   }
   var _loc2_ = oSprite.life.split(",");
   this._mcHealth._yscale = _loc2_[0] / _loc2_[1] * 100;
   this._oSprite.life = oSprite.life;
};
_loc1.setData = function(oSprite)
{
   if(this.doReload(oSprite))
   {
      this._oSprite = oSprite;
      if(this.initialized)
      {
         this.updateData();
      }
   }
   else
   {
      this.setHealth(oSprite);
   }
};
_loc1.doReload = function(oSprite)
{
   var _loc7_ = true;
   var _loc2_;
   var _loc3_;
   var _loc4_;
   var _loc5_;
   if(this._oSprite.accessories && (oSprite.accessories.length == this._oSprite.accessories.length && oSprite.id == this._oSprite.id))
   {
      _loc2_ = this._oSprite.accessories;
      _loc3_ = oSprite.accessories;
      _loc4_ = new Array();
      _loc5_ = new Array();
      for(var _loc6_ in _loc2_)
      {
         _loc4_.push(_loc2_[_loc6_].unicID);
      }
      for(_loc6_ in _loc3_)
      {
         _loc5_.push(_loc3_[_loc6_].unicID);
      }
      _loc4_.sort();
      _loc5_.sort();
      _loc7_ = !_loc4_ || _loc4_.join(",") != _loc5_.join(",");
   }
   return _loc7_;
};
_loc1.init = function()
{
   super.init(false);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this._mcBack._visible = false;
   this._mcHealth._visible = false;
   this._btn._visible = false;
};
_loc1.addListeners = function()
{
   this._ldrSprite.addEventListener("initialization",this);
   this._btn.addEventListener("over",this);
   this._btn.addEventListener("out",this);
   this._btn.addEventListener("click",this);
};
_loc1.updateData = function()
{
   if(this._oSprite != undefined)
   {
      this._ldrSprite.contentPath = this._oSprite.gfxFile != undefined ? this._oSprite.gfxFile : "";
      this.api.colors.addSprite(this._ldrSprite,this._oSprite);
      this._mcBack._visible = true;
      this._btn.enabled = true;
      this._btn._visible = true;
      this._mcHealth._visible = true;
      this.setHealth(this._oSprite.life);
      this._bIsInGroup = true;
      this._visible = true;
   }
   else
   {
      this._ldrSprite.contentPath = "";
      this._mcBack._visible = false;
      this._mcFollow._visible = false;
      this._btn.enabled = false;
      this._btn._visible = false;
      this._mcHealth._visible = false;
      this._bIsInGroup = false;
      this._visible = false;
   }
};
_loc1.isLocalPlayer = function()
{
   return this._oSprite.id == this.api.datacenter.Player.ID;
};
_loc1.partyWhere = function()
{
   this.api.network.Koliseo.where();
   this.api.ui.loadUIAutoHideComponent("MapExplorer","MapExplorer");
};
_loc1.initialization = function(oEvent)
{
   var _loc1_ = oEvent.target.content;
   _loc1_.attachMovie("staticR","anim",10);
   _loc1_._xscale = -65;
   _loc1_._yscale = 65;
};
_loc1.over = function(oEvent)
{
   var _loc2_ = this._oSprite.life.split(",");
   this._mcHealth._yscale = _loc2_[0] / _loc2_[1] * 100;
   this.gapi.showTooltip(this._oSprite.name + "\n" + this.api.lang.getText("LEVEL") + " : " + this._oSprite.level + "\n" + this.api.lang.getText("LIFEPOINTS") + " : " + _loc2_[0] + " / " + _loc2_[1],oEvent.target,30);
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.click = function(oEvent)
{
   this.api.kernel.GameManager.showPlayerPopupMenu(undefined,this._oSprite.name,undefined,undefined,undefined,undefined,undefined,this);
};
_loc1.addPartyMenuItems = function(pm)
{
   pm.addStaticItem(this.api.lang.getText("KOLISEO"));
   if(this._oSprite.id == this.api.datacenter.Player.ID)
   {
      pm.addItem(this.api.lang.getText("LEAVE_PARTY"),this.api.network.Koliseo,this.api.network.Koliseo.leave,[]);
   }
};
_loc1.addProperty("isInGroup",_loc1.__get__isInGroup,function()
{
}
);
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
ASSetPropFlags(_loc1,null,1);
