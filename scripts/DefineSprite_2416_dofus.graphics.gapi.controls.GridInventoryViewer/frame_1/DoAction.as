var _loc1 = dofus["\r\x13"].gapi.controls.GridInventoryViewer.prototype;
_loc1.showOneItem = function(nUnicID)
{
   var _loc2_ = 0;
   this.api.kernel.showMessage(undefined,"Selection2 = " + nUnicID.rarity.toString(),"INFO_CHAT");
   while(true)
   {
      _loc2_ += 1;
      if(_loc2_ >= this._cgGrid.dataProvider.length)
      {
         break;
      }
      if(nUnicID == this._cgGrid.dataProvider[_loc2_].unicID)
      {
         this._cgGrid.setVPosition(_loc2_ / this._cgGrid.visibleColumnCount);
         this._cgGrid.selectedIndex = _loc2_;
         return true;
      }
   }
   return false;
};
_loc1.selectItem = function(oEvent)
{
   if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && oEvent.target.contentData != undefined)
   {
      this.api.kernel.GameManager.insertItemInChat(oEvent.target.contentData);
      return undefined;
   }
   this.dispatchEvent({type:"selectedItem",item:oEvent.target.contentData});
};
ASSetPropFlags(_loc1,null,1);
dofus["\r\x13"].gapi.controls.GridInventoryViewer.CLASS_NAME = "GridInventoryViewer";
_loc1._bShowKamas = true;
