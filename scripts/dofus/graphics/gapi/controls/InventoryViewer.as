var _loc1 = _global.dofus["\r\x13"].gapi.controls.InventoryViewer.prototype;
_loc1.addListeners = function()
{
   this._btnFilterEquipement.addEventListener("click",this);
   this._btnFilterNonEquipement.addEventListener("click",this);
   this._btnFilterRessoureces.addEventListener("click",this);
   this._btnMoreChoice.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("over",this);
   this._btnFilterNonEquipement.addEventListener("over",this);
   this._btnFilterRessoureces.addEventListener("over",this);
   this._btnMoreChoice.addEventListener("over",this);
   this._btnFilterEquipement.addEventListener("out",this);
   this._btnFilterNonEquipement.addEventListener("out",this);
   this._btnFilterRessoureces.addEventListener("out",this);
   this._btnFilterSoul.addEventListener("out",this);
   this._btnFilterSoul.addEventListener("over",this);
   this._btnFilterSoul.addEventListener("click",this);
   this._btnFilterRunes.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("over",this);
   this._btnFilterRunes.addEventListener("click",this);
   this._btnMoreChoice.addEventListener("out",this);
   this._cbTypes.addEventListener("itemSelected",this);
};
_loc1.click = function(_loc2_)
{
   var _loc3_;
   if(_loc2_.target == this._btnMoreChoice)
   {
      _loc3_ = this.api.ui.createPopupMenu();
      _loc3_.addItem(this.api.lang.getText("INVENTORY_SEARCH"),this,this.showSearch);
      _loc3_.addItem(this.api.lang.getText("INVENTORY_DATE_SORT"),this,this.sortInventory,["_itemDateId"]);
      _loc3_.addItem(this.api.lang.getText("INVENTORY_NAME_SORT"),this,this.sortInventory,["_itemName"]);
      _loc3_.addItem(this.api.lang.getText("INVENTORY_TYPE_SORT"),this,this.sortInventory,["_itemType"]);
      _loc3_.addItem(this.api.lang.getText("INVENTORY_LEVEL_SORT"),this,this.sortInventory,["_itemLevel"]);
      _loc3_.addItem(this.api.lang.getText("INVENTORY_POD_SORT"),this,this.sortInventory,["_itemWeight"]);
      _loc3_.addItem(this.api.lang.getText("INVENTORY_QTY_SORT"),this,this.sortInventory,["_nQuantity"]);
      _loc3_.addItem("Trier par rareté",this,this.sortInventory,["_rarity"]);
      _loc3_.show(_root._xmouse,_root._ymouse);
      return undefined;
   }
   if(_loc2_.target != this._btnSelectedFilterButton)
   {
      this._btnSelectedFilterButton.selected = false;
      this._btnSelectedFilterButton = _loc2_.target;
      switch(_loc2_.target._name)
      {
         case "_btnFilterEquipement":
            this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_EQUIPEMENT;
            this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
            this._nCurrentFilterID = dofus["\x12\x03"].FILTER_ID_EQUIPEMENT;
            break;
         case "_btnFilterNonEquipement":
            this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_NONEQUIPEMENT;
            this._lblFilter.text = this.api.lang.getText("NONEQUIPEMENT");
            this._nCurrentFilterID = dofus["\x12\x03"].FILTER_ID_NONEQUIPEMENT;
            break;
         case "_btnFilterRunes":
            this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_RUNES;
            this._lblFilter.text = this.api.lang.getText("RUNES");
            this._nCurrentFilterID = dofus["\x12\x03"].FILTER_ID_RUNES;
            break;
         case "_btnFilterSoul":
            this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_SOUL;
            this._lblFilter.text = this.api.lang.getText("SOUL");
            this._nCurrentFilterID = dofus["\x12\x03"].FILTER_ID_SOUL;
            break;
         case "_btnFilterRessoureces":
            this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_RESSOURECES;
            this._lblFilter.text = this.api.lang.getText("RESSOURECES");
            this._nCurrentFilterID = dofus["\x12\x03"].FILTER_ID_RESSOURECES;
      }
      this.updateData();
   }
   else
   {
      _loc2_.target.selected = true;
   }
};
