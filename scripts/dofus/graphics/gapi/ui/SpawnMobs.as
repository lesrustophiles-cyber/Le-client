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
_global.dofus["\r\x13"].gapi.ui.SpawnMobs = function()
{
   super();
};
dofus["\r\x13"].gapi.ui.SpawnMobs.prototype = new ank.gapi.core["\x1e\n\x0e"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.SpawnMobs.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.SpawnMobs.CLASS_NAME);
};
_loc1.callClose = function()
{
   this.unloadThis();
   return true;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initAnimList});
   this.addToQueue({object:this,method:this.loadMonsters});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initTexts = function()
{
   this._winBg.title = "SPAWN MOBS";
   this._lblType.text = this.api.lang.getText("TYPE");
   this._btnCancel.label = this.api.lang.getText("CANCEL");
   this._btnOk.label = this.api.lang.getText("OK");
   this._btnSearch.label = this.api.lang.getText("OK");
   this._tiSearch.text = !this._tiSearch.text.length ? "" : this._tiSearch.text;
   this._txtSegundos.text = "0";
   this._txtSegundos.restrict = "0-9";
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
   this._btnSearch.addEventListener("click",this);
   this._cbType.addEventListener("itemSelected",this);
   this._cbCantidad.addEventListener("itemSelected",this);
   this._cbGrado.addEventListener("itemSelected",this);
   this._cg.addEventListener("selectItem",this);
   this._cg.addEventListener("overItem",this);
   this._cg.addEventListener("outItem",this);
   this._cg.addEventListener("dblClickItem",this);
   var ref = this;
   var _loc2_ = 1;
   while(_loc2_ <= 8)
   {
      this["_cciSprite" + _loc2_].addEventListener("select",this);
      this["_cciSprite" + _loc2_].enabled = true;
      this["_cciSprite" + _loc2_]._yscale = this["_cciSprite" + _loc2_]._xscale = 48;
      this["_txtMin" + _loc2_].restrict = "0-9";
      this["_txtMax" + _loc2_].restrict = "0-9";
      _loc2_ = _loc2_ + 1;
   }
   this._btnSQL.addEventListener("click",this);
   this._btnTipoA.addEventListener("click",this);
   this._btnTipoB.addEventListener("click",this);
   this._btnTipoC.addEventListener("click",this);
   this._btnTipoD.addEventListener("click",this);
   var ref = this;
   var _loc3_ = new Object();
   _loc3_.onSetFocus = function(oldFocus_txt, newFocus_txt)
   {
      var _loc1_ = Selection.getFocus();
      if(_loc1_._parent == ref._tiSearch)
      {
         if(ref._tiSearch.text == "")
         {
            ref._tiSearch.text = "";
         }
      }
      else if(ref._tiSearch.text == "")
      {
         ref._tiSearch.text = "";
      }
   };
   Selection.addListener(_loc3_);
};
_loc1.initAnimList = function(eaTypes)
{
};
_loc1.initData = function()
{
   var _loc5_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc2_ = 1;
   while(_loc2_ <= 8)
   {
      _loc5_.push({label:_loc2_,data:_loc2_});
      _loc2_ = _loc2_ + 1;
   }
   this._cbCantidad.dataProvider = _loc5_;
   this._cbCantidad.selectedIndex = 0;
   var _loc6_ = Number(this._cbCantidad.selectedItem.data);
   _loc2_ = 1;
   while(_loc2_ <= 8)
   {
      this.mostrarSprites(_loc2_,_loc6_ >= _loc2_);
      _loc2_ = _loc2_ + 1;
   }
   this._cSprite = this._cciSprite1;
   this._cciSprite1.selected = true;
};
_loc1.mostrarSprites = function(nID, bBoolean)
{
   this["_cciSprite" + nID]._visible = bBoolean;
   this["_mc" + nID]._visible = bBoolean;
   this["_txtMin" + nID]._visible = bBoolean;
   this["_txtMax" + nID]._visible = bBoolean;
};
_loc1.loadData = function(eaTypes)
{
   this._cciSprite.deleteButton = false;
   this._eaTypes = eaTypes;
   eaTypes.sortOn("label");
   this._cbType.dataProvider = eaTypes;
};
_loc1.loadMonsters = function(sFilter)
{
   if(sFilter == undefined)
   {
      sFilter = "";
   }
   var _loc13_ = this.api.lang.getMonsters();
   var _loc21_ = dofus["\x12\x03"].ARTWORKS_BIG_PATH;
   var _loc19_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc20_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc12_ = new Object();
   var _loc6_;
   var _loc7_;
   var _loc5_;
   var _loc11_;
   var _loc10_;
   var _loc9_;
   var _loc3_;
   var _loc2_;
   var _loc4_;
   var _loc8_;
   for(var _loc22_ in _loc13_)
   {
      _loc6_ = _loc13_[_loc22_];
      _loc7_ = _loc6_.b;
      _loc5_ = _loc12_[_loc7_];
      if(_loc5_ == undefined)
      {
         _loc5_ = {label:this.api.lang.getMonstersRaceText(_loc7_).n,data:new ank["\x1e\n\t"]["\x0e\x1d"]()};
         _loc12_[_loc7_] = _loc5_;
         _loc19_.push(_loc5_);
      }
      _loc11_ = _loc22_;
      _loc10_ = _loc6_.n;
      _loc9_ = _loc6_.g;
      _loc3_ = "";
      _loc2_ = 1;
      while(_loc2_ <= 8)
      {
         _loc4_ = _loc6_["g" + _loc2_];
         if(_loc4_ != undefined)
         {
            if(_loc3_.length > 0)
            {
               _loc3_ += "-";
            }
            _loc3_ += _loc4_.l;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc8_ = {iconFile:_loc21_ + _loc9_ + ".swf",name:_loc10_,id:_loc11_,gfxId:_loc9_,lvls:_loc3_};
      _loc20_.push(_loc8_);
      _loc5_.data.push(_loc8_);
   }
   _loc19_.push({label:"-- ALL --",data:_loc20_});
   this.loadData(_loc19_);
};
_loc1.select = function(oEvent)
{
   var _loc2_ = 1;
   while(_loc2_ <= 8)
   {
      this["_cciSprite" + _loc2_].selected = false;
      _loc2_ = _loc2_ + 1;
   }
   oEvent.target.selected = true;
   this._cSprite = oEvent.target;
};
_loc1.over = function(oEvent)
{
   this.gapi.showTooltip(oEvent.target.params.data.text,oEvent.target,-50);
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.filterResult = function(sFilter)
{
   var _loc4_ = this._cbType.selectedItem.data;
   var _loc6_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc2_ = -1;
   var _loc5_;
   while(true)
   {
      _loc2_ = _loc2_ + 1;
      if(_loc2_ >= _loc4_.length)
      {
         break;
      }
      _loc5_ = _loc4_[_loc2_].name;
      if(!(sFilter.length && (sFilter != "" && (sFilter.length && _loc5_.toUpperCase().indexOf(sFilter.toUpperCase()) == -1))))
      {
         _loc6_.push(_loc4_[_loc2_]);
      }
   }
   this._cg.dataProvider = _loc6_;
};
_loc1.click = function(oEvent)
{
   var _loc7_;
   var _loc3_;
   var _loc5_;
   var _loc2_;
   var _loc4_;
   var _loc6_;
   switch(oEvent.target._name)
   {
      case "_btnClose":
      case "_btnCancel":
         this.api.ui.unloadUIComponent("SpawnMobs");
         break;
      case "_btnSearch":
         this._cbType.selectedIndex = 0;
         this.filterResult(this._tiSearch.text);
         break;
      case "_btnTipoA":
      case "_btnTipoB":
      case "_btnTipoC":
      case "_btnTipoD":
         this._btnTipoA.selected = false;
         this._btnTipoB.selected = false;
         this._btnTipoC.selected = false;
         this._btnTipoD.selected = false;
         oEvent.target.selected = true;
         break;
      case "_btnOk":
         _loc7_ = !this._btnSQL.selected ? "SPAWN" : "ADD_GRUPO_MOB_SQL";
         _loc3_ = "";
         _loc5_ = Number(this._cbCantidad.selectedItem.data);
         _loc2_ = 1;
         while(_loc2_ <= 8)
         {
            if(_loc5_ >= _loc2_)
            {
               _loc4_ = this["_cciSprite" + _loc2_];
               if(_loc4_.data != undefined)
               {
                  if(_loc3_.length > 0)
                  {
                     _loc3_ += ";";
                  }
                  _loc3_ += _loc4_.data.id;
                  if(this["_txtMin" + _loc2_.toString()].text != "" && this["_txtMax" + _loc2_.toString()].text != "")
                  {
                     _loc3_ += "," + this["_txtMin" + _loc2_.toString()].text + "," + this["_txtMax" + _loc2_.toString()].text;
                  }
               }
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc3_ == undefined)
         {
            this.api.kernel.showMessage("ERROR","MOBS UNDEFINED","ERROR_BOX");
            break;
         }
         if(_loc3_ == "")
         {
            this.api.kernel.showMessage("ERROR","MOBS VACIOS","ERROR_BOX");
            break;
         }
         _loc6_ = 1;
         if(this._btnTipoA.selected)
         {
            _loc6_ = -1;
         }
         if(this._btnTipoB.selected)
         {
            _loc6_ = 0;
         }
         if(this._btnTipoC.selected)
         {
            _loc6_ = 1;
         }
         if(this._btnTipoD.selected)
         {
            _loc6_ = 2;
         }
         _loc7_ = _loc7_ + " " + _loc3_ + " " + _loc6_ + " " + this._txtCondiciones.text + " " + this._txtCondiciones.text + " " + this._txtSegundos.text;
         this.api.kernel.DebugConsole.process(_loc7_);
         this.api.kernel.showMessage("GOOD!!","MOBS ADD IN MAP :D","ERROR_BOX");
         break;
   }
};
_loc1.change = function(oEvent)
{
   if(oEvent.target.text == undefined || oEvent.target.text == "" || oEvent.target.text < 0)
   {
      oEvent.target.text = 0;
   }
};
_loc1.dblClickItem = function(oEvent)
{
};
_loc1.selectItem = function(oEvent)
{
   var _loc2_ = oEvent.target.contentData;
   var _loc3_ = this._cSprite;
   if(_loc2_ != undefined)
   {
      _loc3_.data = {id:_loc2_.id,name:_loc2_.name,gfxFile:dofus["\x12\x03"].CLIPS_PERSOS_PATH + _loc2_.gfxId + ".swf",title:_loc2_.id,text:_loc2_.name + ", ID: " + _loc2_.id + ", LVLS:" + _loc2_.lvls};
   }
   else
   {
      _loc3_.data = undefined;
   }
};
_loc1.overItem = function(oEvent)
{
   if(oEvent.target.contentData != undefined)
   {
      this.gapi.showTooltip(oEvent.target.contentData.name + " (" + oEvent.target.contentData.id + ", GFX: " + oEvent.target.contentData.gfxId + ")" + " LVLS: " + oEvent.target.contentData.lvls,oEvent.target,-20);
   }
};
_loc1.outItem = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.itemSelected = function(oEvent)
{
   var _loc3_;
   var _loc2_;
   var _loc4_;
   switch(oEvent.target)
   {
      case this._cbCantidad:
         _loc3_ = Number(this._cbCantidad.selectedItem.data);
         _loc2_ = 1;
         while(_loc2_ <= 8)
         {
            this.mostrarSprites(_loc2_,_loc3_ >= _loc2_);
            _loc2_ = _loc2_ + 1;
         }
         break;
      case this._cbType:
         _loc4_ = this._cbType.selectedItem.data;
         this._cg.dataProvider = _loc4_;
         this._lblNumber.text = _loc4_.length + " " + ank["\x1e\n\t"]["\x1e\x16\x1a"].combine(this.api.lang.getText("MONSTER"),"m",_loc4_.length < 2);
   }
};
_loc1.onShortcut = function(sShortcut)
{
   if(sShortcut == "ACCEPT_CURRENT_DIALOG" && this._tiSearch.focused)
   {
      this.click({target:this._btnSearch});
      return false;
   }
   return true;
};
_loc1._cSprite;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.ui.SpawnMobs.CLASS_NAME = "SpawnMobs";
