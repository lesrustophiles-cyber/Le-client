var _loc1 = _global.dofus["\r\x13"].gapi.ui.BigStoreBuy.prototype;
_loc1.setItem = function(_loc2_)
{
   var _loc3_ = this._oData.inventory;
   var _loc2_;
   if(this._oData.inventory.length > 0)
   {
      _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].unicID == _loc2_)
         {
            if(this._lstItems.selectedIndex != _loc2_)
            {
               this._lstItems.selectedIndex = _loc2_;
               this._lstItems.setVPosition(_loc2_);
            }
            break;
         }
         _loc2_ += 1;
      }
      this.updateItem(new dofus.datacenter["\f\x0b"](0,_loc2_),true);
   }
   else
   {
      this._lstItems.removeAll();
   }
};
_loc1.modelChanged = function(oEvent)
{
   var _loc2_ = this._oData.inventory;
   _loc2_.bubbleSortOn("level",Array.DESCENDING);
   _loc2_.reverse();
   if(_loc2_.length > 0)
   {
      this._lstItems.dataProvider = _loc2_;
   }
   else
   {
      this._lstItems.dataProvider = null;
      this._lstItems.removeAll();
   }
   if(_loc2_ != 0 && _loc2_ != undefined)
   {
      this._lblItemsCount.text = _loc2_.length + " " + ank["\x1e\n\t"]["\x1e\x16\x1a"].combine(this.api.lang.getText("OBJECTS"),"m",_loc2_.length < 2);
   }
   else
   {
      this._lblItemsCount.text = this.api.lang.getText("NO_BIGSTORE_RESULT");
   }
};
_loc1.refreshItemTypeList = function()
{
   this._lstItems.removeAll();
};
_loc1.setType = function(nType)
{
   var _loc3_ = this._oData.types;
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      if(_loc3_[_loc2_] == nType)
      {
         this._cbTypes.selectedIndex = _loc2_;
         return undefined;
      }
      _loc2_ += 1;
   }
};
_loc1.updateType = function(_loc2_)
{
   this._lstItems.selectedIndex = -1;
   this._lstItems.splice(0);
   this.updateItem(undefined,true);
   this.showHelpSelectItem(true);
   this.api.network.Exchange.bigStoreType(_loc2_);
};
