if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.graphics)
{
   _global.dofus.graphics = new Object();
}
if(!dofus.graphics.gapi)
{
   _global.dofus.graphics.gapi = new Object();
}
if(!dofus.graphics.gapi.ui)
{
   _global.dofus.graphics.gapi.ui = new Object();
}
_global.dofus.graphics.gapi.ui.Almanax = function()
{
   super();
};
dofus.graphics.gapi.ui.Almanax.prototype = new ank.gapi.core.UIAdvancedComponent();
var _loc1 = _global.dofus.graphics.gapi.ui.Almanax.prototype;
_loc1.__set__Avance = function(nValue)
{
   this._sAvance = nValue;
};
_loc1.__set__Dia = function(nValue)
{
   this._nDia = Number(nValue);
};
_loc1.__set__Mes = function(nValue)
{
   this._nMes = Number(nValue);
};
_loc1.__set__Año = function(nValue)
{
   this._nAño = Number(nValue);
};
_loc1.__set__Solicita = function(nValue)
{
   this._sSolicita = nValue;
};
_loc1.__set__Bonus = function(nValue)
{
   this._sBonus = nValue;
};
_loc1.__set__Nombre = function(sData)
{
   this._sNombre = sData;
};
_loc1.__set__OK = function(nValue)
{
   this._bOK = nValue == "1";
};
_loc1.init = function()
{
   super.init(false,dofus.graphics.gapi.ui.Almanax.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnCerrar.addEventListener("click",this);
   this._btnDarOfrenda.addEventListener("click",this);
   this._btnLogros.addEventListener("click",this);
   this._btnServi.addEventListener("click",this);
   this._btnOrnaments.addEventListener("click",this);
   this._btnCompra.addEventListener("click",this);
   this._btnAura.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._btnDarOfrenda.label = this.api.lang.getText("DAR_OFRENDA");
   this._txtDia.text = this._nDia;
   this._txtMes.text = this.api.lang.getConfigText("MONTHS")[this._nMes];
   this._txtAño.text = "Ans " + this._nAño;
   var _loc2_ = this._sAvance.split(",")[0];
   var _loc3_ = this._sAvance.split(",")[1];
   this._txtNombre.text = this._sNombre;
   this._txtProgreso.text = _loc2_ + "/" + _loc3_;
   this._pbProgreso.value = Number(_loc2_);
   this._pbProgreso.maximum = Number(_loc3_);
   this._ldrConstelacion.contentPath = "constelacion_" + this._nMes;
   this._ldrMes.contentPath = "mes_" + this._nMes;
   var _loc5_ = this._sSolicita.split(",")[1];
   var _loc8_ = this._sSolicita.split(",")[0];
   this._txtCantidad.text = _loc5_;
   var _loc4_ = new dofus.datacenter.Item(0,Number(_loc8_));
   this._ldrItem.contentPath = _loc4_.iconFile;
   this._txtNombreItem.text = _loc4_.name;
   this._ldrOK.contentPath = !this._bOK ? "ChallengeKO" : "ChallengeOK";
   var _loc6_ = this._sBonus.split(",")[1];
   var _loc7_ = this._sBonus.split(",")[0];
   this._txtBonus.text = this.api.lang.getText("BONUS_" + _loc7_,[_loc6_]);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnCerrar:
         this.api.ui.unloadUIComponent("Almanax");
         this.unloadThis();
         break;
      case this._btnDarOfrenda:
         this.api.network.send("ZB");
         this.api.ui.unloadUIComponent("Almanax");
         break;
      case this._btnServi:
         this.api.network.send("ZoC");
         break;
      case this._btnLogros:
         this.api.network.send("Zt");
         break;
      case this._btnAura:
         this.api.network.send("we");
         this.api.ui.unloadUIComponent("Panel");
         break;
      case this._btnCompra:
         if(!this.api.datacenter.Game.isFight)
         {
            this.gapi.loadUIAutoHideComponent("Panelcompras","Panelcompras",{nombre:this._sNombre});
         }
         break;
      case this._btnOrnaments:
         if(!this.api.datacenter.Game.isFight)
         {
            this.api.network.send("Zn");
            break;
         }
   }
};
_loc1.addProperty("dia",function()
{
}
,_loc1.__set__Dia);
_loc1.addProperty("mes",function()
{
}
,_loc1.__set__Mes);
_loc1.addProperty("año",function()
{
}
,_loc1.__set__Año);
_loc1.addProperty("solicita",function()
{
}
,_loc1.__set__Solicita);
_loc1.addProperty("bonus",function()
{
}
,_loc1.__set__Bonus);
_loc1.addProperty("avance",function()
{
}
,_loc1.__set__Avance);
_loc1.addProperty("ok",function()
{
}
,_loc1.__set__OK);
_loc1.addProperty("nombre",function()
{
}
,_loc1.__set__Nombre);
ASSetPropFlags(_loc1,null,1);
_loc1._nDia = Number(1);
_loc1._nMes = Number(0);
_loc1._nAño = Number(2013);
_loc1._sNombre = "";
_loc1._sSolicita = "";
_loc1._sBonus = "";
_loc1._sAvance = "0,365";
_loc1._bOK = Boolean(false);
_global.dofus.graphics.gapi.ui.Almanax.CLASS_NAME = "Almanax";
