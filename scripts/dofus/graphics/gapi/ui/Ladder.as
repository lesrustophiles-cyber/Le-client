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
_global.dofus.graphics.gapi.ui.Ladder = function()
{
   super();
};
dofus.graphics.gapi.ui.Ladder.prototype = new ank.gapi.core.UIAdvancedComponent();
var _loc1 = _global.dofus.graphics.gapi.ui.Ladder.prototype;
_loc1.__set__data = function(sData)
{
   this._sData = sData;
};
_loc1.init = function()
{
   super.init(false,dofus.graphics.gapi.ui.Ladder.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._dgMembers.addEventListener("itemSelected",this);
   this._btnPVP.addEventListener("click",this);
   this._btnNivel.addEventListener("click",this);
   this._btnGremio.addEventListener("click",this);
   this._btnKoliseo.addEventListener("click",this);
   this._btnCerrar.addEventListener("click",this);
   this._btnSearch.addEventListener("click",this);
   this._btnNext.addEventListener("click",this);
   this._btnBack.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("LADDER");
   this._dgMembers.columnsNames = [this.api.lang.getText("NRO"),"",this.api.lang.getText("NAME_BIG"),this.api.lang.getText("TITLE"),this.api.lang.getText("LEVEL_SMALL"),this.api.lang.getText("EXPERIMENT"),""];
   this._btnPVP.label = this.api.lang.getText("PVP");
   this._btnNivel.label = "Nivel";
   this._btnGremio.label = this.api.lang.getText("GUILD");
   this._btnKoliseo.label = this.api.lang.getText("KOLISEO");
   this._btnNext.label = this.api.lang.getText("NEXT");
   this._btnBack.label = this.api.lang.getText("BACK");
   this._lblSearch.text = this.api.lang.getText("SEARCH");
   this._btnSearch.label = "OK";
};
_loc1.initData = function()
{
   this._oTipos = new Object();
   var _loc5_ = this._sData.split("|");
   this._btnNivel._visible = false;
   this._btnPVP._visible = true;
   this._btnGremio._visible = true;
   this._btnKoliseo._visible = true;
   this._btnNext._visible = true;
   this._btnBack._visible = true;
   if(_loc5_.length == 0)
   {
      return undefined;
   }
   var _loc6_ = 530 / _loc5_.length;
   var _loc2_ = 0;
   var _loc4_;
   var _loc3_;
   while(_loc2_ < _loc5_.length)
   {
      _loc4_ = _loc5_[_loc2_];
      _loc3_ = this["_btn" + _loc4_];
      _loc3_.width = _loc6_;
      _loc3_._y = 116.4;
      _loc3_._x = 195.95 + _loc2_ * _loc6_;
      _loc3_._visible = true;
      _loc2_ = _loc2_ + 1;
   }
};
_loc1.registrar = function(sData)
{
   var _loc12_ = sData.split("|");
   var _loc6_ = _loc12_[0];
   var _loc13_ = _loc12_[1];
   var _loc9_ = new ank.utils.ExtendedArray();
   var _loc10_ = true;
   var _loc8_ = 0;
   var _loc11_ = 0;
   var _loc4_;
   var _loc5_;
   var _loc2_;
   var _loc3_;
   if(_loc13_.length > 1)
   {
      _loc10_ = false;
      _loc4_ = 0;
      _loc5_ = _loc13_.split("#");
      while(_loc4_ < _loc5_.length)
      {
         _loc2_ = new Object();
         _loc3_ = _loc5_[_loc4_].split(";");
         _loc2_.nro = Number(_loc3_[0]);
         if(_loc6_ == "GREMIO")
         {
            _loc2_.emblema = _loc3_[1];
         }
         else
         {
            _loc2_.gfx = _loc3_[1];
         }
         _loc2_.nombre = _loc3_[2];
         _loc2_.titulo = _loc3_[3];
         _loc2_.nivel = _loc3_[4];
         _loc2_.experiencia = _loc3_[5];
         _loc2_.estado = _loc3_[6];
         _loc2_.alineacion = _loc3_[7];
         _loc2_.omega = _loc3_[8];
         _loc2_.buscado = _loc3_[9] == "1";
         _loc9_.push(_loc2_);
         _loc4_ = _loc4_ + 1;
         if(_loc4_ == 1)
         {
            _loc8_ = _loc2_.nro;
         }
         if(_loc4_ == _loc5_.length)
         {
            _loc11_ = _loc2_.nro;
         }
      }
   }
   if(this._oTipos[_loc6_] == undefined)
   {
      this._oTipos[_loc6_] = new Object();
   }
   var _loc7_ = this._oTipos[_loc6_];
   _loc7_.back = _loc12_[2] == "1";
   _loc7_.next = _loc12_[3] == "1";
   if(!_loc10_ || _loc10_ && !_loc7_.back)
   {
      _loc7_.inicio = _loc8_;
   }
   if(!_loc10_ || _loc10_ && !_loc7_.next)
   {
      _loc7_.fin = _loc11_;
   }
   if(!_loc10_ || _loc10_ && (!_loc7_.back && !_loc7_.next))
   {
      _loc7_.data = _loc9_;
   }
   _loc7_.tipo = _loc6_;
   this.updateData(_loc6_);
};
_loc1.updateData = function(sTipo)
{
   this._oData = this._oTipos[sTipo];
   var _loc2_ = this._oData.data;
   if(_loc2_ == undefined)
   {
      this.api.network.send("Zz" + sTipo);
   }
   else
   {
      this._tiSearch.text = this._oData.search != undefined ? this._oData.search : "";
      this._dgMembers.dataProvider = _loc2_;
      this._btnNext._visible = this._oData.next;
      this._btnBack._visible = this._oData.back;
   }
};
_loc1.itemSelected = function(oEvent)
{
   var _loc2_ = oEvent.row.item;
   if(_loc2_.emblema != undefined)
   {
      return undefined;
   }
   if(_loc2_.nombre != this.api.datacenter.Player.Name)
   {
      if(_loc2_.estado == 0)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("USER_NOT_CONNECTED",[_loc2_.nombre]),"ERROR_CHAT");
      }
      else
      {
         this.api.kernel.GameManager.showPlayerPopupMenu(_loc2_.nombre,_loc2_.nombre,undefined,undefined,true,undefined,this.api.datacenter.Player.isAuthorized);
      }
   }
};
_loc1.click = function(oEvent)
{
   var _loc2_ = oEvent.target;
   switch(_loc2_)
   {
      case this._btnCerrar:
         this.api.ui.unloadUIComponent("Ladder");
         return undefined;
      case this._btnSearch:
         if(this._oData == undefined)
         {
            return undefined;
         }
         this._oData.search = this._tiSearch.text;
         this.api.network.send("Zz" + this._oData.tipo + "|" + this._oData.search);
         return undefined;
         break;
      case this._btnNext:
         if(this._oData == undefined)
         {
            return undefined;
         }
         this._oData.search = this._tiSearch.text;
         this.api.network.send("Zz" + this._oData.tipo + "|" + this._oData.search + "|" + (this._oData.fin + 1));
         return undefined;
         break;
      case this._btnBack:
         if(this._oData == undefined)
         {
            return undefined;
         }
         this._oData.search = this._tiSearch.text;
         this.api.network.send("Zz" + this._oData.tipo + "|" + this._oData.search + "|" + (- this._oData.inicio));
         return undefined;
         break;
      default:
         this._btnNivel.selected = true;
         this._btnPVP.selected = true;
         this._btnGremio.selected = true;
         this._btnStaff.selected = true;
         this._btnKoliseo.selected = true;
         this._btnDiaXP.selected = true;
         this._btnDuplum.selected = true;
         switch(_loc2_)
         {
            case this._btnNivel:
               this.updateData("NIVEL");
               this._dgMembers.columnsNames = [this.api.lang.getText("NRO"),"",this.api.lang.getText("NAME_BIG"),this.api.lang.getText("TITLE"),this.api.lang.getText("LEVEL_SMALL"),this.api.lang.getText("EXPERIMENT"),"",""];
               break;
            case this._btnPVP:
               this.updateData("PVP");
               this._dgMembers.columnsNames = [this.api.lang.getText("NRO"),"",this.api.lang.getText("NAME_BIG"),this.api.lang.getText("TITLE"),this.api.lang.getText("LEVEL_SMALL"),"Vic.    Der.","",""];
               break;
            case this._btnGremio:
               this.updateData("GREMIO");
               this._dgMembers.columnsNames = [this.api.lang.getText("NRO"),"",this.api.lang.getText("NAME_BIG"),this.api.lang.getText("CANT_MIEMBROS"),this.api.lang.getText("LEVEL_SMALL"),this.api.lang.getText("EXPERIMENT"),"",""];
               break;
            case this._btnKoliseo:
               this.updateData("KOLISEO");
               this._dgMembers.columnsNames = [this.api.lang.getText("NRO"),"",this.api.lang.getText("NAME_BIG"),this.api.lang.getText("TITLE"),this.api.lang.getText("LEVEL_SMALL"),"Vic.    Der.","",""];
         }
         _loc2_.selected = false;
   }
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
_loc1._oTipos = new Object();
ASSetPropFlags(_loc1,null,1);
_global.dofus.graphics.gapi.ui.Ladder.CLASS_NAME = "Ladder";
