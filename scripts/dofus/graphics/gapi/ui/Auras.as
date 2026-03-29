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
_global.dofus["\r\x13"].gapi.ui.Auras = function()
{
   super();
};
dofus["\r\x13"].gapi.ui.Auras.prototype = new ank.gapi.core["\x1e\n\x0f"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.Auras.prototype;
_loc1.__set__Nombre = function(sValue)
{
   this._miName = sValue;
};
_loc1.__set__Auras = function(sValue)
{
   var _loc2_ = sValue.split("|");
   this._sNombre = _loc2_[1];
   this._aAuras = _loc2_[0].split(";");
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.Auras.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._dgLogros.addEventListener("itemSelected",this);
   this._csColors.addEventListener("change",this);
   this._btnCerrar.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
   this._btnNo.addEventListener("click",this);
   this._btnAlmanax.addEventListener("click",this);
   this._btnServi.addEventListener("click",this);
   this._btnOrnaments.addEventListener("click",this);
   this._btnLogros.addEventListener("click",this);
   this._btnCompra.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._dgLogros.columnsNames = ["Auras",""];
   this._btnOk.label = "Ok";
   this._btnNo.label = "Ninguna";
   this._txtMinombre.text = this._sNombre;
   this._txtNombre.text = "";
};
_loc1.initData = function()
{
   this._svPersonaje.zoom = 250;
   this._svPersonaje.spriteAnims = ["StaticF"];
   this._svPersonaje.refreshDelay = 50;
   this._svPersonaje.spriteData = this.api.datacenter.Player.data;
   this._aLogros = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc4_ = this._aAuras;
   var _loc6_ = true;
   var _loc5_ = 0;
   var _loc3_;
   var _loc2_;
   for(_loc5_ in _loc4_)
   {
      _loc3_ = _loc4_[_loc5_];
      _loc2_ = new Object();
      _loc2_.id = _loc3_.split(",")[0];
      _loc2_.name = _loc3_.split(",")[1];
      _loc2_.precio = _loc3_.split(",")[2];
      _loc2_.owner = _loc2_.precio == undefined;
      this._aLogros.push(_loc2_);
   }
   this._dgLogros.dataProvider = this._aLogros;
};
_loc1.change = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) === this._csColors)
   {
      this.setColors(oEvent.value);
   }
};
_loc1.setColors = function(oColors)
{
   this._nColor = Number(oColors.color1);
   this._txtNombre.textColor = this._nColor;
};
_loc1.itemSelected = function(oEvent)
{
   var _loc3_ = oEvent.target._name;
   var _loc0_;
   var _loc2_;
   if((_loc0_ = _loc3_) === "_dgLogros")
   {
      _loc2_ = this._dgLogros.selectedItem.id;
      this._ldrAura.contentPath = "clips/auras/" + _loc2_ + ".swf";
      if(_loc2_ == 0 || this._dgLogros.selectedItem.owner)
      {
         this._btnOk.label = "OK";
         this._btnOk._visible = true;
         return undefined;
      }
      this._btnOk._visible = false;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOk:
         this.api.network.send("wE" + this._dgLogros.selectedItem.id);
         this.gapi.unloadUIComponent("Auras");
         this.unloadThis();
         break;
      case this._btnNo:
         this.api.network.send("wE0");
      case this._btnCerrar:
         this.gapi.unloadUIComponent("Auras");
         this.unloadThis();
         break;
      case this._btnServi:
         this.api.network.send("ZoC");
         break;
      case this._btnCompra:
         if(!this.api.datacenter.Game.isFight)
         {
            this.gapi.loadUIAutoHideComponent("Panelcompras","Panelcompras",{nombre:this._sNombre});
         }
         break;
      case this._btnAlmanax:
         this.api.network.send("ZA");
         break;
      case this._btnOrnaments:
         if(!this.api.datacenter.Game.isFight)
         {
            this.api.network.send("Zn");
         }
         break;
      case this._btnLogros:
         this.api.network.send("Zt");
   }
};
_loc1.addProperty("auras",function()
{
}
,_loc1.__set__Auras);
_loc1._sNombre = "";
_loc1._aLogros = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.ui.Auras.CLASS_NAME = "Auras";
