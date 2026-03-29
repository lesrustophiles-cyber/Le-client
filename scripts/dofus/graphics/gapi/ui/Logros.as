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
_global.dofus["\r\x13"].gapi.ui.Logros = function()
{
   super();
   g;
};
dofus["\r\x13"].gapi.ui.Logros.prototype = new ank.gapi.core["\x1e\n\x0e"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.Logros.prototype;
_loc1.__set__data = function(sData)
{
   this._sData = sData;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.Logros.CLASS_NAME);
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
   this._lstLogros.addEventListener("itemSelected",this);
   this._btnClose.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("LOGROS");
   this._dgLogros.columnsNames = ["","Succès",""];
};
_loc1.initData = function()
{
   var _loc14_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   _loc14_.push({id:0,label:"Progression"});
   _loc14_.push({id:1,label:"General"});
   _loc14_.push({id:2,label:"Combats"});
   _loc14_.push({id:3,label:"Quêtes"});
   _loc14_.push({id:4,label:"Alignement"});
   _loc14_.push({id:5,label:"Donjons"});
   _loc14_.push({id:6,label:"Economie"});
   _loc14_.push({id:8,label:"Events"});
   _loc14_.reverse();
   this._lstLogros.dataProvider = _loc14_;
   this._dgLogros._visible = false;
   var _loc15_ = this._sData.split("|")[1];
   var _loc10_ = this._sData.split("|")[0].split(",");
   this._aLogros = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc12_ = this._sData.split("|")[2].split(";");
   var _loc5_ = [0,0,0,0,0,0,0,0,0,0];
   var _loc6_ = [0,0,0,0,0,0,0,0,0,0];
   var _loc4_ = 0;
   var _loc9_;
   var _loc3_;
   var _loc7_;
   var _loc8_;
   for(_loc4_ in _loc12_)
   {
      _loc9_ = _loc12_[_loc4_];
      _loc3_ = new Object();
      _loc3_.id = _loc9_.split("~")[0];
      _loc3_.name = _loc9_.split("~")[1];
      _loc3_.level = _loc9_.split("~")[2];
      _loc3_.tipo = _loc9_.split("~")[3];
      _loc6_[0] += 1;
      _loc6_[_loc3_.tipo]++;
      _loc3_.ldr = _loc9_.split("~")[4];
      for(var _loc13_ in _loc10_)
      {
         _loc7_ = _loc10_[_loc13_];
         _loc8_ = _loc3_.id;
         if(_loc8_ == _loc7_ || _loc8_ == Number(_loc7_))
         {
            _loc5_[0] += 1;
            _loc5_[_loc3_.tipo]++;
            _loc3_.sombra = true;
            break;
         }
      }
      this._aLogros.push(_loc3_);
   }
   _loc4_ = -1;
   var _loc11_;
   while(true)
   {
      _loc4_ = _loc4_ + 1;
      if(_loc4_ >= 10)
      {
         break;
      }
      if(_loc4_ > 6)
      {
         _loc6_[4] += Number(_loc6_[_loc4_]);
         _loc5_[4] += Number(_loc5_[_loc4_]);
      }
      else
      {
         this["_pb" + _loc4_].maximum = Number(_loc6_[_loc4_]);
         this["_pb" + _loc4_].value = Number(_loc5_[_loc4_]);
         _loc11_ = Number(_loc6_[_loc4_]) == 0 ? 0 : _global.parseInt(Number(_loc5_[_loc4_]) * 100 / Number(_loc6_[_loc4_]));
         this["_txt" + _loc4_].text = _loc11_ + "%";
      }
   }
   this._txtPuntos.text = _loc15_;
};
_loc1.updateData = function()
{
   var _loc4_ = this._lstLogros.selectedItem.id;
   var _loc3_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc2_;
   for(var _loc5_ in this._aLogros)
   {
      _loc2_ = this._aLogros[_loc5_];
      if(_loc2_.tipo == _loc4_)
      {
         _loc3_.push(_loc2_);
      }
   }
   this._dgLogros.dataProvider = _loc3_;
};
_loc1.itemSelected = function(oEvent)
{
   var _loc2_ = oEvent.target._name;
   var _loc0_;
   switch(_loc2_)
   {
      case "_lstLogros":
         _loc0_ = _loc0_ = this._lstLogros.selectedItem.id;
         if(_loc0_ !== 0)
         {
            this._dgLogros._visible = true;
            this.updateData();
         }
         else
         {
            this._dgLogros._visible = false;
         }
         break;
      case "_dgLogros":
         this.gapi.loadUIComponent("LogroDetalle","LogroDetalle",{id:oEvent.row.item.id});
   }
};
_loc1.click = function(oEvent)
{
   if(oEvent.target !== this._btnClose)
   {
   }
   this.api.ui.unloadUIComponent("Logros");
   return undefined;
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
_loc1._aLogros = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.ui.Logros.CLASS_NAME = "Logros";
