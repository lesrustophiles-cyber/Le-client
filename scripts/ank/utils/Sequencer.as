var _loc1 = ank["\x1e\n\t"]["\x1e\x12\x16"].prototype;
_loc1.addAction = function(_loc2_, bWaitEnd, mRefObject, fFunction, aParams, nDuration)
{
   var _loc2_ = new Object();
   _loc7.debugId = _loc2_;
   _loc2_.id = this.getActionIndex();
   _loc2_.waitEnd = bWaitEnd;
   _loc2_.object = mRefObject;
   _loc2_.fn = fFunction;
   _loc2_.parameters = aParams;
   _loc2_.duration = nDuration;
   this._aActions.push(_loc2_);
};
