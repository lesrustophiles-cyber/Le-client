var _loc1 = _global.dofus["\r\x13"].gapi.ui.Inventory.prototype;
_loc1.CONTAINER_BY_TYPE = {type1:["_ctr0"],type2:["_ctr1"],type3:["_ctr2","_ctr4"],type4:["_ctr3"],type5:["_ctr5"],type6:["_ctrMount"],type8:["_ctr1"],type9:["_ctr8","_ctrMount"],type10:["_ctr6"],type11:["_ctr7"],type12:["_ctr8","_ctr16"],type13:["_ctr9","_ctr10","_ctr11","_ctr12","_ctr13","_ctr14"],type7:["_ctr15"],type23:["_ctr1"]};
_loc1.SUPERTYPE_NOT_EQUIPABLE = [9,14,15,16,17,18,6,19,21,20,8,22];
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.Inventory.CLASS_NAME);
   this.gapi.getUIComponent("Banner").shortcuts.setCurrentTab("Items");
   this.showCharacterPreview(this.api.kernel.OptionsManager.getOption("CharacterPreview"));
   this.showLivingItems(false);
   this.activaeliminar = false;
   this._windowInventoryRapidStuff._visible = false;
   this._tiSearch._visible = false;
   this._tiSearchFont._visible = false;
   this._btnQuitSearch._visible = false;
   this._txtNameStuff._visible = false;
};
_loc1.validate = function(_loc2_)
{
   var _loc4_;
   switch(_loc2_.params.type)
   {
      case "sendMultiple":
         if(_loc2_.value > 0 && !_global.isNaN(Number(_loc2_.value)))
         {
            _loc4_ = Math.min(_loc2_.value,_loc2_.params.item.Quantity);
            this.askSendItem(_loc2_.params.item,_loc2_.params.cible,_loc4_);
         }
         break;
      case "useMultiple":
         if(_loc2_.value > 0 && !_global.isNaN(Number(_loc2_.value)))
         {
            _loc4_ = Math.min(_loc2_.value,_loc2_.params.item.Quantity);
            this.askBatchUseItem(_loc2_.params.item,_loc4_);
         }
         break;
      case "destroy":
         if(_loc2_.value > 0 && !_global.isNaN(Number(_loc2_.value)))
         {
            _loc4_ = Math.min(_loc2_.value,_loc2_.params.item.Quantity);
            this.askDestroy(_loc2_.params.item,_loc4_);
         }
         break;
      case "drop":
         this.gapi.removeCursor();
         if(_loc2_.value > 0 && !_global.isNaN(Number(_loc2_.value)))
         {
            if(this.api.kernel.OptionsManager.getOption("ConfirmDropItem"))
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CONFIRM_DROP_ITEM"),"CAUTION_YESNO",{name:"ConfirmDrop",params:{item:_loc2_.params.item,minValue:_loc2_.value},listener:this});
            }
            else
            {
               this.api.network.Items.drop(_loc2_.params.item.ID,Math.min(_loc2_.value,_loc2_.params.item.Quantity));
            }
         }
         break;
      case "move":
         if(_loc2_.value > 0 && !_global.isNaN(Number(_loc2_.value)))
         {
            this.api.network.Items.movement(_loc2_.params.item.ID,_loc2_.params.position,Math.min(_loc2_.value,_loc2_.params.item.Quantity));
            break;
         }
   }
};
_loc1.sortInventory = function(sField)
{
   if(sField == null)
   {
      sField = "_nID";
   }
   if(sField == "_rarity")
   {
      this._cgGrid.dataProvider.sortOn(sField,Array.DESCENDING);
   }
   else
   {
      this._cgGrid.dataProvider.sortOn(sField,Array.NUMERIC);
   }
   this._sCurrentSort = sField;
   this._nLastProviderLen = this._cgGrid.dataProvider.length;
   this._nLastFilterID = this._nCurrentFilterID;
   this._cgGrid.modelChanged();
};
_loc1.change = function(oEvent)
{
   if(this._tiSearch.text.length >= 3)
   {
      this.searchItem(this._tiSearch.text.toUpperCase());
   }
   else
   {
      this.updateData(false);
   }
};
_loc1.showCharacterPreview = function(bShow)
{
   if(bShow)
   {
      this._winPreview._visible = true;
      this._svCharacterViewer._visible = true;
      this._mcItemSetViewerPlacer._x = this._mcBottomPlacer._x;
      this._mcItemSetViewerPlacer._y = this._mcBottomPlacer._y;
      this._isvItemSetViewer._x = this._mcBottomPlacer._x;
      this._isvItemSetViewer._y = this._mcBottomPlacer._y;
   }
   else
   {
      this._winPreview._visible = false;
      this._svCharacterViewer._visible = false;
      this._mcItemSetViewerPlacer._x = this._winPreview._x;
      this._mcItemSetViewerPlacer._y = this._winPreview._y;
      this._isvItemSetViewer._x = this._winPreview._x;
      this._isvItemSetViewer._y = this._winPreview._y;
   }
};
_loc1.batchUseItem = function(_loc2_)
{
   var _loc3_;
   if(_loc2_.item.Quantity > 1)
   {
      _loc3_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc2_.item.Quantity,params:{type:"useMultiple",item:_loc2_.item}});
      _loc3_.addEventListener("validate",this);
   }
   else
   {
      this.useItem(_loc2_);
   }
};
_loc1.batchSendItem = function(_loc2_)
{
   var _loc3_;
   if(_loc2_.item.Quantity > 1)
   {
      _loc3_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc2_.item.Quantity,params:{type:"sendMultiple",item:_loc2_.item,cible:_loc2_.cible}});
      _loc3_.addEventListener("validate",this);
   }
   else
   {
      this.askSendItem(_loc2_.item,_loc2_.cible,1);
   }
};
_loc1.askSendItem = function(oEvent, playerid, qty)
{
   this.api.network.send("OS" + oEvent.ID + "|" + qty + "|" + playerid);
};
_loc1.askBatchUseItem = function(_loc2_, qty)
{
   if(!_loc2_.canUse || !this.api.datacenter.Player.canUseObject)
   {
      return undefined;
   }
   this.api.network.Items.use(_loc2_.ID,undefined,undefined,undefined,qty);
};
_loc1.searchItem = function(sText)
{
   var _loc9_ = sText.split(" ");
   var _loc8_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc5_ = new Object();
   var _loc7_ = 0;
   var _loc2_ = 0;
   var _loc6_;
   var _loc3_;
   var _loc4_;
   while(_loc2_ < this._cgGridCopy.length)
   {
      _loc6_ = this._cgGridCopy[_loc2_];
      _loc3_ = this.searchWordsInName(_loc9_,_loc6_.name.toUpperCase(),_loc7_);
      if(_loc3_ != 0)
      {
         _loc4_ = new Object();
         _loc4_.oWords = _loc3_;
         _loc4_.oItem = _loc6_;
         _loc5_[_loc2_] = _loc4_;
         _loc7_ = _loc3_;
      }
      _loc2_ += 1;
   }
   for(var _loc10_ in _loc5_)
   {
      if(_loc5_[_loc10_].oWords >= _loc7_)
      {
         _loc8_.push(_loc5_[_loc10_].oItem);
      }
   }
   this._cgGrid.dataProvider = _loc8_;
   this._lblSearchCount.text = _loc8_.length != 0 ? _loc8_.length + " " + ank["\x1e\n\t"]["\x1e\x16\x1a"].combine(this.api.lang.getText("OBJECTS"),"m",_loc8_ < 2) : this.api.lang.getText("NO_BIGSTORE_SEARCH_RESULT");
   this._btnView.enabled = false;
};
_loc1.searchWordsInName = function(aWords, sName, nMaxWordsCount)
{
   var _loc2_ = 0;
   var _loc1_ = aWords.length;
   var _loc3_;
   while(_loc1_ >= 0)
   {
      _loc3_ = aWords[_loc1_];
      if(sName.indexOf(_loc3_) != -1)
      {
         _loc2_ += 1;
      }
      else if(_loc2_ + _loc1_ < nMaxWordsCount)
      {
         return 0;
      }
      _loc1_ -= 1;
   }
   return _loc2_;
};
_loc1.resetTwoHandClip = function()
{
   this._cgGridCopy = this._cgGrid.dataProvider.clone();
   this._ctrShield.content._alpha = 100;
   this._ctrWeapon.content._alpha = 100;
   this._mcTwoHandedLink.gotoAndStop(1);
   if(this.api.datacenter.Player.weaponItem.needTwoHands)
   {
      this._mcTwoHandedLink._visible = true;
      this._mcTwoHandedCrossLeft._visible = true;
      this._mcTwoHandedCrossRight._visible = false;
   }
   else
   {
      this._mcTwoHandedLink._visible = false;
      this._mcTwoHandedCrossLeft._visible = false;
      this._mcTwoHandedCrossRight._visible = false;
   }
};
_loc1.showSearchButton = function(oValue, oClick)
{
   if(oValue)
   {
      this._cbTypes._visible = false;
      this._btnQuitSearch._visible = true;
      this._btnSearch._visible = false;
      this._tiSearch._visible = true;
      this._tiSearchFont._visible = true;
      this._tiSearch.text = "";
      this._tiSearch.setFocus();
   }
   else
   {
      this._cbTypes._visible = true;
      this._btnQuitSearch._visible = false;
      this._btnSearch._visible = true;
      this._tiSearch.text = "";
      this._tiSearch._visible = false;
      this._tiSearchFont._visible = false;
   }
};
_loc1.outItem = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.addListeners = function()
{
   this._cgSets.addEventListener("overItem",this);
   this._cgSets.addEventListener("outItem",this);
   this._btnSearch.addEventListener("click",this);
   this._btnQuitSearch.addEventListener("click",this);
   this._tiSearch.addEventListener("change",this);
   this._cgGrid.addEventListener("dropItem",this);
   this._cgGrid.addEventListener("dragItem",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgGrid.addEventListener("overItem",this);
   this._cgGrid.addEventListener("outItem",this);
   this._cgGrid.addEventListener("dblClickItem",this);
   this._btnCrear.addEventListener("click",this);
   this._btnNuevo.addEventListener("click",this);
   this._btnModificar.addEventListener("click",this);
   this._btnBorrar.addEventListener("click",this);
   this._btnUsar.addEventListener("click",this);
   this._btnMoreChoice.addEventListener("click",this);
   this._btnMoreChoice.addEventListener("over",this);
   this._btnMoreChoice.addEventListener("out",this);
   this._btnFilterSets.addEventListener("click",this);
   this._btnFilterSets.addEventListener("over",this);
   this._btnFilterSets.addEventListener("out",this);
   this._btnClose.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("click",this);
   this._btnFilterNonEquipement.addEventListener("click",this);
   this._btnFilterRessoureces.addEventListener("click",this);
   this._btnFilterSoul.addEventListener("over",this);
   this._btnFilterSoul.addEventListener("click",this);
   this._btnFilterSoul.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("over",this);
   this._btnFilterRunes.addEventListener("click",this);
   this._btnFilterRunes.addEventListener("out",this);
   this._btnFilterQuest.addEventListener("click",this);
   this._btnMultiEliminar.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("over",this);
   this._btnFilterNonEquipement.addEventListener("over",this);
   this._btnFilterRessoureces.addEventListener("over",this);
   this._btnFilterQuest.addEventListener("over",this);
   this._btnFilterEquipement.addEventListener("out",this);
   this._btnFilterNonEquipement.addEventListener("out",this);
   this._btnFilterRessoureces.addEventListener("out",this);
   this._btnFilterQuest.addEventListener("out",this);
   this._itvItemViewer.addEventListener("useItem",this);
   this._itvItemViewer.addEventListener("batchSendItem",this);
   this._itvItemViewer.addEventListener("batchUseItem",this);
   this._itvItemViewer.addEventListener("destroyItem",this);
   this._itvItemViewer.addEventListener("sendItem",this);
   this._itvItemViewer.addEventListener("linkItem",this);
   this._itvItemViewer.addEventListener("separarMimobionte",this);
   this._itvItemViewer.addEventListener("verContenido",this);
   this._itvItemViewer.addEventListener("targetItem",this);
   this._cbTypes.addEventListener("itemSelected",this);
   var _loc4_;
   var _loc3_;
   var _loc2_;
   for(var _loc5_ in dofus["\r\x13"].gapi.ui.Inventory.CONTAINER_BY_TYPE)
   {
      _loc4_ = dofus["\r\x13"].gapi.ui.Inventory.CONTAINER_BY_TYPE[_loc5_];
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         _loc2_ = this[_loc4_[_loc3_]];
         _loc2_.addEventListener("over",this);
         _loc2_.addEventListener("out",this);
         if(_loc2_.toolTipText == undefined)
         {
            _loc2_.toolTipText = this.api.lang.getText(_loc2_ == this._ctrMount ? "MOUNT" : "INVENTORY_" + _loc5_.toUpperCase());
         }
         _loc3_ += 1;
      }
   }
};
_loc1.initTexts = function()
{
   this._lblWeight.text = this.api.lang.getText("WEIGHT");
   this._winPreview.title = this.api.lang.getText("CHARACTER_PREVIEW",[this.api.datacenter.Player.Name]);
   this._winBg.title = this.api.lang.getText("INVENTORY");
   this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
   this._lblNoItem.text = this.api.lang.getText("SELECT_ITEM");
   this._winLivingItems.title = this.api.lang.getText("MANAGE_ITEM");
   this._txtNombre.text = "";
   this._txtNombre.restrict = "0-9a-zA-Z ";
   this._txtNombre.maxChars = 20;
   this._txtNameStuff.text = "-Choisir un set-";
   this._txtInformacion.text = this.api.lang.getText("ITEMS_SETS_RAPIDO");
   this._txtIntro.text = this.api.lang.getText("INTRO_SETS_RAPIDO");
   this._txtIconos.text = this.api.lang.getText("ICONOS_SETS_RAPIDO");
   this._btnNuevo.label = this.api.lang.getText("NEW");
   this._btnCrear.label = this.api.lang.getText("SAVE");
   this._btnUsar.label = this.api.lang.getText("USE");
   this._btnModificar.label = this.api.lang.getText("MODIFY");
   this._btnBorrar.label = this.api.lang.getText("DELETE");
};
_loc1.mostrarPanelSet = function(bMostrar)
{
   this._cgGrid._visible = !bMostrar;
   this._cgSets._visible = bMostrar;
   if(bMostrar)
   {
      this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
      this.actualizarContainers("");
   }
   this._btnNuevo._visible = bMostrar;
   this._txtIntro._visible = bMostrar;
   this._txtInformacion._visible = bMostrar;
   this._txtNameStuff._visible = bMostrar;
   this._nIcono = 1;
   this._oSet = undefined;
   var _loc2_ = 0;
   while(_loc2_ <= 17)
   {
      this["_sctr" + _loc2_]._visible = bMostrar;
      this["_m" + _loc2_]._visible = bMostrar;
      _loc2_ = _loc2_ + 1;
   }
   if(!bMostrar)
   {
      this._txtIconos._visible = false;
      this._cgIconos._visible = false;
      this._btnCrear._visible = false;
      this._btnUsar._visible = false;
      this._btnModificar._visible = false;
      this._btnBorrar._visible = false;
      this._mBlanco._visible = false;
      this._txtNombre._visible = false;
   }
};
_loc1.selectItem = function(oEvent)
{
   if(Key.isDown(dofus["\x12\x03"].CHAT_INSERT_ITEM_KEY) && oEvent.target.contentData != undefined)
   {
      this.api.kernel.GameManager.insertItemInChat(oEvent.target.contentData);
   }
   else
   {
      if(oEvent.target.contentData.position == -1 && this.activaeliminar)
      {
         this.api.network.send("Od" + oEvent.target.contentData.ID + "|" + oEvent.target.contentData.Quantity + "|1");
         this.api.datacenter.Player.dropItem(oEvent.target.contentData.ID);
      }
      this.showItemInfos(oEvent.target.contentData);
      this.showLivingItems(oEvent.target.contentData.skineable == true);
      if(oEvent.target.contentData.skineable)
      {
         this._livItemViewer.itemData = oEvent.target.contentData;
      }
   }
};
_loc1.initFilter = function()
{
   switch(this.api.datacenter.Basics.inventory_filter)
   {
      case "sets":
         this._btnFilterSets.selected = true;
         this._btnSelectedFilterButton = this._btnFilterSets;
         this.mostrarPanelSet(true);
         break;
      case "nonequipement":
         this._btnFilterNonEquipement.selected = true;
         this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_NONEQUIPEMENT;
         this._btnSelectedFilterButton = this._btnFilterNonEquipement;
         this.mostrarPanelSet(false);
         break;
      case "resources":
         this._btnFilterRessoureces.selected = true;
         this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_RESSOURECES;
         this._btnSelectedFilterButton = this._btnFilterRessoureces;
         this.mostrarPanelSet(false);
         break;
      case "quest":
         this._btnFilterQuest.selected = true;
         this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_QUEST;
         this._btnSelectedFilterButton = this._btnFilterQuest;
         this.mostrarPanelSet(false);
         break;
      case "runes":
         this._btnFilterQuest.selected = true;
         this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_RUNES;
         this._btnSelectedFilterButton = this._btnFilterRunes;
         this.mostrarPanelSet(false);
         break;
      case "soul":
         this._btnFilterQuest.selected = true;
         this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_SOUL;
         this._btnSelectedFilterButton = this._btnFilterSoul;
         this.mostrarPanelSet(false);
         break;
      case "equipement":
      default:
         this._btnFilterEquipement.selected = true;
         this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_EQUIPEMENT;
         this._btnSelectedFilterButton = this._btnFilterEquipement;
         this.mostrarPanelSet(false);
   }
};
_loc1.actualizarContainers = function(sData)
{
   var _loc3_ = 0;
   while(_loc3_ <= 17)
   {
      this["_sctr" + _loc3_].contentData = undefined;
      _loc3_ = _loc3_ + 1;
   }
   if(sData == undefined || sData == "")
   {
      return undefined;
   }
   var _loc8_ = sData.split(";");
   var _loc5_;
   var _loc7_;
   var _loc6_;
   var _loc4_;
   for(var _loc9_ in _loc8_)
   {
      _loc5_ = _loc8_[_loc9_].split(",");
      _loc7_ = _global.parseInt(_loc5_[0]);
      _loc6_ = _global.parseInt(_loc5_[1]);
      _loc4_ = this.api.datacenter.Player.getObjeto(_loc7_);
      if(_loc4_ != undefined)
      {
         this["_sctr" + _loc6_].contentData = _loc4_.item;
      }
   }
};
_loc1.showSearch = function()
{
   var _loc2_ = this.gapi.loadUIComponent("InventorySearch","InventorySearch",{_oDataProvider:this._cgGrid.dataProvider});
   _loc2_.addEventListener("selected",this);
};
_loc1.getData = function()
{
   var _loc2_ = "";
   var _loc3_ = 0;
   var _loc4_;
   while(_loc3_ <= 17)
   {
      _loc4_ = this["_ctr" + _loc3_].contentData;
      if(_loc4_ != undefined)
      {
         if(_loc2_.length > 0)
         {
            _loc2_ += ";";
         }
         _loc2_ += _loc4_.ID + "," + _loc4_.position;
      }
      _loc3_ = _loc3_ + 1;
   }
   return _loc2_;
};
_loc1.click = function(oEvent)
{
   if(oEvent.target == this._btnClose)
   {
      this.callClose();
      return undefined;
   }
   var _loc4_;
   var _loc6_;
   var _loc3_;
   var _loc5_;
   var _loc8_;
   var _loc10_;
   var _loc7_;
   switch(oEvent.target._name)
   {
      case "_btnNuevo":
         if(this._cgSets.dataProvider.length >= 10)
         {
            return undefined;
         }
         this._cgIconos._visible = true;
         this._btnCrear._visible = true;
         this._mBlanco._visible = true;
         this._txtNombre._visible = true;
         this._txtIconos._visible = true;
         this._btnUsar._visible = false;
         this._btnModificar._visible = false;
         this._btnBorrar._visible = false;
         this.cargarIconos();
         _loc4_ = 0;
         while(_loc4_ <= 17)
         {
            this["_sctr" + _loc4_].contentData = this["_ctr" + _loc4_].contentData;
            _loc4_ = _loc4_ + 1;
         }
         this._nIcono = 1;
         return undefined;
         break;
      case "_btnCrear":
         if(this._txtNombre.text == "")
         {
            return undefined;
         }
         this._txtIconos._visible = false;
         this._cgIconos._visible = false;
         this._btnCrear._visible = false;
         this._mBlanco._visible = false;
         this._txtNombre._visible = false;
         if(this._cgSets.dataProvider.length >= 10)
         {
            return undefined;
         }
         _loc6_ = 0;
         _loc3_ = 1;
         while(_loc3_ <= 12)
         {
            _loc5_ = this.api.datacenter.Player.getSet(_loc3_);
            if(_loc5_ == undefined)
            {
               _loc6_ = _loc3_;
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
         if(_loc6_ == 0)
         {
            return undefined;
         }
         _loc8_ = this.getData();
         _loc10_ = {ID:_loc6_,name:this._txtNombre.text,icono:this._nIcono,iconFile:dofus["\x12\x03"].SETS_RAPIDOS_ICONS_PATH + this._nIcono + ".swf",data:_loc8_};
         this.api.datacenter.Player.addSet(_loc10_);
         this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
         this.api.network.send("ZSC" + _loc6_ + "|" + this._txtNombre.text + "|" + this._nIcono + "|" + _loc8_);
         return undefined;
         break;
      case "_btnModificar":
         if(this._oSet == undefined)
         {
            return undefined;
         }
         _loc8_ = this.getData();
         _loc10_ = {ID:this._oSet.ID,name:this._oSet.name,icono:this._oSet.icono,iconFile:this._oSet.iconFile,data:_loc8_};
         this.api.datacenter.Player.addSet(_loc10_);
         this.actualizarContainers(_loc8_);
         this.api.network.send("ZSC" + this._oSet.ID + "|" + this._oSet.name + "|" + this._oSet.icono + "|" + _loc8_);
         return undefined;
         break;
      case "_btnUsar":
         if(this._oSet == undefined)
         {
            return undefined;
         }
         this.api.network.send("ZSU" + this._oSet.ID);
         return undefined;
         break;
      case "_btnBorrar":
         if(this._oSet == undefined)
         {
            return undefined;
         }
         this._cgIconos._visible = false;
         this._btnCrear._visible = false;
         this._mBlanco._visible = false;
         this._txtNombre._visible = false;
         this._txtIconos._visible = false;
         this._btnUsar._visible = false;
         this._btnModificar._visible = false;
         this._btnBorrar._visible = false;
         this.api.datacenter.Player.removeSet(this._oSet.ID);
         this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
         this.actualizarContainers("");
         this.api.network.send("ZSB" + this._oSet.ID);
         return undefined;
         break;
      default:
         if(this._mcArrowAnimation._visible)
         {
            this._mcArrowAnimation._visible = false;
         }
         if(oEvent.target == this._btnMoreChoice)
         {
            _loc7_ = this.api.ui.createPopupMenu();
            _loc7_.addItem(this.api.lang.getText("INVENTORY_DATE_SORT"),this,this.sortInventory,["_nID"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_NAME_SORT"),this,this.sortInventory,["_itemName"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_TYPE_SORT"),this,this.sortInventory,["_itemType"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_LEVEL_SORT"),this,this.sortInventory,["_itemLevel"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_POD_SORT"),this,this.sortInventory,["_itemWeight"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_QTY_SORT"),this,this.sortInventory,["_nQuantity"]);
            _loc7_.addItem("Trier par rareté",this,this.sortInventory,["_rarity"]);
            _loc7_.show(_root._xmouse,_root._ymouse);
            return undefined;
         }
         if(oEvent.target != this._btnSelectedFilterButton)
         {
            this.api.sounds.events.onInventoryFilterButtonClick();
            this._btnSelectedFilterButton.selected = false;
            this._btnSelectedFilterButton = oEvent.target;
            switch(oEvent.target._name)
            {
               case "_btnFilterSets":
                  this._lblFilter.text = this.api.lang.getText("SETS_RAPIDOS");
                  this.mostrarPanelSet(true);
                  return undefined;
               case "_btnFilterRunes":
                  this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_RUNES;
                  this._lblFilter.text = this.api.lang.getText("RUNES");
                  this.api.datacenter.Basics.inventory_filter = "runes";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterSoul":
                  this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_SOUL;
                  this._lblFilter.text = this.api.lang.getText("SOUL");
                  this.api.datacenter.Basics.inventory_filter = "soul";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterEquipement":
                  this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_EQUIPEMENT;
                  this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
                  this.api.datacenter.Basics.inventory_filter = "equipement";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterNonEquipement":
                  this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_NONEQUIPEMENT;
                  this._lblFilter.text = this.api.lang.getText("NONEQUIPEMENT");
                  this.api.datacenter.Basics.inventory_filter = "nonequipement";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterRessoureces":
                  this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_RESSOURECES;
                  this._lblFilter.text = this.api.lang.getText("RESSOURECES");
                  this.api.datacenter.Basics.inventory_filter = "resources";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterQuest":
                  this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_QUEST;
                  this._lblFilter.text = this.api.lang.getText("QUEST_OBJECTS");
                  this.api.datacenter.Basics.inventory_filter = "quest";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnSearch":
                  this.showSearchButton(true);
                  break;
               case "_btnQuitSearch":
                  this.showSearchButton(false);
            }
            this.updateData(true);
         }
         else
         {
            oEvent.target.selected = true;
         }
   }
};
_loc1.updateData = function(_loc2_)
{
   var _loc13_ = this.api.datacenter.Basics[dofus["\r\x13"].gapi.ui.Inventory.CLASS_NAME + "_subfilter_" + this._btnSelectedFilterButton._name];
   this._nSelectedTypeID = _loc13_ == undefined ? 0 : _loc13_;
   var _loc4_ = new Object();
   if(!_loc2_)
   {
      for(var _loc12_ in dofus["\r\x13"].gapi.ui.Inventory.CONTAINER_BY_TYPE)
      {
         for(var _loc8_ in dofus["\r\x13"].gapi.ui.Inventory.CONTAINER_BY_TYPE[_loc12_])
         {
            _loc4_[dofus["\r\x13"].gapi.ui.Inventory.CONTAINER_BY_TYPE[_loc12_][_loc8_]] = true;
         }
      }
   }
   var _loc10_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc9_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc7_ = new Object();
   var _loc2_;
   var _loc6_;
   var _loc5_;
   var _loc3_;
   for(_loc12_ in this._eaDataProvider)
   {
      _loc2_ = this._eaDataProvider[_loc12_];
      _loc6_ = _loc2_.position;
      if(_loc6_ != -1)
      {
         if(!_loc2_)
         {
            _loc5_ = this["_ctr" + _loc6_];
            _loc5_.contentData = _loc2_;
            delete _loc4_[_loc5_._name];
         }
      }
      else if(this._aSelectedSuperTypes[_loc2_.superType])
      {
         if(_loc2_.type == this._nSelectedTypeID || this._nSelectedTypeID == 0)
         {
            _loc10_.push(_loc2_);
         }
         _loc3_ = _loc2_.type;
         if(_loc7_[_loc3_] != true)
         {
            _loc9_.push({label:this.api.lang.getItemTypeText(_loc3_).n,id:_loc3_});
            _loc7_[_loc3_] = true;
         }
      }
   }
   _loc9_.sortOn("label");
   _loc9_.splice(0,0,{label:this.api.lang.getText("WITHOUT_TYPE_FILTER"),id:0});
   this._cbTypes.dataProvider = _loc9_;
   this.setType(this._nSelectedTypeID);
   this._cgGrid.dataProvider = _loc10_;
   this.sortInventory(this._sCurrentSort);
   if(!_loc2_)
   {
      for(_loc12_ in _loc4_)
      {
         if(this[_loc12_] != this._ctrMount)
         {
            this[_loc12_].contentData = undefined;
         }
      }
   }
   this.resetTwoHandClip();
};
_loc1.elegirSet = function(oEvent)
{
   var _loc2_ = oEvent.target.contentData;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   this._oSet = _loc2_;
   this.actualizarContainers(this._oSet.data);
   this._cgIconos._visible = false;
   this._btnCrear._visible = false;
   this._mBlanco._visible = false;
   this._txtNombre._visible = false;
   this._txtIconos._visible = false;
   this._btnUsar._visible = true;
   this._btnModificar._visible = true;
   this._txtNameStuff = this._oSet.name;
   this._btnBorrar._visible = true;
};
_loc1.elegirIcono = function(oEvent)
{
   var _loc2_ = oEvent.target.contentData;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   this._nIcono = _loc2_.index;
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnFilterSets:
         this.api.ui.showTooltip(this.api.lang.getText("SETS_RAPIDOS"),oEvent.target,-20);
         break;
      case this._btnFilterEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("EQUIPEMENT"),oEvent.target,-20);
         break;
      case this._btnFilterNonEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("NONEQUIPEMENT"),oEvent.target,-20);
         break;
      case this._btnFilterRessoureces:
         this.api.ui.showTooltip(this.api.lang.getText("RESSOURECES"),oEvent.target,-20);
         break;
      case this._btnFilterRunes:
         this.api.ui.showTooltip(this.api.lang.getText("RUNES"),oEvent.target,-20);
         break;
      case this._btnFilterSoul:
         this.api.ui.showTooltip(this.api.lang.getText("SOUL"),oEvent.target,-20);
         break;
      case this._btnFilterQuest:
         this.api.ui.showTooltip(this.api.lang.getText("QUEST_OBJECTS"),oEvent.target,-20);
         break;
      default:
         this.api.ui.showTooltip(oEvent.target.toolTipText,oEvent.target,-20);
   }
};
_loc1.cargarIconos = function()
{
   var _loc4_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc2_ = 1;
   var _loc3_;
   while(_loc2_ <= 27)
   {
      _loc3_ = new Object();
      _loc3_.iconFile = dofus["\x12\x03"].SETS_RAPIDOS_ICONS_PATH + _loc2_ + ".swf";
      _loc3_.index = _loc2_;
      _loc4_.push(_loc3_);
      _loc2_ = _loc2_ + 1;
   }
   this._cgIconos.dataProvider = _loc4_;
};
_loc1.showLivingItems = function(bShow)
{
   this._livItemViewer._visible = bShow;
   this._winLivingItems._visible = bShow;
   if(bShow)
   {
      this._mcItemSetViewerPlacer._x = this._mcBottomPlacer._x;
      this._mcItemSetViewerPlacer._y = this._mcBottomPlacer._y;
      this._isvItemSetViewer._x = this._mcBottomPlacer._x;
      this._isvItemSetViewer._y = this._mcBottomPlacer._y;
   }
   else
   {
      this.showCharacterPreview(this.api.kernel.OptionsManager.getOption("CharacterPreview"));
   }
};
_loc1.separarMimobionte = function(oEvent)
{
   this.api.network.send("Om" + oEvent.item.ID);
};
_loc1.linkItem = function(oEvent)
{
   this.api.network.send("Ol" + oEvent.item.ID);
};
_loc1.sendItem = function(oEvent)
{
   var _loc12_ = this.api.ui.getUIComponent("Party");
   var _loc5_;
   var _loc11_;
   var _loc3_;
   var _loc4_;
   var _loc6_;
   if(_loc12_ != null)
   {
      _loc5_ = _loc12_._aMembers;
      _loc11_ = this.api.ui.createPopupMenu();
      _loc11_.addStaticItem(oEvent.item.name);
      _loc3_ = 0;
      while(_loc3_ < _loc5_.length)
      {
         _loc4_ = _loc12_.getMemberById(_loc5_[_loc3_].id).name;
         _loc6_ = _loc5_[_loc3_].id;
         if(this.api.datacenter.Player.Name != _loc4_)
         {
            _loc11_.addItem(_loc4_,oEvent.cmp,this.dispatchEvent,[{type:"batchSendItem",item:oEvent.item,cible:_loc6_}]);
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc11_.show(_root._xmouse,_root._ymouse);
   }
};
_loc1.verContenido = function(oEvent)
{
   this.api.ui.loadUIComponent("Contenido","Contenido",{datos:oEvent.item.ID});
};
_loc1._oSet = undefined;
_loc1._nIcono = 1;
