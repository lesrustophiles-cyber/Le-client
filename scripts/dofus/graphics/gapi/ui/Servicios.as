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
_global.dofus["\r\x13"].gapi.ui.Servicios = function()
{
   super();
};
dofus["\r\x13"].gapi.ui.Servicios.prototype = new ank.gapi.core["\x1e\n\x0f"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.Servicios.prototype;
_loc1.__set__Ogrinas = function(nValue)
{
   this._nOgrinas = Number(nValue);
};
_loc1.__set__Creditos = function(nValue)
{
   this._nCreditos = Number(nValue);
};
_loc1.__set__Data = function(sData)
{
   this._sData = sData;
};
_loc1.__set__Link = function(sData)
{
   this._sLink = sData;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.Servicios.CLASS_NAME);
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
   this._btnComprar.addEventListener("click",this);
   var _loc3_ = 0;
   while(_loc3_ <= 11)
   {
      this["_btnClase" + _loc3_].addEventListener("click",this);
      _loc3_ += 1;
   }
   if(_global.NO_CREDITOS)
   {
      this._txtCreditos._visible = false;
      this._iconCreditos._visible = false;
      this._txtOgrinas._y -= 15;
      this._iconOgrinas._y -= 15;
   }
};
_loc1.initTexts = function()
{
   this._txtOgrinas.text = this._nOgrinas;
   this._txtCreditos.text = this._nCreditos;
   this._txtComprar.text = this.api.lang.getText("BUY");
   var _loc2_ = 0;
   var _loc3_;
   while(_loc2_ <= 11)
   {
      _loc3_ = this.api.lang.getClassText(_loc2_ + 1);
      this["_lblClassName" + _loc2_].text = _loc3_.ln;
      this["price" + _loc2_].text = this._sData;
      _loc2_ += 1;
   }
};
_loc1.initData = function()
{
   var _loc8_ = this._sData.split("|");
   var _loc9_ = _loc8_.length;
   var _loc7_ = new ank.utils.ExtendedArray();
   var _loc4_ = 0;
   var _loc5_;
   var _loc6_;
   var _loc3_;
   while(_loc4_ < _loc9_)
   {
      _loc5_ = _loc8_[_loc4_];
      if(!(_loc5_ == undefined || _loc5_ == ""))
      {
         _loc6_ = _loc5_.split(";");
         _loc3_ = new Object();
         _loc3_.id = _global.parseInt(_loc6_[0]);
         _loc3_.descripcion = this.api.lang.getText("SERVICIO_" + _loc3_.id);
         _loc3_.ogrinas = _global.parseInt(_loc6_[1]);
         _loc7_.push(_loc3_);
      }
      _loc4_ = _loc4_ + 1;
   }
   this._dgServicios.dataProvider = _loc7_;
};
_loc1.actualizar = function(nCreditos, nOgrinas)
{
   this._nOgrinas = Number(nOgrinas);
   this._txtOgrinas.text = this._nOgrinas;
   this._nCreditos = Number(nCreditos);
   this._txtCreditos.text = this._nCreditos;
};
_loc1.click = function(oEvent)
{
   var _loc2_;
   switch(oEvent.target._name)
   {
      case "_btnClase0":
         _loc2_ = this.api.lang.getClassText(1);
         this._nID = 1;
         this.api.kernel.showMessage(this.api.lang.getText("PANEL_OGRINAS"),this.api.lang.getText("CONFIRMAR_GASTO") + " " + "x" + _loc2_.ln + ", " + this._sData + " " + this.api.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
         break;
      case "_btnClase1":
         _loc2_ = this.api.lang.getClassText(2);
         this._nID = 2;
         this.api.kernel.showMessage(this.api.lang.getText("PANEL_OGRINAS"),this.api.lang.getText("CONFIRMAR_GASTO") + " " + "x" + _loc2_.ln + ", " + this._sData + " " + this.api.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
         break;
      case "_btnClase2":
         _loc2_ = this.api.lang.getClassText(3);
         this._nID = 3;
         this.api.kernel.showMessage(this.api.lang.getText("PANEL_OGRINAS"),this.api.lang.getText("CONFIRMAR_GASTO") + " " + "x" + _loc2_.ln + ", " + this._sData + " " + this.api.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
         break;
      case "_btnClase3":
         _loc2_ = this.api.lang.getClassText(4);
         this._nID = 4;
         this.api.kernel.showMessage(this.api.lang.getText("PANEL_OGRINAS"),this.api.lang.getText("CONFIRMAR_GASTO") + " " + "x" + _loc2_.ln + ", " + this._sData + " " + this.api.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
         break;
      case "_btnClase4":
         _loc2_ = this.api.lang.getClassText(5);
         this._nID = 5;
         this.api.kernel.showMessage(this.api.lang.getText("PANEL_OGRINAS"),this.api.lang.getText("CONFIRMAR_GASTO") + " " + "x" + _loc2_.ln + ", " + this._sData + " " + this.api.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
         break;
      case "_btnClase5":
         _loc2_ = this.api.lang.getClassText(6);
         this._nID = 6;
         this.api.kernel.showMessage(this.api.lang.getText("PANEL_OGRINAS"),this.api.lang.getText("CONFIRMAR_GASTO") + " " + "x" + _loc2_.ln + ", " + this._sData + " " + this.api.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
         break;
      case "_btnClase6":
         _loc2_ = this.api.lang.getClassText(7);
         this._nID = 7;
         this.api.kernel.showMessage(this.api.lang.getText("PANEL_OGRINAS"),this.api.lang.getText("CONFIRMAR_GASTO") + " " + "x" + _loc2_.ln + ", " + this._sData + " " + this.api.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
         break;
      case "_btnClase7":
         _loc2_ = this.api.lang.getClassText(8);
         this._nID = 8;
         this.api.kernel.showMessage(this.api.lang.getText("PANEL_OGRINAS"),this.api.lang.getText("CONFIRMAR_GASTO") + " " + "x" + _loc2_.ln + ", " + this._sData + " " + this.api.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
         break;
      case "_btnClase8":
         _loc2_ = this.api.lang.getClassText(9);
         this._nID = 9;
         this.api.kernel.showMessage(this.api.lang.getText("PANEL_OGRINAS"),this.api.lang.getText("CONFIRMAR_GASTO") + " " + "x" + _loc2_.ln + ", " + this._sData + " " + this.api.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
         break;
      case "_btnClase9":
         _loc2_ = this.api.lang.getClassText(10);
         this._nID = 10;
         this.api.kernel.showMessage(this.api.lang.getText("PANEL_OGRINAS"),this.api.lang.getText("CONFIRMAR_GASTO") + " " + "x" + _loc2_.ln + ", " + this._sData + " " + this.api.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
         break;
      case "_btnClase10":
         _loc2_ = this.api.lang.getClassText(11);
         this._nID = 11;
         this.api.kernel.showMessage(this.api.lang.getText("PANEL_OGRINAS"),this.api.lang.getText("CONFIRMAR_GASTO") + " " + "x" + _loc2_.ln + ", " + this._sData + " " + this.api.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
         break;
      case "_btnClase11":
         _loc2_ = this.api.lang.getClassText(12);
         this._nID = 12;
         this.api.kernel.showMessage(this.api.lang.getText("PANEL_OGRINAS"),this.api.lang.getText("CONFIRMAR_GASTO") + " " + "x" + _loc2_.ln + ", " + this._sData + " " + this.api.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
         break;
      default:
         break;
      case "_btnCerrar":
         this.close();
         return undefined;
   }
};
_loc1.yes = function(oEvent)
{
   this.api.network.send("wL" + this._nID);
};
_loc1.close = function()
{
   this.gapi.unloadUIComponent("Panel");
   this.unloadThis();
};
_loc1.addProperty("ogrinas",function()
{
}
,_loc1.__set__Ogrinas);
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
_loc1._sLink = "http://silouate.eu/boutique";
_loc1._sData = 0;
_loc1._nID = 0;
_loc1._nOgrinas = 0;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.ui.Servicios.CLASS_NAME = "Servicios";
