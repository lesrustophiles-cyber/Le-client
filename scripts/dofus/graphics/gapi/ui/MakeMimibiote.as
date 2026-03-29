var _loc1 = _global.dofus["\r\x13"].gapi.ui.MakeMimibiote.prototype;
_loc1.canPutItem = function(_loc2_, _loc3_)
{
   if(!dofus["\x12\x03"].isItemSuperTypeSkinable(_loc2_.superType))
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ITEM_NOT_SKINABLE"),"ERROR_CHAT");
      return false;
   }
   if(_loc2_.hasCustomGfx() || _loc2_.skineable)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ITEM_ALREADY_SKINED"),"ERROR_CHAT");
      return false;
   }
   if(_loc2_.skineable)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ITEM_IS_LIVING_OBJECT"),"ERROR_CHAT");
      return false;
   }
   var _loc4_;
   if(_loc3_ == this._cgItemToEat)
   {
      _loc4_ = this._cgItemToAttach;
   }
   else
   {
      _loc4_ = this._cgItemToEat;
   }
   var _loc3_ = _loc4_.dataProvider[0];
   if(_loc3_ != undefined)
   {
      if(_loc3_.superType != _loc2_.superType)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ITEM_SHOULD_BE_SAME_TYPE"),"ERROR_CHAT");
         return false;
      }
      if(_loc3_.unicID == _loc2_.unicID)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ITEM_SAME_ID"),"ERROR_CHAT");
         return false;
      }
   }
   return true;
};
