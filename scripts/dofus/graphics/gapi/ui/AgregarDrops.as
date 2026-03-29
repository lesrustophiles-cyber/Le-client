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
_global.dofus["\r\x13"].gapi.ui.AgregarDrops = function()
{
   super();
};
dofus["\r\x13"].gapi.ui.AgregarDrops.prototype = new ank.gapi.core["\x1e\n\x0e"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.AgregarDrops.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.AgregarDrops.CLASS_NAME);
};
_loc1.callClose = function()
{
   this.api.ui.unloadUIComponent("AgregarDrops");
   return true;
};
_loc1.createChildren = function()
{
   this.hideItemViewer(true);
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initAnimList});
   this.addToQueue({object:this,method:this.loadMonsters});
   this.addToQueue({object:this,method:this.initData2});
};
_loc1.initData2 = function()
{
   this._eaItems = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc3_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc2_ = this.api.lang.getAllItemTypes();
   for(var _loc4_ in _loc2_)
   {
      _loc3_.push({label:_loc2_[_loc4_].n,id:_loc4_});
   }
   _loc3_.sortOn("label");
   _loc3_.push({label:"All",id:-1});
   this._cbTypeItems.dataProvider = _loc3_;
};
_loc1.initTexts = function()
{
   this._winBg.title = "ADD DROPS";
   this._lblType.text = this.api.lang.getText("TYPE");
   this._btnDelete.label = "Delete";
   this._btnModify.label = "Add or Modify";
   this._btnTest.label = "Test PP Item";
   this._btnSearch.label = "OK";
   this._tiSearch.text = !this._tiSearch.text.length ? "" : this._tiSearch.text;
   this._tiSearchItems.text = "";
   this.limpiarText();
};
_loc1.limpiarText = function()
{
   this._tiPP.text = "0";
   this._tiMax.text = "0";
   this._tiPorcentaje.text = "0.0";
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnDelete.addEventListener("click",this);
   this._btnModify.addEventListener("click",this);
   this._btnTest.addEventListener("click",this);
   this._btnRare.addEventListener("click",this);
   this._btnUnique.addEventListener("click",this);
   this._cbType.addEventListener("itemSelected",this);
   this._cbAnim.addEventListener("itemSelected",this);
   this._cg.addEventListener("selectItem",this);
   this._cg.addEventListener("overItem",this);
   this._cg.addEventListener("outItem",this);
   this._cg.addEventListener("dblClickItem",this);
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
   this._tiSearchItems.addEventListener("change",this);
   this._cbTypeItems.addEventListener("itemSelected",this);
   this._lst.addEventListener("itemSelected",this);
   this._lst.addEventListener("itemRollOver",this);
   this._lst.addEventListener("itemRollOut",this);
};
_loc1.initAnimList = function(eaTypes)
{
   var _loc4_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc2_ = -1;
   while(true)
   {
      _loc2_ = _loc2_ + 1;
      if(_loc2_ >= dofus["\r\x13"].gapi.ui.AgregarDrops.ANIM_LIST.length)
      {
         break;
      }
      _loc4_.push({label:dofus["\r\x13"].gapi.ui.AgregarDrops.ANIM_LIST[_loc2_]});
   }
   this._cbAnim.dataProvider = _loc4_;
};
_loc1.initData = function(eaTypes)
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
   var _loc10_ = this.api.lang.getMonsters();
   var _loc17_ = dofus["\x12\x03"].ARTWORKS_BIG_PATH;
   var _loc15_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc16_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc9_ = new Object();
   var _loc4_;
   var _loc3_;
   var _loc2_;
   var _loc8_;
   var _loc7_;
   var _loc6_;
   var _loc5_;
   for(var _loc18_ in _loc10_)
   {
      _loc4_ = _loc10_[_loc18_];
      _loc3_ = _loc4_.b;
      _loc2_ = _loc9_[_loc3_];
      if(_loc2_ == undefined)
      {
         _loc2_ = {label:this.api.lang.getMonstersRaceText(_loc3_).n,data:new ank["\x1e\n\t"]["\x0e\x1d"]()};
         _loc9_[_loc3_] = _loc2_;
         _loc15_.push(_loc2_);
      }
      _loc8_ = _loc18_;
      _loc7_ = _loc4_.n;
      _loc6_ = _loc4_.g;
      _loc5_ = {iconFile:_loc17_ + _loc6_ + ".swf",name:_loc7_,id:_loc8_,gfxId:_loc6_};
      _loc16_.push(_loc5_);
      _loc2_.data.push(_loc5_);
   }
   _loc15_.push({label:"-- ALL --",data:_loc16_});
   this.initData(_loc15_);
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
_loc1.rare = "false";
_loc1.unique = "false";
_loc1.click = function(oEvent)
{
   var _loc2_;
   var _loc3_;
   switch(oEvent.target._name)
   {
      case "_btnClose":
      case "_btnCancel":
         this.dispatchEvent({type:"cancel"});
         this.callClose();
         break;
      case "_btnSearch":
         this._cbType.selectedIndex = 0;
         this.filterResult(this._tiSearch.text);
         break;
      case "_btnTest":
         _loc2_ = this.oData.id;
         _loc3_ = this._lst.selectedItem.unicID;
         if(_loc2_ == undefined || _loc3_ == undefined)
         {
            return undefined;
         }
         this.limpiarText();
         this.api.kernel.DebugConsole.process("INFO_DROP_MOB_OBJETO " + _loc2_ + " " + _loc3_);
         this.hideItemViewer(true);
         break;
      case "_btnDelete":
         _loc2_ = this.oData.id;
         _loc3_ = this._lst.selectedItem.unicID;
         if(_loc2_ == undefined || _loc3_ == undefined)
         {
            return undefined;
         }
         this.limpiarText();
         this.api.kernel.DebugConsole.process("BORRAR_DROP " + _loc2_ + " " + _loc3_);
         this.hideItemViewer(true);
         break;
      case "_btnModify":
         _loc2_ = this.oData.id;
         _loc3_ = this._lst.selectedItem.unicID;
         if(_loc2_ == undefined || _loc3_ == undefined)
         {
            return undefined;
         }
         this.api.kernel.DebugConsole.process("ADD_DROP " + _loc2_ + " " + _loc3_ + " " + this._tiPP.text + " " + this._tiPorcentaje.text + " " + this._tiMax.text + ":" + this._tiCdt.text + " -1");
         this.hideItemViewer(true);
         break;
      case "_btnRare":
         if(this.rare == "false")
         {
            this.rare = "true";
            this._btnRare.selected = true;
            if(this._btnUnique.selected == true)
            {
               this._btnUnique.selected = false;
               this.unique = "false";
            }
         }
         else
         {
            this.rare = "false";
            this._btnRare.selected = false;
         }
         break;
      case "_btnUnique":
         if(this.unique == "false")
         {
            this.unique = "true";
            this._btnUnique.selected = true;
            if(this._btnRare.selected == true)
            {
               this._btnRare.selected = false;
               this.rare = "false";
            }
            break;
         }
         this.unique = "false";
         break;
   }
};
_loc1.change = function(oEvent)
{
   if(this._tiSearchItems.text.length > 3)
   {
      this.searchItem(this._tiSearchItems.text.toUpperCase());
   }
   else if(this._lst.dataProvider != this._eaItemsOriginal)
   {
      this._lst.dataProvider = this._eaItemsOriginal;
   }
};
_loc1.recibir = function(sText)
{
   var _loc2_ = sText.split(";");
   this._tiPP.text = _loc2_[0];
   this._tiPorcentaje.text = Number(_loc2_[1]) / 1000;
   this._tiMax.text = _loc2_[2];
};
_loc1.selectItem = function(oEvent)
{
   var _loc6_ = oEvent.target.contentData;
   var _loc5_;
   var _loc2_;
   var _loc7_;
   if(_loc6_ != undefined)
   {
      this._cciSprite.data = {name:_loc6_.name,gfxFile:dofus["\x12\x03"].CLIPS_PERSOS_PATH + _loc6_.gfxId + ".swf",title:_loc6_.id};
      this._cciSprite.enabled = true;
      _loc5_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
      _loc2_ = 0;
      _loc7_ = this.api.lang.getMonstersText(_loc6_.id);
      while(true)
      {
         _loc2_ = _loc2_ + 1;
         if(_loc2_ >= 6)
         {
            break;
         }
         _loc5_.push({label:_loc7_["g" + _loc2_].l,id:_loc2_});
      }
      this._cbGrado.dataProvider = _loc5_;
      this._cbGrado.selectedIndex = 0;
      this.oData = _loc6_;
   }
   else
   {
      this._cciSprite.data = undefined;
      this._cciSprite.enabled = false;
   }
   this._tiPP.text = "0";
   this._tiMax.text = "0";
   this._tiPorcentaje.text = "0.0";
   this.hideItemViewer(true);
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
   var _loc3_;
   switch(oEvent.target)
   {
      case this._cbType:
         _loc2_ = this._cbType.selectedItem.data;
         this._cg.dataProvider = _loc2_;
         this._lblNumber.text = _loc2_.length + " " + ank["\x1e\n\t"]["\x1e\x16\x1a"].combine(this.api.lang.getText("MONSTER"),"m",_loc2_.length < 2);
         this.hideItemViewer(true);
         break;
      case this._cbAnim:
         this._cciSprite.setAnim(this._cbAnim.selectedItem.label,true);
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
         _loc3_ = this._lst.selectedItem;
         if(_loc3_ == undefined)
         {
            this.hideItemViewer(true);
            break;
         }
         if(Key.isDown(dofus["\x12\x03"].CHAT_INSERT_ITEM_KEY))
         {
            this.api.kernel.GameManager.insertItemInChat(_loc3_);
            return undefined;
         }
         this.hideItemViewer(!this._winItemViewer._visible ? false : this._itvItemViewer.itemData.unicID == _loc3_.unicID);
         this._itvItemViewer.itemData = _loc3_;
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
_loc1.oData;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.ui.AgregarDrops.CLASS_NAME = "AgregarDrops";
_global.dofus["\r\x13"].gapi.ui.AgregarDrops.ANIM_LIST = ["static","walk","run","hit","bonus","anim0","anim1","anim2","anim3","anim4","anim5","anim6","anim7","anim8","anim9","anim10","anim11","anim12","anim12","anim13","anim14","anim15","anim16","anim17","anim18","anim111","anim112","anim113","anim114","anim115","anim116","anim117","emote1","emote2","emote3","emote4","emote5","emote6","emote7","emote8","emote9","emote10","emote11","emote12","emote13","emote14","emote15","emote16","emote17","emote18","emote19","emote20","emote21","emoteStatic1","emoteStatic14","emoteStatic15","emoteStatic16","emoteStatic19","emoteStatic20","emoteStatic21","die"];
