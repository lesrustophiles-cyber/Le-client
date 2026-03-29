var _loc1 = dofus.aks.Items.prototype;
_loc1.setsRapidos = function(sData)
{
   var _loc10_ = sData.split("*");
   var _loc5_;
   var _loc3_;
   var _loc9_;
   var _loc7_;
   var _loc4_;
   var _loc6_;
   var _loc8_;
   for(var _loc16_ in _loc10_)
   {
      _loc5_ = _loc10_[_loc16_];
      if(_loc5_.length > 0)
      {
         _loc3_ = _loc5_.split("|");
         _loc9_ = _global.parseInt(_loc3_[0]);
         _loc7_ = _loc3_[1];
         _loc4_ = _global.parseInt(_loc3_[2]);
         _loc6_ = _loc3_[3];
         _loc8_ = {ID:_loc9_,name:_loc7_,icono:_loc4_,iconFile:dofus["\x12\x03"].SETS_RAPIDOS_ICONS_PATH + _loc4_ + ".swf",data:_loc6_};
         this.api.datacenter.Player.addSet(_loc8_);
      }
   }
};
_loc1.useItemQ = function(sData)
{
   if(!oEvent.item.canUse || !this.api.datacenter.Player.canUseObject)
   {
      return undefined;
   }
   this.api.network.send("Ot" + oEvent.item.ID);
};
_loc1.onAccessories = function(sExtraData)
{
   var _loc12_ = sExtraData.split("|");
   var _loc11_ = _loc12_[0];
   var _loc7_ = _loc12_[1].split(",");
   var _loc10_ = new Array();
   var _loc3_ = 0;
   var _loc6_;
   var _loc4_;
   var _loc8_;
   var _loc5_;
   var _loc9_;
   while(_loc3_ < _loc7_.length)
   {
      if(_loc7_[_loc3_].indexOf("~") != -1)
      {
         _loc5_ = _loc7_[_loc3_].split("~");
         _loc6_ = _global.parseInt(_loc5_[0],16);
         _loc8_ = _global.parseInt(_loc5_[1]);
         _loc4_ = _global.parseInt(_loc5_[2]) - 1;
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
      }
      else
      {
         _loc6_ = _global.parseInt(_loc7_[_loc3_],16);
         _loc8_;
         _loc4_;
      }
      if(!_global.isNaN(_loc6_))
      {
         _loc9_ = new dofus.datacenter["\x11"](_loc6_,_loc8_,_loc4_);
         _loc10_[_loc3_] = _loc9_;
      }
      _loc3_ += 1;
   }
   var _loc13_ = this.api.datacenter.Sprites.getItemAt(_loc11_);
   _loc13_.accessories = _loc10_;
   this.api.gfx.setForcedSpriteAnim(_loc11_,"static");
   if(_loc11_ == this.api.datacenter.Player.ID)
   {
      this.api.datacenter.Player.updateCloseCombat();
   }
};
_loc1.onAdd = function(_loc2_, _loc3_)
{
   var _loc8_;
   var _loc6_;
   var _loc5_;
   var _loc7_;
   var _loc4_;
   var _loc2_;
   var _loc3_;
   if(!_loc2_)
   {
      switch(_loc3_)
      {
         case "F":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("INVENTORY_FULL"),"ERROR_BOX",{name:"Full"});
            break;
         case "L":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("TOO_LOW_LEVEL_FOR_ITEM"),"ERROR_BOX",{name:"LowLevel"});
            break;
         case "A":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ALREADY_EQUIPED"),"ERROR_BOX",{name:"Already"});
      }
   }
   else
   {
      _loc8_ = _loc3_.split("*");
      _loc6_ = 0;
      while(_loc6_ < _loc8_.length)
      {
         _loc5_ = _loc8_[_loc6_];
         _loc7_ = _loc5_.charAt(0);
         _loc5_ = _loc5_.substr(1);
         switch(_loc7_)
         {
            case "G":
               break;
            case "O":
               _loc4_ = _loc5_.split(";");
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc3_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc4_[_loc2_]);
                  if(_loc3_ != undefined)
                  {
                     this.api.datacenter.Player.addItem(_loc3_);
                  }
                  _loc2_ += 1;
               }
               break;
            default:
               ank["\x1e\n\t"]["\x0b\x0b"].err("Ajout d\'un type obj inconnu");
         }
         _loc6_ += 1;
      }
   }
};
_loc1.use = function(_loc2_, _loc3_, _loc4_, _loc5_, _loc6_)
{
   this.aks.send("O" + (_loc5_ ? "u" : "U") + _loc2_ + (_loc3_ != undefined && !_global.isNaN(Number(_loc3_)) ? "|" + _loc3_ : "|") + (_loc4_ != undefined ? "|" + _loc4_ : "|") + (_loc6_ != undefined ? "|" + _loc6_ : ""),true);
};
