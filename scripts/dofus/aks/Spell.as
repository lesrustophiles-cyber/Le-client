var _loc1 = dofus.aks.Spells.prototype;
_loc1.onList2 = function(Packet)
{
   var _loc8_ = Packet.split(",");
   var _loc9_ = _loc8_[0];
   var _loc13_ = this.api.datacenter.Sprites.getItemAt(_loc9_);
   var _loc7_ = _loc8_[1];
   var _loc11_ = _loc8_[2];
   var _loc6_ = _loc8_[3];
   var _loc5_;
   var _loc12_;
   var _loc10_;
   var _loc2_;
   var _loc3_;
   var _loc4_;
   if(_loc9_ == this.api.datacenter.Player.ID)
   {
      _loc5_ = this.api.datacenter.Player.SpellsManager;
      _loc12_ = this.api.gfx.mapHandler.getCellData(_loc11_).spriteOnID;
      _loc10_ = new dofus.datacenter["\x0b\x17"](_loc7_,_loc12_);
      _loc5_.addLaunchedSpell(_loc10_);
      _loc10_.remainingTurn = _loc6_;
      _loc2_ = _loc5_._aSpellsDelay.length;
      while(true)
      {
         _loc2_ -= 1;
         if(_loc2_ < 0)
         {
            break;
         }
         _loc3_ = _loc5_._aSpellsDelay[_loc2_];
         _loc4_ = _loc3_.spell;
         if(_loc4_.ID == _loc7_)
         {
            _loc3_.remainingTurn = _loc6_;
         }
      }
   }
};
_loc1.ResetSpells = function(Packet)
{
   var _loc3_ = Packet.split(",");
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      if(_loc3_[_loc2_] != null)
      {
         this.api.datacenter.Player.removeSpell(_loc3_[_loc2_]);
      }
      _loc2_ = _loc2_ + 1;
   }
};
