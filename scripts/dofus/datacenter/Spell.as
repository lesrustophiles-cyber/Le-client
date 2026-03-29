var _loc1 = dofus.datacenter["\x1e\x0f\x02"].prototype;
_loc1.__set__position = function(nPosition)
{
   this._nPosition = nPosition;
};
_loc1.__get__position = function()
{
   return this._nPosition;
};
_loc1.initialize = function(nID, nLevel, sCompressedPosition)
{
   this.api = _global.API;
   this._nID = nID;
   this._nLevel = nLevel;
   this._nPosition = ank["\x1e\n\t"]["\x12\r"].decode64(sCompressedPosition);
   if(this._nPosition > 63 || this._nPosition < 1)
   {
      this._nPosition = null;
   }
   this._oSpellText = this.api.lang.getSpellText(nID);
   var _loc8_ = this.getSpellLevelText(15);
   var _loc5_ = _loc8_.split("");
   this._aEffectZones = new Array();
   var _loc3_ = 0;
   while(_loc3_ < _loc5_.length)
   {
      this._aEffectZones.push({shape:_loc5_[_loc3_],size:ank["\x1e\n\t"]["\x12\r"].decode64(_loc5_[_loc3_ + 1])});
      _loc3_ += 2;
   }
   this._bSummonSpell = this.searchIfSummon(this.getSpellLevelText(0)) || this.searchIfSummon(this.getSpellLevelText(1));
   this._nMaxLevel = 1;
   var _loc4_ = 1;
   while(_loc4_ <= dofus["\x12\x03"].SPELL_BOOST_MAX_LEVEL)
   {
      if(this._oSpellText["l" + _loc4_] == undefined)
      {
         break;
      }
      this._nMaxLevel = _loc4_;
      _loc4_ = _loc4_ + 1;
   }
   this._aRequiredStates = this.getSpellLevelText(16);
   this._aForbiddenStates = this.getSpellLevelText(17);
   this._minPlayerLevel = this.normalMinPlayerLevel;
};
