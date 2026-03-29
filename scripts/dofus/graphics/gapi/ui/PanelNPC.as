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
_global.dofus["\r\x13"].gapi.ui.PanelNPC = function()
{
   super();
};
dofus["\r\x13"].gapi.ui.PanelNPC.prototype = new ank.gapi.core["\x1e\n\x0e"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.PanelNPC.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.PanelNPC.CLASS_NAME);
};
_loc1.callClose = function()
{
   this.unloadThis();
   return true;
};
_loc1.createChildren = function()
{
   this.hideItemViewer(true);
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.loadLooks});
   this.addToQueue({object:this,method:this.initData2});
};
_loc1.initTexts = function()
{
   this._winBg.title = "PANEL EDIT NPC";
   this._lblType.text = this.api.lang.getText("TYPE");
   this._btnDelete.label = "Delete";
   this._btnModify.label = "Modify";
   this._btnSearch.label = "OK";
   this._tiSearch.text = !this._tiSearch.text.length ? "" : this._tiSearch.text;
   this._tiSearchItems.text = "";
   this._txtSexo.restrict = "0-1";
   this._txtSexo.maxChars = 1;
   this._txtEscalaX.restrict = "0-9";
   this._txtEscalaY.restrict = "0-9";
   this._txtArma.restrict = "0-9";
   this._txtSombrero.restrict = "0-9";
   this._txtCapa.restrict = "0-9";
   this._txtMascota.restrict = "0-9";
   this._txtEscudo.restrict = "0-9";
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnDelete.addEventListener("click",this);
   this._btnModify.addEventListener("click",this);
   this._cbType.addEventListener("itemSelected",this);
   this._cbTypeItems.addEventListener("itemSelected",this);
   this._cbNPC.addEventListener("itemSelected",this);
   this._cg.addEventListener("selectItem",this);
   this._cg.addEventListener("overItem",this);
   this._cg.addEventListener("outItem",this);
   this._cg.addEventListener("dblClickItem",this);
   this._csColores.addEventListener("over",this);
   this._csColores.addEventListener("out",this);
   this._csColores.addEventListener("change",this);
   this._btnSearch.addEventListener("click",this);
   var ref = this;
   var _loc2_ = new Object();
   _loc2_.onSetFocus = function(oldFocus_txt, newFocus_txt)
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
   Selection.addListener(_loc2_);
   var ref = this;
   this._txtArma.onChanged = function()
   {
      ref.change({target:this});
   };
   this._txtCapa.onChanged = function()
   {
      ref.change({target:this});
   };
   this._txtSombrero.onChanged = function()
   {
      ref.change({target:this});
   };
   this._txtMascota.onChanged = function()
   {
      ref.change({target:this});
   };
   this._txtEscudo.onChanged = function()
   {
      ref.change({target:this});
   };
   this._tiSearchItems.addEventListener("change",this);
   this._lst.addEventListener("itemSelected",this);
   this._lst.addEventListener("itemRollOver",this);
   this._lst.addEventListener("itemRollOut",this);
};
_loc1.loadLooks = function()
{
   var ui = this;
   var _loc14_ = new XML();
   _loc14_.ignoreWhite = true;
   _loc14_.onLoad = function()
   {
      var _loc14_ = dofus["\x12\x03"].ARTWORKS_BIG_PATH;
      var _loc15_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
      var _loc13_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
      var _loc5_ = this.firstChild.firstChild;
      var _loc12_;
      var _loc7_;
      var _loc2_;
      var _loc3_;
      var _loc6_;
      var _loc4_;
      while(_loc5_ != undefined)
      {
         _loc12_ = _loc5_.attributes.name;
         _loc7_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
         _loc2_ = _loc5_.firstChild;
         while(_loc2_ != undefined)
         {
            _loc3_ = _loc2_.attributes.id;
            _loc6_ = _loc2_.attributes.name;
            _loc4_ = {iconFile:_loc14_ + _loc3_ + ".swf",name:_loc6_,id:_loc3_,gfxId:_loc3_};
            _loc7_.push(_loc4_);
            _loc13_.push(_loc4_);
            _loc2_ = _loc2_.nextSibling;
         }
         _loc15_.push({label:_loc12_,data:_loc7_});
         _loc5_ = _loc5_.nextSibling;
      }
      _loc15_.push({label:"-- ALL --",data:_loc13_});
      ui.initData(_loc15_);
   };
   _loc14_.load(dofus["\x12\x03"].XML_SPRITE_LIST);
};
_loc1.initData2 = function()
{
   this._csColores.colors = [-1,-1,-1];
   this._eaItems = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc6_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc3_ = this.api.lang.getAllItemTypes();
   for(var _loc7_ in _loc3_)
   {
      switch(Number(_loc7_))
      {
         case 2:
         case 3:
         case 4:
         case 5:
         case 6:
         case 7:
         case 8:
         case 16:
         case 17:
         case 18:
         case 19:
         case 20:
         case 21:
         case 22:
         case 81:
         case 82:
            _loc6_.push({label:_loc3_[_loc7_].n,id:_loc7_});
            break;
      }
   }
   _loc6_.sortOn("label");
   _loc6_.push({label:"All",id:-1});
   this._cbTypeItems.dataProvider = _loc6_;
   var _loc5_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc2_ = this.api.lang.getNonPlayableCharacters();
   for(_loc7_ in _loc2_)
   {
      _loc5_.push({label:"[" + _loc7_ + "] " + _loc2_[_loc7_].n,id:_loc7_,str:_loc2_[_loc7_].n});
   }
   _loc5_.sortOn("str");
   _loc5_.push({label:"All",id:-1});
   this._cbNPC.dataProvider = _loc5_;
};
_loc1.initData = function(eaTypes)
{
   this._cciSprite.deleteButton = false;
   this._eaTypes = eaTypes;
   eaTypes.sortOn("label");
   this._cbType.dataProvider = eaTypes;
};
_loc1.refrescar = function(sData)
{
   var _loc2_ = sData.split(",");
   var _loc17_ = _loc2_[0];
   var _loc19_ = _loc2_[1];
   var _loc18_ = _loc2_[2];
   var _loc12_ = _loc2_[3];
   var _loc6_ = _loc2_[4];
   var _loc5_ = _loc2_[5];
   var _loc4_ = _loc2_[6];
   var _loc7_ = _loc2_[7];
   var _loc11_ = _loc2_[8];
   var _loc10_ = _loc2_[9];
   var _loc8_ = _loc2_[10];
   var _loc9_ = _loc2_[11];
   this._txtSexo.text = _loc17_;
   this._txtEscalaX.text = _loc19_;
   this._txtEscalaY.text = _loc18_;
   this._txtArma.text = _loc7_;
   this._txtSombrero.text = _loc11_;
   this._txtCapa.text = _loc10_;
   this._txtMascota.text = _loc8_;
   this._txtEscudo.text = _loc9_;
   var _loc15_ = Number(_loc7_).toString(16);
   var _loc14_ = Number(_loc11_).toString(16);
   var _loc21_ = Number(_loc10_).toString(16);
   var _loc16_ = Number(_loc8_).toString(16);
   var _loc20_ = Number(_loc9_).toString(16);
   var _loc13_ = _loc15_ + "," + _loc14_ + "," + _loc21_ + "," + _loc16_ + "," + _loc20_;
   this.api.datacenter.Sprites.removeItemAt(0);
   var _loc3_ = new Object();
   _loc3_.gfxID = _loc12_;
   _loc3_.color1 = _loc6_ >= 0 ? Number(_loc6_).toString(16) : _loc6_;
   _loc3_.color2 = _loc5_ >= 0 ? Number(_loc5_).toString(16) : _loc5_;
   _loc3_.color3 = _loc4_ >= 0 ? Number(_loc4_).toString(16) : _loc4_;
   _loc3_.accessories = _loc13_;
   this._csColores.colors = [_loc6_,_loc5_,_loc4_];
   this._character = this.api.kernel.CharactersManager.createCharacter(0,this.api.lang.getNonPlayableCharactersText(this._nID).n,_loc3_);
   this._cciSprite.data = this._character;
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
   switch(oEvent.target._name)
   {
      case "_btnClose":
      case "_btnCancel":
         this.api.ui.unloadUIComponent("PanelNPC");
         break;
      case "_btnSearch":
         this._cbType.selectedIndex = 0;
         this.filterResult(this._tiSearch.text);
         break;
      case "_btnModify":
         if(this._nID == undefined)
         {
            return undefined;
         }
         this.api.kernel.DebugConsole.process("MODIFICAR_NPC " + this._nID + " " + this._txtSexo.text + " " + this.txtEscalaX.text + " " + this._txtEscalaY.text + " " + this._character.gfxID + " " + this._character.color1 + " " + this._character.color2 + " " + this._character.color3 + " " + this._txtArma.text + " " + this._txtSombrero.text + " " + this._txtCapa.text + " " + this._txtMascota.text + " " + this._txtEscudo.text);
         break;
   }
};
_loc1.selectItem = function(oEvent)
{
   var _loc6_ = oEvent.target.contentData;
   var _loc2_;
   var _loc5_;
   var _loc4_;
   var _loc3_;
   if(_loc6_ != undefined)
   {
      if(this._character == undefined)
      {
         return undefined;
      }
      this.api.datacenter.Sprites.removeItemAt(0);
      _loc2_ = new Object();
      _loc2_.gfxID = _loc6_.gfxId;
      _loc5_ = Number(this._character.color1);
      _loc4_ = Number(this._character.color2);
      _loc3_ = Number(this._character.color3);
      _loc2_.color1 = _loc5_ >= 0 ? _loc5_.toString(16) : -1;
      _loc2_.color2 = _loc4_ >= 0 ? _loc4_.toString(16) : -1;
      _loc2_.color3 = _loc3_ >= 0 ? _loc3_.toString(16) : -1;
      _loc2_.accessories = this._character.accessories;
      this._character = this.api.kernel.CharactersManager.createCharacter(0,this.api.lang.getNonPlayableCharactersText(this._nID).n,_loc2_);
      this._cciSprite.data = this._character;
   }
};
_loc1.overItem = function(oEvent)
{
   if(oEvent.target.contentData != undefined)
   {
      this.gapi.showTooltip(oEvent.target.contentData.name + " (" + oEvent.target.contentData.id + ", GFX: " + oEvent.target.contentData.gfxId + ")",oEvent.target,-20);
   }
};
_loc1.outItem = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.itemSelected = function(oEvent)
{
   var _loc2_;
   var _loc6_;
   var _loc4_;
   var _loc3_;
   switch(oEvent.target)
   {
      case this._cbType:
         _loc2_ = this._cbType.selectedItem.data;
         this._cg.dataProvider = _loc2_;
         break;
      case this._cbTypeItems:
         this._aTypes = new Array();
         if(this._cbTypeItems.selectedItem.id != -1)
         {
            this._aTypes.push(this._cbTypeItems.selectedItem.id);
         }
         else
         {
            _loc2_ = 0;
            while(true)
            {
               _loc2_ = _loc2_ + 1;
               if(_loc2_ >= this._cbTypeItems.dataProvider.length)
               {
                  break;
               }
               if(this._cbTypeItems.dataProvider[_loc2_].id != -1)
               {
                  this._aTypes.push(this._cbTypeItems.dataProvider[_loc2_].id);
               }
            }
         }
         this.generateIndexes();
         this.change(oEvent);
         break;
      case this._lst:
         _loc6_ = this._lst.selectedItem;
         if(_loc6_ == undefined)
         {
            this.hideItemViewer(true);
         }
         else
         {
            if(Key.isDown(dofus["\x12\x03"].CHAT_INSERT_ITEM_KEY))
            {
               this.api.kernel.GameManager.insertItemInChat(_loc6_);
               return undefined;
            }
            this.hideItemViewer(this._winItemViewer._visible);
            this._itvItemViewer.itemData = _loc6_;
         }
         break;
      case this._cbNPC:
         this._nID = this._cbNPC.selectedItem.id;
         this.api.network.send("BAINFO_NPC " + this._nID);
         _loc4_ = "";
         _loc3_ = this.api.lang.getNonPlayableCharactersText(this._nID).a;
         for(var _loc5_ in _loc3_)
         {
            _loc4_ += this.api.lang.getNonPlayableCharactersActionText(_loc3_[_loc5_]) + "\n";
         }
         this._txtMenu.text = _loc4_;
   }
};
_loc1.change = function(oEvent)
{
   var _loc6_;
   var _loc5_;
   var _loc4_;
   var _loc8_;
   var _loc15_;
   var _loc13_;
   var _loc11_;
   var _loc12_;
   var _loc9_;
   var _loc7_;
   var _loc16_;
   var _loc10_;
   var _loc14_;
   switch(oEvent.target)
   {
      case this._csColores:
         if(this._character == undefined)
         {
            return undefined;
         }
         _loc6_ = Number(oEvent.value.color1);
         _loc5_ = Number(oEvent.value.color2);
         _loc4_ = Number(oEvent.value.color3);
         this._character.color1 = _loc6_ >= 0 ? _loc6_ : -1;
         this._character.color2 = _loc5_ >= 0 ? _loc5_ : -1;
         this._character.color3 = _loc4_ >= 0 ? _loc4_ : -1;
         this._cciSprite.data = this._character;
         break;
      case this._cbTypeItems:
      case this._tiSearchItems:
         if(this._tiSearchItems.text.length > 3)
         {
            this.searchItem(this._tiSearchItems.text.toUpperCase());
         }
         else if(this._lst.dataProvider != this._eaItemsOriginal)
         {
            this._lst.dataProvider = this._eaItemsOriginal;
         }
         break;
      default:
         if(this._character == undefined)
         {
            return undefined;
         }
         _loc8_ = !_global.isNaN(this._txtArma.text) ? this._txtArma.text : 0;
         _loc15_ = !_global.isNaN(this._txtSombrero.text) ? this._txtSombrero.text : 0;
         _loc13_ = !_global.isNaN(this._txtCapa.text) ? this._txtCapa.text : 0;
         _loc11_ = !_global.isNaN(this._txtMascota.text) ? this._txtMascota.text : 0;
         _loc12_ = !_global.isNaN(this._txtEscudo.text) ? this._txtEscudo.text : 0;
         _loc9_ = Number(_loc8_).toString(16);
         _loc7_ = Number(_loc15_).toString(16);
         _loc16_ = Number(_loc13_).toString(16);
         _loc10_ = Number(_loc11_).toString(16);
         _loc14_ = Number(_loc12_).toString(16);
         this.setSpriteAccessories(this._character,_loc9_ + "," + _loc7_ + "," + _loc16_ + "," + _loc10_ + "," + _loc14_);
         this._cciSprite.data = this._character;
         break;
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
_loc1.hideItemViewer = function(bHide)
{
   this._winItemViewer._visible = !bHide;
   this._itvItemViewer._visible = !bHide;
};
_loc1.generateIndexes = function()
{
   var _loc6_ = new Object();
   for(var _loc8_ in this._aTypes)
   {
      _loc6_[this._aTypes[_loc8_]] = true;
   }
   var _loc5_ = this.api.lang.getItemUnics();
   this._eaItems = new ank["\x1e\n\t"]["\x0e\x1d"]();
   this._eaItemsOriginal = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc3_;
   var _loc7_;
   var _loc4_;
   for(_loc8_ in _loc5_)
   {
      if(Number(_loc8_) <= _global.ID_OBJETO_MODELO_MAX)
      {
         _loc3_ = _loc5_[_loc8_];
         if(_loc6_[_loc3_.t])
         {
            if(_loc3_.n == "")
            {
               continue;
            }
            _loc7_ = _loc3_.n;
            _loc4_ = new dofus.datacenter["\f\x0b"](0,Number(_loc8_),1,0,"",0);
            this._eaItems.push(_loc4_);
            this._eaItemsOriginal.push(_loc4_);
         }
      }
   }
};
_loc1.searchItem = function(sText)
{
   var _loc9_ = sText.split(" ");
   var _loc8_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc6_ = new Object();
   var _loc7_ = new Object();
   var _loc5_ = 0;
   var _loc4_ = 0;
   var _loc2_;
   var _loc3_;
   while(true)
   {
      _loc4_ = _loc4_ + 1;
      if(_loc4_ >= this._eaItems.length)
      {
         break;
      }
      _loc2_ = this._eaItems[_loc4_];
      _loc3_ = this.searchWordsInName(_loc9_,_loc2_.name.toUpperCase(),_loc5_);
      if(_loc3_ != 0)
      {
         _loc6_[_loc2_.unicID] = _loc3_;
         _loc7_[_loc2_.unicID] = _loc2_;
         _loc5_ = _loc3_;
      }
   }
   for(var _loc10_ in _loc6_)
   {
      if(_loc6_[_loc10_] >= _loc5_)
      {
         _loc8_.push(_loc7_[_loc10_]);
      }
   }
   this._lst.dataProvider = _loc8_;
};
_loc1.searchWordsInName = function(aWords, sName, nMaxWordsCount)
{
   var _loc3_ = 0;
   var _loc1_ = aWords.length;
   var _loc2_;
   while(true)
   {
      _loc1_ = _loc1_ - 1;
      if(_loc1_ < 0)
      {
         break;
      }
      _loc2_ = aWords[_loc1_];
      if(sName.toUpperCase().indexOf(_loc2_.toUpperCase()) != -1)
      {
         _loc3_ = _loc3_ + 1;
      }
      else if(_loc3_ + _loc1_ < nMaxWordsCount)
      {
         return 0;
      }
   }
   return _loc3_;
};
_loc1.itemRollOver = function(oEvent)
{
   this.gapi.showTooltip(oEvent.row.item.name + (" (" + oEvent.row.item.unicID + ")"),oEvent.row,20,{bXLimit:true,bYLimit:false});
};
_loc1.itemRollOut = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.setSpriteAccessories = function(oSprite, sAccessories)
{
   var _loc9_;
   var _loc5_;
   var _loc2_;
   var _loc3_;
   var _loc4_;
   var _loc6_;
   var _loc7_;
   var _loc8_;
   if(sAccessories.length != 0)
   {
      _loc9_ = new Array();
      _loc5_ = sAccessories.split(",");
      _loc2_ = -1;
      while(true)
      {
         _loc2_ = _loc2_ + 1;
         if(_loc2_ >= _loc5_.length)
         {
            break;
         }
         if(_loc5_[_loc2_].indexOf("~") != -1)
         {
            _loc3_ = _loc5_[_loc2_].split("~");
            _loc4_ = _global.parseInt(_loc3_[0],16);
            _loc6_ = _global.parseInt(_loc3_[1]);
            _loc7_ = _global.parseInt(_loc3_[2]) - 1;
         }
         else
         {
            _loc4_ = _global.parseInt(_loc5_[_loc2_],16);
            _loc6_;
            _loc7_;
         }
         if(!_global.isNaN(_loc4_))
         {
            _loc8_ = new dofus.datacenter["\x11"](_loc4_,_loc6_,_loc7_);
            _loc9_[_loc2_] = _loc8_;
         }
      }
      oSprite.accessories = _loc9_;
   }
};
_loc1.oData;
_loc1._nID = Number(0);
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.ui.PanelNPC.CLASS_NAME = "PanelNPC";
