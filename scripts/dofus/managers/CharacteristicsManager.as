var _loc1 = _global.dofus["\x0b\x07"].CharacteristicsManager.prototype;
_loc1.isResistance = function(_loc2_)
{
   switch(_loc2_)
   {
      case _loc1.NEUTRAL_ELEMENT_PERCENT:
      case _loc1.EARTH_ELEMENT_PERCENT:
      case _loc1.FIRE_ELEMENT_PERCENT:
      case _loc1.WATER_ELEMENT_PERCENT:
      case _loc1.AIR_ELEMENT_PERCENT:
      case _loc1.DODGE_PA_LOST_PROBABILITY:
      case _loc1.DODGE_PM_LOST_PROBABILITY:
         return true;
      default:
         return false;
   }
};
_loc1.initialize = function(oSprite, _loc4_)
{
   super.initialize(_loc4_);
   this._oSprite = oSprite;
   this._aEffects = new Array();
   this._aModerators = new Array(20);
   var _loc3_ = 0;
   while(_loc3_ < this._aModerators.length)
   {
      this._aModerators[_loc3_] = 0;
      _loc3_ += 1;
   }
   this.init0();
};
_loc1.getModeratorValue = function(_loc2_)
{
   _loc2_ = Number(_loc2_);
   var _loc3_ = Number(this._aModerators[_loc2_]);
   if(_global.isNaN(_loc3_))
   {
      return 0;
   }
   return _loc3_;
};
_loc1.setModeratorValue = function(_loc2_, _loc3_)
{
   if(this._aModerators[_loc2_] == undefined)
   {
      this._aModerators[_loc2_] = 0;
   }
   this._aModerators[_loc2_] += _loc3_;
   if(this.isResistance(_loc2_))
   {
      this._oSprite.onResistancesUpdated();
   }
};
_loc1.onEffectStart = function(_loc2_)
{
   var _loc2_ = _loc2_.characteristic;
   var _loc4_;
   switch(_loc2_)
   {
      case dofus["\x0b\x07"].CharacteristicsManager.GFX:
         if(this._oSprite.mount != undefined)
         {
            this._oSprite.mount.chevauchorGfxID = _loc2_.param2;
         }
         else
         {
            this._oSprite.gfxFile = dofus["\x12\x03"].CLIPS_PERSOS_PATH + _loc2_.param2 + ".swf";
         }
         this._oSprite.mc.draw();
         break;
      case dofus["\x0b\x07"].CharacteristicsManager.INVISIBILITY:
         if(this._oSprite.id == this.api.datacenter.Player.ID)
         {
            this._oSprite.mc.setAlpha(40);
         }
         else
         {
            this._oSprite.mc.setVisible(false);
         }
         break;
      default:
         _loc4_ = Number(_loc2_.getParamWithOperator(1));
         this.setModeratorValue(_loc2_,_loc4_);
   }
};
_loc1.onEffectEnd = function(_loc2_)
{
   var _loc4_;
   var _loc3_;
   switch(_loc2_.characteristic)
   {
      case dofus["\x0b\x07"].CharacteristicsManager.GFX:
         if(this._oSprite.mount != undefined)
         {
            this._oSprite.mount.chevauchorGfxID = _loc2_.param1;
         }
         else
         {
            this._oSprite.gfxFile = dofus["\x12\x03"].CLIPS_PERSOS_PATH + _loc2_.param1 + ".swf";
         }
         this._oSprite.mc.draw();
         break;
      case dofus["\x0b\x07"].CharacteristicsManager.INVISIBILITY:
         if(this._oSprite.id == this.api.datacenter.Player.ID)
         {
            this._oSprite.mc.setAlpha(100);
         }
         else
         {
            this._oSprite.mc.setVisible(true);
         }
         break;
      default:
         _loc4_ = Number(_loc2_.characteristic);
         _loc3_ = - Number(_loc2_.getParamWithOperator(1));
         this.setModeratorValue(_loc4_,_loc3_);
   }
};
