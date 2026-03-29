var _loc1 = _global.dofus["\r\x13"].gapi.ui.PlayerShop.prototype;
_loc1.click = function(_loc2_)
{
   switch(_loc2_.target._name)
   {
      case "_ldrArtwork":
         this.api.kernel.GameManager.showPlayerPopupMenu(undefined,this._oData.name);
         break;
      case "_btnViewPreviousMerchant":
         this.switchMerchant2(true);
         break;
      case "_btnViewNextMerchant":
         this.switchMerchant2(false);
         break;
      case "_btnBuy":
         if(this._oSelectedItem.Quantity > 1)
         {
            this.askQuantity(this._oSelectedItem.Quantity,this._oSelectedItem.price);
         }
         else
         {
            this.validateBuy(1);
         }
         break;
      case "_btnClose":
         this.callClose();
   }
};
_loc1.switchMerchant2 = function(_loc2)
{
   var _loc2_ = this._winInventory2.title;
   this.api.network.send("XM" + _loc2_ + ";" + _loc2);
};
_global.dofus["\r\x13"].gapi.ui.PlayerShop.CLASS_NAME = "PlayerShop";
