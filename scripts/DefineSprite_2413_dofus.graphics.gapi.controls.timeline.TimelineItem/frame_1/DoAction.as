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
if(!["\r\x13"].gapi.controls)
{
   _global.dofus["\r\x13"].gapi.controls = new Object();
}
if(!dofus["\r\x13"].gapi.controls["\x1e\x0b\x05"])
{
   _global.dofus["\r\x13"].gapi.controls["\x1e\x0b\x05"] = new Object();
}
var _loc1 = _global.dofus["\r\x13"].gapi.controls["\x1e\x0b\x05"].TimelineItem.prototype;
_loc1.__get__chrono = function()
{
   return this._vcChrono;
};
_loc1.__get__sprite = function()
{
   return this._ldrSprite;
};
_loc1.__set__data = function(oData)
{
   this._oData = oData;
   this.updateHealth();
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.controls["\x1e\x0b\x05"].TimelineItem.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.loadSprite,params:[this._oData.gfxFile]});
};
_loc1.loadSprite = function(sFile)
{
   this._ldrSprite.contentPath = sFile;
   this._ldrSprite.addEventListener("initialization",this);
   this.api.colors.addSprite(this._ldrSprite,this._oData);
   var _loc2_ = new Color(this._mcHealth);
   if(this._oData.Team == 0)
   {
      _loc2_.setTransform({ra:0,rb:255,ga:0,gb:0,ba:0,bb:0,aa:100,ab:100});
   }
   else if(this._oData.Team == 1)
   {
      _loc2_.setTransform({ra:0,rb:0,ga:0,gb:0,ba:0,bb:255,aa:100,ab:100});
   }
   this.updateHealth();
};
_loc1.updateHealth = function()
{
   this._mcHealth._yscale = this._oData._lp / this._oData._lpmax * 100;
};
_loc1.onRollOver = function()
{
   this._mcBackRect._alpha = 50;
   this._oData.mc.onRollOver();
   this._oData.mc.showEffects(true);
};
_loc1.onRollOut = function()
{
   this._mcBackRect._alpha = 100;
   this._oData.mc.onRollOut();
   this._oData.mc.showEffects(false);
};
_loc1.onRelease = function()
{
   var _loc2_;
   var _loc3_;
   if(this._oData.isVisible && (this.api.datacenter.Game.interactionType == 2 || this.api.datacenter.Game.interactionType == 3))
   {
      this._oData.mc.onRelease();
   }
   else
   {
      _loc2_ = this.gapi.getUIComponent("PlayerInfos");
      _loc3_ = _loc2_ != undefined && this._oData != _loc2_.data;
      this.gapi.loadUIComponent("PlayerInfos","PlayerInfos",{data:this._oData},{bForceLoad:_loc3_});
   }
};
_loc1.initialization = function(oEvent)
{
   var _loc2_ = oEvent.target.content;
   if(!_loc2_._elbusta)
   {
      _loc2_.attachMovie("staticR","anim",10);
      _loc2_._x = 15;
      _loc2_._y = 32;
      _loc2_._xscale = -80;
      _loc2_._yscale = 80;
   }
   else
   {
      _loc2_.attachMovie("AnimStatique_1","anim",10);
      _loc2_._x = 15;
      _loc2_._y = 32;
      _loc2_._xscale = -80 * _global.NEW_SIZE / 100;
      _loc2_._yscale = 80 * _global.NEW_SIZE / 100;
   }
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
_loc1.addProperty("sprite",_loc1.__get__sprite,function()
{
}
);
_loc1.addProperty("chrono",_loc1.__get__chrono,function()
{
}
);
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.controls["\x1e\x0b\x05"].TimelineItem.CLASS_NAME = "Timeline";
