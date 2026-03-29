var _loc1 = ank.battlefield["\x1e\n\x02"].prototype;
_loc1.addEffect = function(sprite, oVisualEffect, nCellNum, displayType, targetSprite, bVisible, bMax, nTalla)
{
   if(displayType < 10)
   {
      return undefined;
   }
   var _loc7_ = !oVisualEffect.bInFrontOfSprite ? -1 : 1;
   var _loc3_ = this.getNextIndex() + ank.battlefield["\x12\x03"].MAX_SPRITES_ON_CELL / 2 + 1;
   this._mcContainer["eff" + _loc3_].removeMovieClip();
   this._mcContainer.createEmptyMovieClip("eff" + _loc3_,!bMax ? nCellNum * 100 + 50 + _loc7_ * _loc3_ : this._mcContainer.getNextHighestDepth());
   var _loc2_ = this._mcContainer["eff" + _loc3_];
   _loc2_.createEmptyMovieClip("mc",10);
   if(nTalla != undefined)
   {
      _loc2_.mc._xscale = _loc2_.mc._yscale = Number(nTalla);
   }
   _loc2_._visible = bVisible != undefined ? bVisible : true;
   var _loc5_ = new MovieClipLoader();
   _loc5_.addListener(this);
   _loc2_.sprite = sprite;
   _loc2_.targetSprite = targetSprite;
   _loc2_.cellNum = nCellNum;
   _loc2_.displayType = displayType;
   _loc2_.level = oVisualEffect.level;
   _loc2_.params = oVisualEffect.params;
   var _loc6_;
   if(oVisualEffect.bTryToBypassContainerColor == true)
   {
      _loc6_ = new Color(_loc2_);
      _loc6_.setTransform({ra:200,rb:0,ga:200,gb:0,ba:200,bb:0});
   }
   _loc5_.loadClip(oVisualEffect.file,_loc2_.mc);
   ank["\x1e\n\t"]["\x1e\x0b\x04"].setTimer(_loc2_,"battlefield",_loc2_,_loc2_.removeMovieClip,ank.battlefield["\x12\x03"].VISUAL_EFFECT_MAX_TIMER);
};
