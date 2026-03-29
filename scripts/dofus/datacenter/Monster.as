var _loc1 = _global.dofus.datacenter["\n\x01"].prototype;
_loc1.__set__resistances = function(_loc2_)
{
   this._resistances = _loc2_;
};
_loc1.__get__resistances = function()
{
   var _loc4_ = this.api.lang.getMonstersText(this._nNameID)["g" + this._nPowerLevel].r;
   var _loc3_ = new Array();
   var _loc2_;
   if(_loc4_)
   {
      _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         _loc3_[_loc2_] = _loc4_[_loc2_];
         _loc2_ += 1;
      }
      _loc3_[0] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.NEUTRAL_ELEMENT_PERCENT);
      _loc3_[1] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.EARTH_ELEMENT_PERCENT);
      _loc3_[2] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.FIRE_ELEMENT_PERCENT);
      _loc3_[3] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.WATER_ELEMENT_PERCENT);
      _loc3_[4] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.AIR_ELEMENT_PERCENT);
      _loc3_[5] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.DODGE_PA_LOST_PROBABILITY);
      _loc3_[6] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.DODGE_PM_LOST_PROBABILITY);
   }
   else
   {
      _loc3_[0] = this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.NEUTRAL_ELEMENT_PERCENT);
      _loc3_[1] = this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.EARTH_ELEMENT_PERCENT);
      _loc3_[2] = this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.FIRE_ELEMENT_PERCENT);
      _loc3_[3] = this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.WATER_ELEMENT_PERCENT);
      _loc3_[4] = this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.AIR_ELEMENT_PERCENT);
      _loc3_[5] = this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.DODGE_PA_LOST_PROBABILITY);
      _loc3_[6] = this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.DODGE_PM_LOST_PROBABILITY);
   }
   return _loc3_;
};
_loc1.onResistancesUpdated = function()
{
   this.dispatchEvent({type:"resistancesChanged"});
};
_loc1.addProperty("resistances",_loc1.__get__resistances,_loc1.__set__resistances);
