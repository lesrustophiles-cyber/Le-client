var _loc1 = dofus.datacenter["\x0b\f"].prototype;
_loc1.__get__SpellsManager = function()
{
   if(this._sID == this._nIDOriginal)
   {
      return this.SpellsManager1;
   }
   return this.SpellsManager2;
};
_loc1.cleanSpellsManager = function()
{
   this.SpellsManager1.clear();
   this.SpellsManager2.clear();
};
_loc1.getObjeto = function(nID)
{
   return this.Inventory.findFirstItem("ID",nID);
};
_loc1.cleanSpells = function()
{
   this.SpellsManager = new _global.palmad.dofus.managers.SpellsManager(this);
   this.SpellsManager2 = new _global.palmad.dofus.managers.SpellsManager(this);
};
_loc1.addItem = function(_loc2_)
{
   if(_loc2_.position == 1)
   {
      this.setWeaponItem(_loc2_);
   }
   this.Inventory.startNoEventDispatchsPeriod(dofus["\x12\x03"].DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
   this.Inventory.push(_loc2_);
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.addItemAt(_loc2_.position,_loc2_);
   }
};
_loc1.clean = function()
{
   this.SpellsManager = new _global.palmad.dofus.managers.SpellsManager(this);
   this.SpellsManager2 = new _global.palmad.dofus.managers.SpellsManager(this);
   this.InteractionsManager = new _global.palmad.dofus.managers.InteractionsManager(this,this.api);
   this.Inventory = new _global.palmad.ank.utils.ExtendedArray();
   this.InventoryByItemPositions = _global.palmad.ank.utils.ExtendedObject();
   this.ItemSets = new _global.palmad.ank.utils.ExtendedObject();
   this.Jobs = new _global.palmad.ank.utils.ExtendedArray();
   this.Spells = new _global.palmad.ank.utils.ExtendedArray();
   this.Emotes = new _global.palmad.ank.utils.ExtendedObject();
   this.Titles = new _global.palmad.ank.utils.ExtendedObject();
   this.SetsRapidos = new _global.palmad.ank.utils.ExtendedArray();
   this.clearSummon();
   this._bCraftPublicMode = false;
   this._bInParty = false;
   _loc1._bOgrine = 0;
};
_loc1.getSet = function(nID)
{
   var _loc2_ = this.SetsRapidos.findFirstItem("ID",nID);
   if(_loc2_.index == -1)
   {
      return undefined;
   }
   return _loc2_.item;
};
_loc1.addSet = function(oItem)
{
   var _loc2_ = this.SetsRapidos.findFirstItem("ID",oItem.ID);
   if(_loc2_.index == -1)
   {
      this.SetsRapidos.push(oItem);
   }
   else
   {
      this.SetsRapidos.updateItem(_loc2_.index,oItem);
   }
};
_loc1.removeSet = function(nID)
{
   var _loc2_ = this.SetsRapidos.findFirstItem("ID",nID);
   if(_loc2_.index != -1)
   {
      this.SetsRapidos.removeItems(_loc2_.index,1);
   }
};
_loc1.dropItem = function(nID)
{
   var _loc3_ = this.Inventory.findFirstItem("ID",nID);
   var _loc2_ = _loc3_.item;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   _loc2_.isRemovedFromInventory = true;
   if(_loc2_.position == 1)
   {
      this.setWeaponItem();
   }
   this.Inventory.startNoEventDispatchsPeriod(dofus["\x12\x03"].DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
   this.Inventory.removeItems(_loc3_.index,1);
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.removeItemAt(_loc2_.position);
   }
};
_loc1.updateItemPosition = function(_loc2_, _loc3_)
{
   var _loc3_ = this.Inventory.findFirstItem("ID",_loc2_);
   var _loc2_ = _loc3_.item;
   if(_loc2_.position == 1)
   {
      this.setWeaponItem();
   }
   else if(_loc3_ == 1)
   {
      this.setWeaponItem(_loc2_);
   }
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.removeItemAt(_loc2_.position);
   }
   _loc2_.position = _loc3_;
   this.Inventory.startNoEventDispatchsPeriod(dofus["\x12\x03"].DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
   this.Inventory.removeItems(_loc3_.index,1);
   this.Inventory.push(_loc2_);
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.addItemAt(_loc2_.position,_loc2_);
   }
};
_loc1.updateItem = function(oNewItem)
{
   var _loc3_ = this.Inventory.findFirstItem("ID",oNewItem.ID);
   var _loc4_ = _loc3_.item;
   if(_loc3_.item.ID == oNewItem.ID && _loc3_.item.maxSkin != oNewItem.maxSkin)
   {
      if(!_loc3_.item.isLeavingItem && oNewItem.isLeavingItem)
      {
         this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_ASSOCIATE);
      }
      if(_loc3_.item.isLeavingItem && oNewItem.isLeavingItem)
      {
         this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_LEVEL_UP);
      }
   }
   if(_loc4_ != undefined && _loc4_.isEquiped)
   {
      this.InventoryByItemPositions.removeItemAt(_loc4_.position);
   }
   this.Inventory.updateItem(_loc3_.index,oNewItem);
   if(oNewItem.isEquiped)
   {
      this.InventoryByItemPositions.addItemAt(oNewItem.position,oNewItem);
   }
};
_loc1.addProperty("SpellsManager",_loc1.__get__SpellsManager,function()
{
}
);
_loc1.addProperty("Ogrine",_loc1.__get__ogrine,_loc1.__set__ogrine);
