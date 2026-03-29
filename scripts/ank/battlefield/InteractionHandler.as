var _loc1 = ank.battlefield["\f\x11"].prototype;
_loc1.setEnabled = function(nState)
{
   switch(nState)
   {
      case ank.battlefield["\x12\x03"].INTERACTION_NONE:
         this.setEnabledOffAllExtraProto();
         this.setEnabledProtoAll(ank.battlefield.mc["\x13\n"].prototype,false);
         this.setEnabledProtoAll(ank.battlefield.mc["\f\x10"].prototype,false);
         this.setEnabledProtoAll(ank.battlefield.mc["\x1e\x0e\x12"].prototype,false);
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_CELL_NONE:
         this.setEnabledOffAllExtraProto();
         this.setEnabledProtoAll(ank.battlefield.mc["\x13\n"].prototype,false);
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_CELL_RELEASE:
         this.setEnabledProtoRelease(ank.battlefield.mc["\x13\n"].prototype,true);
         this.setEnabledProtoOutOver(ank.battlefield.mc["\x13\n"].prototype,false);
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_CELL_OVER_OUT:
         this.setEnabledProtoRelease(ank.battlefield.mc["\x13\n"].prototype,false);
         this.setEnabledProtoOutOver(ank.battlefield.mc["\x13\n"].prototype,true);
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_CELL_RELEASE_OVER_OUT:
         this.setEnabledProtoAll(ank.battlefield.mc["\x13\n"].prototype,true);
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_OBJECT_NONE:
         this.setEnabledProtoRelease(ank.battlefield.mc["\f\x10"].prototype,false);
         this.setEnabledProtoOutOver(ank.battlefield.mc["\f\x10"].prototype,false);
         if(this._bIs8)
         {
            this.setEnabledObject2Release(false);
            this.setEnabledObject2OutOver(false);
         }
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_OBJECT_RELEASE:
         this.setEnabledProtoRelease(ank.battlefield.mc["\f\x10"].prototype,true);
         this.setEnabledProtoOutOver(ank.battlefield.mc["\f\x10"].prototype,false);
         if(this._bIs8)
         {
            this.setEnabledObject2Release(true);
            this.setEnabledObject2OutOver(false);
         }
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_OBJECT_OVER_OUT:
         this.setEnabledProtoRelease(ank.battlefield.mc["\f\x10"].prototype,false);
         this.setEnabledProtoOutOver(ank.battlefield.mc["\f\x10"].prototype,true);
         if(this._bIs8)
         {
            this.setEnabledObject2Release(false);
            this.setEnabledObject2OutOver(true);
         }
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_OBJECT_RELEASE_OVER_OUT:
         this.setEnabledProtoAll(ank.battlefield.mc["\f\x10"].prototype,true);
         if(this._bIs8)
         {
            this.setEnabledObject2All(true);
         }
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_SPRITE_NONE:
         this.setEnabledProtoRelease(ank.battlefield.mc["\x1e\x0e\x12"].prototype,false);
         this.setEnabledProtoOutOver(ank.battlefield.mc["\x1e\x0e\x12"].prototype,false);
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_SPRITE_RELEASE:
         this.setEnabledProtoRelease(ank.battlefield.mc["\x1e\x0e\x12"].prototype,true);
         this.setEnabledProtoOutOver(ank.battlefield.mc["\x1e\x0e\x12"].prototype,false);
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_SPRITE_OVER_OUT:
         this.setEnabledProtoRelease(ank.battlefield.mc["\x1e\x0e\x12"].prototype,false);
         this.setEnabledProtoOutOver(ank.battlefield.mc["\x1e\x0e\x12"].prototype,true);
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_SPRITE_RELEASE_OVER_OUT:
         this.setEnabledProtoAll(ank.battlefield.mc["\x1e\x0e\x12"].prototype,true);
   }
};
_loc1.aplicarEstadoCelda = function(nCellNum)
{
   if(this._states[nCellNum] != undefined)
   {
      this.setEnabledCell(nCellNum,this._states[nCellNum]);
   }
};
_loc1.setEnabledCell = function(nCellNum, nState)
{
   var _loc2_ = this._mcContainer["cell" + nCellNum];
   if(_loc2_ == undefined)
   {
      ank["\x1e\n\t"]["\x0b\x0b"].err("[setEnabledCell] Cell inexistante");
      return undefined;
   }
   this._states[nCellNum] = nState;
   this._extraProto[_loc2_._name] = _loc2_;
   switch(nState)
   {
      case ank.battlefield["\x12\x03"].INTERACTION_NONE:
         this.setEnabledProtoAll(_loc2_,false);
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_CELL_RELEASE:
         this.setEnabledProtoRelease(_loc2_,true);
         this.setEnabledProtoOutOver(_loc2_,false);
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_CELL_OVER_OUT:
         this.setEnabledProtoRelease(_loc2_,false);
         this.setEnabledProtoOutOver(_loc2_,true);
         break;
      case ank.battlefield["\x12\x03"].INTERACTION_CELL_RELEASE_OVER_OUT:
         this.setEnabledProtoAll(_loc2_,true);
   }
};
_loc1.setEnabledOffAllExtraProto = function(Void)
{
   var _loc2_;
   for(var _loc3_ in this._extraProto)
   {
      _loc2_ = this._extraProto[_loc3_];
      this.setEnabledProtoAll(_loc2_,false);
   }
   this._extraProto = new Array();
};
_loc1.setEnabledProtoAll = function(proto, bool)
{
   if(bool)
   {
      proto.onRelease = proto._release;
      proto.onRollOver = proto._rollOver;
      proto.onRollOut = proto.onReleaseOutside = proto._rollOut;
   }
   else
   {
      delete proto.onRelease;
      delete proto.onRollOver;
      delete proto.onRollOut;
      delete proto.onReleaseOutside;
   }
};
_loc1.setEnabledProtoRelease = function(proto, bool)
{
   if(bool)
   {
      proto.onRelease = proto._release;
   }
   else
   {
      delete proto.onRelease;
   }
};
_loc1.setEnabledProtoOutOver = function(proto, bool)
{
   if(bool)
   {
      proto.onRollOver = proto._rollOver;
      proto.onRollOut = proto._rollOut;
      proto.onRollOut = proto.onReleaseOutside = proto._rollOut;
   }
   else
   {
      delete proto.onRollOver;
      delete proto.onRollOut;
      delete proto.onReleaseOutside;
   }
};
_loc1.setEnabledObject2All = function(bool)
{
   var _loc3_ = this._oDatacenter.Map.data;
   var _loc2_;
   for(var _loc5_ in _loc3_)
   {
      _loc2_ = _loc3_[_loc5_].mcObject2;
      if(_loc3_[_loc5_].layerObject2Interactive)
      {
         if(_loc2_ != undefined)
         {
            if(bool)
            {
               _loc2_.onRelease = _loc2_._release;
               _loc2_.onRollOver = _loc2_._rollOver;
               _loc2_.onRollOut = _loc2_.onReleaseOutside = _loc2_._rollOut;
            }
            else
            {
               delete _loc2_.onRelease;
               delete _loc2_.onRollOver;
               delete _loc2_.onRollOut;
               delete _loc2_.onReleaseOutside;
            }
         }
      }
   }
};
_loc1.setEnabledObject2Release = function(bool)
{
   var _loc3_ = this._oDatacenter.Map.data;
   var _loc2_;
   for(var _loc5_ in _loc3_)
   {
      _loc2_ = _loc3_[_loc5_].mcObject2;
      if(_loc3_[_loc5_].layerObject2Interactive)
      {
         if(_loc2_ != undefined)
         {
            if(bool)
            {
               _loc2_.onRelease = _loc2_._release;
            }
            else
            {
               delete _loc2_.onRelease;
            }
         }
      }
   }
};
_loc1.setEnabledObject2OutOver = function(bool)
{
   var _loc3_ = this._oDatacenter.Map.data;
   var _loc2_;
   for(var _loc5_ in _loc3_)
   {
      _loc2_ = _loc3_[_loc5_].mcObject2;
      if(_loc3_[_loc5_].layerObject2Interactive)
      {
         if(_loc2_ != undefined)
         {
            if(bool)
            {
               _loc2_.onRollOver = _loc2_._rollOver;
               _loc2_.onRollOut = _loc2_._rollOut;
               _loc2_.onRollOut = _loc2_.onReleaseOutside = _loc2_._rollOut;
            }
            else
            {
               delete _loc2_.onRollOver;
               delete _loc2_.onRollOut;
               delete _loc2_.onReleaseOutside;
            }
         }
      }
   }
};
_loc1._states = new Object();
