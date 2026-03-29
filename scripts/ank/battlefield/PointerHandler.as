var _loc1 = ank.battlefield["\x1e\x16\r"].prototype;
_loc1.hide = function(Void)
{
   this._mcZones.removeMovieClip();
   this._mcZones = this._mcContainer.createEmptyMovieClip("zones",2);
   this._mcZones.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["Zone/Pointers"];
   var _loc3_ = this._mcBattlefield.mapHandler.getCellsData();
   for(var _loc4_ in _loc3_)
   {
      this._mcBattlefield._mcMainContainer.ExternalContainer.Object2["pointer" + _loc4_].removeMovieClip();
   }
};
_loc1.addShape = function(sShape, mSize, nColor, nCellNumRef)
{
   this._aShapes.push({shape:sShape,size:mSize,col:nColor,cellNumRef:nCellNumRef});
};
_loc1.draw = function(nCellNum)
{
   var _loc4_ = this._aShapes;
   if(_loc4_.length == 0)
   {
      return undefined;
   }
   this.hide();
   var _loc3_ = 0;
   var _loc9_;
   var _loc8_;
   var _loc7_;
   var _loc6_;
   var _loc23_;
   var _loc22_;
   var _loc12_;
   var _loc20_;
   var _loc13_;
   var _loc15_;
   var _loc18_;
   var _loc17_;
   var _loc10_;
   var _loc19_;
   var _loc16_;
   var _loc11_;
   var _loc14_;
   while(_loc3_ < _loc4_.length)
   {
      this._mcZones.__proto__ = MovieClip.prototype;
      _loc9_ = this._mcZones.attachClassMovie(ank.battlefield.mc.Zone,"zone" + _loc3_,10 * _loc3_,[this._mcBattlefield.mapHandler]);
      _loc8_ = new Object();
      _loc7_ = 0;
      _loc6_ = 0;
      _loc23_ = _loc4_[_loc3_].col;
      switch(_loc4_[_loc3_].shape)
      {
         case "P":
            _loc9_.drawCircle(0,_loc4_[_loc3_].col,nCellNum);
            _loc8_[nCellNum] = true;
            break;
         case "C":
            if(typeof _loc4_[_loc3_].size == "number")
            {
               _loc6_ = _loc4_[_loc3_].size;
               _loc9_.drawCircle(_loc4_[_loc3_].size,_loc4_[_loc3_].col,nCellNum);
            }
            else if(_loc4_[_loc3_].size[0] == 0 && !_global.isNaN(Number(_loc4_[_loc3_].size[1])))
            {
               _loc6_ = Number(_loc4_[_loc3_].size[1]);
               _loc9_.drawCircle(Number(_loc4_[_loc3_].size[1]),_loc4_[_loc3_].col,nCellNum);
            }
            else
            {
               _loc22_ = 0;
               if(_loc4_[_loc3_].size[0] > 0)
               {
                  _loc22_ = -1;
               }
               _loc7_ = Number(_loc4_[_loc3_].size[0]);
               _loc6_ = Number(_loc4_[_loc3_].size[1]);
               _loc9_.drawRing(_loc4_[_loc3_].size[0] + _loc22_,_loc4_[_loc3_].size[1],_loc4_[_loc3_].col,nCellNum);
            }
            _loc12_ = _loc7_;
            while(_loc12_ <= _loc6_)
            {
               ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCeldasPorDistancia(this._mcBattlefield.mapHandler,nCellNum,_loc12_,_loc8_);
               _loc12_ = _loc12_ + 1;
            }
            break;
         case "D":
            _loc20_ = -1;
            _loc13_ = -1;
            if(typeof _loc4_[_loc3_].size == "number")
            {
               _loc13_ = Number(_loc4_[_loc3_].size);
               _loc20_ = _loc13_ % 2 != 0 ? 0 : 1;
            }
            else
            {
               _loc20_ = Number(_loc4_[_loc3_].size[1]);
               _loc13_ = Number(_loc4_[_loc3_].size[0]);
            }
            _loc7_ = _loc20_;
            _loc6_ = _loc13_;
            _loc12_ = _loc7_;
            while(_loc12_ < _loc6_)
            {
               _loc9_.drawRing(_loc12_ + 1,_loc12_,_loc4_[_loc3_].col,nCellNum);
               _loc12_ += 2;
            }
            _loc12_ = _loc7_;
            while(_loc12_ < _loc6_)
            {
               ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCeldasPorDistanciaAnillo(this._mcBattlefield.mapHandler,nCellNum,_loc12_ + 1,_loc7_,_loc8_);
               _loc12_ += 2;
            }
            break;
         case "X":
            if(typeof _loc4_[_loc3_].size == "number")
            {
               _loc6_ = _loc4_[_loc3_].size;
               _loc9_.drawCross(_loc4_[_loc3_].size,_loc4_[_loc3_].col,nCellNum);
            }
            else
            {
               _loc7_ = Number(_loc4_[_loc3_].size[0]);
               _loc6_ = Number(_loc4_[_loc3_].size[1]);
               _loc15_ = this._mcBattlefield.mapHandler;
               _loc18_ = _loc15_.getWidth();
               _loc17_ = ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(_loc15_,nCellNum);
               _loc10_ = nCellNum - _loc18_ * _loc4_[_loc3_].size[0];
               if(ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(_loc15_,_loc10_).y == _loc17_.y)
               {
                  _loc9_.drawLine(_loc4_[_loc3_].size[1] - _loc4_[_loc3_].size[0],_loc4_[_loc3_].col,_loc10_,nCellNum,true);
               }
               _loc10_ = nCellNum - (_loc18_ - 1) * _loc4_[_loc3_].size[0];
               if(ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(_loc15_,_loc10_).x == _loc17_.x)
               {
                  _loc9_.drawLine(_loc4_[_loc3_].size[1] - _loc4_[_loc3_].size[0],_loc4_[_loc3_].col,_loc10_,nCellNum,true);
               }
               _loc10_ = nCellNum + _loc18_ * _loc4_[_loc3_].size[0];
               if(ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(_loc15_,_loc10_).y == _loc17_.y)
               {
                  _loc9_.drawLine(_loc4_[_loc3_].size[1] - _loc4_[_loc3_].size[0],_loc4_[_loc3_].col,_loc10_,nCellNum,true);
               }
               _loc10_ = nCellNum + (_loc18_ - 1) * _loc4_[_loc3_].size[0];
               if(ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(_loc15_,_loc10_).x == _loc17_.x)
               {
                  _loc9_.drawLine(_loc4_[_loc3_].size[1] - _loc4_[_loc3_].size[0],_loc4_[_loc3_].col,_loc10_,nCellNum,true);
               }
            }
            _loc12_ = _loc7_;
            while(_loc12_ <= _loc6_)
            {
               ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCeldasPorCruz(this._mcBattlefield.mapHandler,nCellNum,_loc12_,_loc8_);
               _loc12_ = _loc12_ + 1;
            }
            break;
         case "L":
            _loc9_.drawLine(_loc4_[_loc3_].size,_loc4_[_loc3_].col,nCellNum,_loc4_[_loc3_].cellNumRef);
            _loc19_ = ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getDirection(this._mcBattlefield.mapHandler,_loc4_[_loc3_].cellNumRef,nCellNum);
            _loc6_ = _loc4_[_loc3_].size;
            _loc12_ = _loc7_;
            while(_loc12_ <= _loc6_)
            {
               ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCeldasPorDireccion(this._mcBattlefield.mapHandler,nCellNum,_loc12_,_loc8_,_loc19_);
               _loc12_ = _loc12_ + 1;
            }
            break;
         case "T":
            _loc9_.drawLine(_loc4_[_loc3_].size,_loc4_[_loc3_].col,nCellNum,_loc4_[_loc3_].cellNumRef,false,true);
            _loc19_ = ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getDirection(this._mcBattlefield.mapHandler,_loc4_[_loc3_].cellNumRef,nCellNum);
            _loc6_ = _loc4_[_loc3_].size;
            _loc12_ = _loc7_;
            while(_loc12_ <= _loc6_)
            {
               ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCeldasPorDireccion(this._mcBattlefield.mapHandler,nCellNum,_loc12_,_loc8_,_loc19_ + 2);
               ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCeldasPorDireccion(this._mcBattlefield.mapHandler,nCellNum,_loc12_,_loc8_,_loc19_ - 2);
               _loc12_ = _loc12_ + 1;
            }
            break;
         case "R":
            _loc9_.drawRectangle(_loc4_[_loc3_].size[0],_loc4_[_loc3_].size[1],_loc4_[_loc3_].col,nCellNum);
            break;
         case "O":
            _loc9_.drawRing(_loc4_[_loc3_].size,_loc4_[_loc3_].size - 1,_loc4_[_loc3_].col,nCellNum);
            ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCeldasPorDistancia(this._mcBattlefield.mapHandler,nCellNum,_loc4_[_loc3_].size,_loc8_);
      }
      for(var _loc25_ in _loc8_)
      {
         _loc16_ = this._mcBattlefield.mapHandler.getCellData(_loc25_);
         if(!(_loc16_.movement == 0 || _loc16_.movement == 1))
         {
            if(_loc16_.active)
            {
               _loc11_ = this._mcBattlefield._mcMainContainer.ExternalContainer.Object2["pointer" + _loc25_];
               if(_loc11_ == undefined)
               {
                  _loc11_ = this._mcBattlefield._mcMainContainer.ExternalContainer.Object2.createEmptyMovieClip("pointer" + _loc25_,_loc25_ * 100 + 4);
                  _loc11_._visible = _global.BUILD_TACTICO;
               }
               _loc14_ = _loc11_.attachMovie("20003","zone" + _loc13_,_loc13_,{data:{color:_loc23_,alpha:ank.battlefield.mc.Zone.ALPHA}});
               _loc14_._x = _loc16_.x;
               _loc14_._y = _loc16_.y;
            }
         }
      }
      this.movePointerTo(_loc9_,nCellNum);
      _loc3_ = _loc3_ + 1;
   }
};
