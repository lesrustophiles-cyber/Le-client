var _loc1 = _global.dofus.datacenter.Creature.prototype;
_loc1.__set__resistances = function(_loc2_)
{
   this._resistances = _loc2_;
};
_loc1.__get__resistances = function()
{
   if(this._resistances)
   {
      return this._resistances;
   }
   var _loc2_ = this.api.lang.getMonstersText(this._nNameID)["g" + this._nPowerLevel].r;
   _loc2_[0] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.NEUTRAL_ELEMENT_PERCENT);
   _loc2_[1] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.EARTH_ELEMENT_PERCENT);
   _loc2_[2] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.FIRE_ELEMENT_PERCENT);
   _loc2_[3] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.WATER_ELEMENT_PERCENT);
   _loc2_[4] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.AIR_ELEMENT_PERCENT);
   _loc2_[5] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.DODGE_PA_LOST_PROBABILITY);
   _loc2_[6] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\x07"].CharacteristicsManager.DODGE_PM_LOST_PROBABILITY);
   return _loc2_;
};
_loc1.onResistancesUpdated = function()
{
   this.api.kernel.showMessage(undefined,"TEST7","INFO_CHAT");
   this.dispatchEvent({type:"resistancesChanged"});
};
_loc1.addProperty("resistances",_loc1.__get__resistances,_loc1.__set__resistances);
