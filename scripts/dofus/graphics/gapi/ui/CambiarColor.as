_global.dofus.graphics.gapi.ui.CambiarColor = function()
{
   super();
};
dofus.graphics.gapi.ui.CambiarColor.prototype = new ank.gapi.core.UIAdvancedComponent();
var _loc1 = _global.dofus.graphics.gapi.ui.CambiarColor.prototype;
_loc1.init = function()
{
   super.init(false,"CambiarColor");
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.__set__Clase = function(sData)
{
   this.sClase = sData;
};
_loc1.__set__ColorA = function(sData)
{
   this.sColorA = sData;
};
_loc1.__set__ColorB = function(sData)
{
   this.sColorB = sData;
};
_loc1.__set__ColorC = function(sData)
{
   this.sColorC = sData;
};
_loc1.initData = function()
{
   this._oColors = {color1:this.sColorA,color2:this.sColorB,color3:this.sColorC};
   this._svPersonaje.zoom = 400;
   this._svPersonaje.spriteAnims = ["StaticR","StaticS","StaticL","StaticF"];
   this._svPersonaje.refreshDelay = 50;
   this._svPersonaje.useSingleLoader = true;
   this._svPersonaje.spriteData = new ank.battlefield.datacenter.Sprite("1",undefined,dofus.Constants.CLIPS_PERSOS_PATH + this.sClase + ".swf",undefined,5);
   this._svPersonaje.setColors(this._oColors);
   this._csColores.breed = this.api.datacenter.Player.Guild;
   this._csColores.sex = this.api.datacenter.Player.Sex;
   this._nSavedColor = -1;
};
_loc1.addListeners = function()
{
   this._btnOk.addEventListener("click",this);
   this._btnCerrar.addEventListener("click",this);
   this._csColores.addEventListener("over",this);
   this._csColores.addEventListener("out",this);
   this._csColores.addEventListener("change",this);
};
_loc1.initTexts = function()
{
   this._btnOk.label = "OK";
   this._btnCerrar.label = "CANCEL";
   this._txtNombrePj.text = this.api.datacenter.Player.Name;
   this._txtTitulo.text = this.api.lang.getText("CHANGE_COLOR");
};
_loc1.mostrarColor = function(nIndex)
{
   var bWhite = true;
   this._nSavedColor = this._svPersonaje.getColor(nIndex);
   this.onEnterFrame = function()
   {
      bWhite = !bWhite;
      this._svPersonaje.setColor(nIndex,!bWhite ? 16746632 : 16733525);
   };
};
_loc1.esconderColor = function(nIndex)
{
   delete this.onEnterFrame;
   this._svPersonaje.setColor(nIndex,this._nSavedColor);
};
_loc1.cambiarColor = function(oColors)
{
   this._oColors = oColors;
   this._svPersonaje.setColors(this._oColors);
};
_loc1.over = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) === this._csColores)
   {
      this.mostrarColor(oEvent.index);
   }
};
_loc1.out = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) === this._csColores)
   {
      this.esconderColor(oEvent.index);
   }
};
_loc1.change = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) === this._csColores)
   {
      this.cambiarColor(oEvent.value);
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOk:
         this.api.network.send("ZsC" + this._svPersonaje.getColor(1) + ";" + this._svPersonaje.getColor(2) + ";" + this._svPersonaje.getColor(3));
         break;
      case this._btnCerrar:
         this.gapi.unloadUIComponent("Panel");
         this.unloadThis();
   }
};
_loc1.addProperty("colora",function()
{
}
,_loc1.__set__ColorA);
_loc1.addProperty("colorb",function()
{
}
,_loc1.__set__ColorB);
_loc1.addProperty("colorc",function()
{
}
,_loc1.__set__ColorC);
_loc1.addProperty("clase",function()
{
}
,_loc1.__set__Clase);
ASSetPropFlags(_loc1,null,1);
_global.dofus.graphics.gapi.ui.CambiarColor.CLASS_NAME = "CambiarColor";
