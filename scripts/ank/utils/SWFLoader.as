var _loc1 = ank["\x1e\n\t"]["\x1e\x0b\x17"].prototype;
loc1.onLoadComplete = function(mc)
{
};
_loc1.onLoadError = function(mc)
{
   var _loc2_;
   if(this._aArgs.ornamento)
   {
      _loc2_ = mc._parent._parent._parent;
      _loc2_._visible = true;
   }
};
_loc1.onLoadStart = function(mc)
{
   var _loc2_;
   if(this._aArgs.ornamento)
   {
      _loc2_ = mc._parent._parent._parent;
      _loc2_._visible = false;
   }
};
_loc1.onLoadInit = function(mc)
{
   var _loc5_;
   var _loc18_;
   var _loc17_;
   var _loc16_;
   var _loc15_;
   var _loc14_;
   var _loc10_;
   var _loc12_;
   var _loc9_;
   var _loc22_;
   var _loc19_;
   var _loc13_;
   var _loc4_;
   var _loc6_;
   var _loc8_;
   var _loc3_;
   var _loc20_;
   var _loc21_;
   if(this._aArgs.ornamento)
   {
      _loc5_ = mc._parent._parent._parent;
      if(mc.attachMovie("ornament_" + this._frameStart,"_ornamento",30))
      {
         mc._ornamento._y -= this._aArgs.medio;
         _loc5_._mcTxtBackground._y -= this._aArgs.medio;
         _loc18_ = 0.75;
         _loc17_ = 40;
         _loc16_ = 160;
         _loc15_ = _global.parseInt(this._aArgs.alto);
         _loc14_ = _global.parseInt(this._aArgs.ancho);
         _loc10_ = _loc14_ / _loc16_;
         _loc12_ = _loc15_ / _loc17_;
         _loc9_ = 1;
         if(_loc10_ > _loc18_ || _loc12_ > _loc18_)
         {
            _loc22_ = _loc16_ / _loc14_;
            _loc19_ = _loc17_ / _loc15_;
            _loc9_ = _loc22_;
            if(_loc19_ < _loc9_)
            {
               _loc9_ = _loc19_;
            }
         }
         _loc13_ = 0;
         if(_loc10_ > _loc13_)
         {
            _loc13_ = _loc10_;
         }
         _loc12_ /= _loc10_;
         _loc4_ = mc._ornamento;
         _loc6_ = 80 + _loc4_.bg._x;
         _loc8_ = _loc4_.bg._y;
         _loc3_ = [_loc4_.bg,_loc4_.picto,_loc4_.top,_loc4_.left,_loc4_.right,_loc4_.bottom];
         for(var _loc11_ in _loc3_)
         {
            _loc3_[_loc11_]._x -= _loc6_;
            _loc3_[_loc11_]._y -= _loc8_;
         }
         _loc4_.bg._yscale = _loc12_ * 100;
         _loc4_.bottom._y *= _loc12_;
         _loc4_._xscale = _loc4_._yscale = _loc13_ * 100;
         _loc5_._xscale = _loc5_._yscale = _loc9_ * 100;
         _loc20_ = _loc5_.getBounds(_loc5_._parent._parent);
         _loc21_ = _loc20_.yMax + 40;
         _loc5_._y -= _loc21_;
      }
      _loc5_._visible = true;
   }
   else
   {
      if(this._frameStart != undefined)
      {
         mc.gotoAndStop(this._frameStart);
      }
      mc._yscale = 125;
      mc._xscale = 125;
   }
   this.broadcastMessage("onLoadInit",mc,this._aArgs);
};
