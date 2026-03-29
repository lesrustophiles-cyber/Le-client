var _loc1 = ank.battlefield["\x1e\x12\x1b"].prototype;
_loc1.select = function(bSelected, nCellNum, nColor, sLayer, nAlpha)
{
   var _loc7_ = this._mcBattlefield.mapHandler.getCellData(nCellNum);
   if(sLayer == undefined)
   {
      sLayer = "default";
   }
   var _loc6_ = this._mcContainer.Select[sLayer];
   if(_loc6_ == undefined)
   {
      _loc6_ = this._mcContainer.Select.createEmptyMovieClip(sLayer,this._mcContainer.Select.getNextHighestDepth());
      _loc6_.inObjectClips = new Array();
   }
   var _loc12_;
   var _loc11_;
   var _loc9_;
   var _loc5_;
   var _loc10_;
   var _loc8_;
   var _loc15_;
   var _loc14_;
   if(_loc7_ != undefined && _loc7_.x != undefined)
   {
      _loc12_ = true;
      _loc11_ = "cell" + String(nCellNum);
      if(bSelected)
      {
         if(_loc12_)
         {
            _loc9_ = this._mcContainer.Object2["select" + nCellNum];
            if(_loc9_ == undefined)
            {
               _loc9_ = this._mcContainer.Object2.createEmptyMovieClip("select" + nCellNum,nCellNum * 100 + 6);
            }
            _loc9_._visible = !_global.BUILD_TACTICO;
            _loc5_ = _loc9_[sLayer];
            if(_loc5_ == undefined)
            {
               _loc5_ = _loc9_.attachMovie("s" + _loc7_.oGroundSlope,sLayer,_loc9_.getNextHighestDepth());
            }
            _loc10_ = this._mcContainer.Object2["selection" + nCellNum];
            if(_loc10_ == undefined)
            {
               _loc10_ = this._mcContainer.Object2.createEmptyMovieClip("selection" + nCellNum,nCellNum * 100 + 7);
            }
            _loc10_._visible = _global.BUILD_TACTICO;
            _loc8_ = _loc10_[sLayer];
            if(_loc8_ == undefined)
            {
               _loc8_ = _loc10_.attachMovie("s1",sLayer,_loc10_.getNextHighestDepth());
            }
            _loc8_._x = _loc7_.x;
            _loc8_._y = _loc7_.y;
            _loc15_ = new Color(_loc8_);
            _loc15_.setRGB(Number(nColor));
            _loc8_._alpha = nAlpha == undefined ? 100 : nAlpha;
            _loc6_.inObjectClips.push(_loc5_);
            _loc6_.inObjectClips.push(_loc8_);
         }
         else
         {
            _loc5_ = _loc6_.attachMovie("s" + _loc7_.oGroundSlope,_loc11_,nCellNum * 100);
         }
         _loc5_._x = _loc7_.x;
         _loc5_._y = _loc7_.y;
         _loc14_ = new Color(_loc5_);
         _loc14_.setRGB(Number(nColor));
         _loc5_._alpha = nAlpha == undefined ? 100 : nAlpha;
      }
      else if(_loc12_)
      {
         this._mcContainer.Object2["select" + nCellNum][sLayer].unloadMovie();
         this._mcContainer.Object2["select" + nCellNum][sLayer].removeMovieClip();
         this._mcContainer.Object2["selection" + nCellNum][sLayer].unloadMovie();
         this._mcContainer.Object2["selection" + nCellNum][sLayer].removeMovieClip();
      }
      else
      {
         _loc6_[_loc11_].unloadMovie();
         _loc6_[_loc11_].removeMovieClip();
      }
   }
};
