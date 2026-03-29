var _loc1 = ank.battlefield["\x1e\t\x04"].prototype;
_loc1.clear = function(Void)
{
   this._mcZones.removeMovieClip();
   this._mcZones = this._mcContainer.createEmptyMovieClip("zones",10);
   this._nNextLayerDepth = 0;
   var _loc2_ = this._mcBattlefield.mapHandler.getCellsData();
   for(var _loc3_ in _loc2_)
   {
      this._mcBattlefield._mcMainContainer.ExternalContainer.Object2["zone" + _loc3_].removeMovieClip();
   }
};
_loc1.clearZone = function(nCellNum, radius, layer)
{
   nCellNum = Number(nCellNum);
   radius = Number(radius);
   if(nCellNum < 0)
   {
      return undefined;
   }
   if(nCellNum > this._mcBattlefield.mapHandler.getCellCount())
   {
      return undefined;
   }
   var _loc2_ = nCellNum * 1000 + radius * 100;
   this._mcZones[layer]["zone" + _loc2_].clear();
   var _loc4_ = this._mcBattlefield.mapHandler.getCellsData();
   for(var _loc5_ in _loc4_)
   {
      if(this._mcBattlefield._mcMainContainer.ExternalContainer.Object2["zone" + _loc5_][layer]["zone" + _loc2_])
      {
         this._mcBattlefield._mcMainContainer.ExternalContainer.Object2["zone" + _loc5_][layer]["zone" + _loc2_].removeMovieClip();
      }
   }
};
_loc1.clearZoneLayer = function(layer)
{
   this._mcZones[layer].removeMovieClip();
   var _loc3_ = this._mcBattlefield.mapHandler.getCellsData();
   for(var _loc4_ in _loc3_)
   {
      if(this._mcBattlefield._mcMainContainer.ExternalContainer.Object2["zone" + _loc4_][layer])
      {
         this._mcBattlefield._mcMainContainer.ExternalContainer.Object2["zone" + _loc4_][layer].removeMovieClip();
      }
   }
};
_loc1.drawZone = function(nCellNum, radiusIn, radiusOut, layer, col, shape)
{
   nCellNum = Number(nCellNum);
   radiusIn = Number(radiusIn);
   radiusOut = Number(radiusOut);
   col = Number(col);
   if(nCellNum < 0)
   {
      return undefined;
   }
   if(nCellNum > this._mcBattlefield.mapHandler.getCellCount())
   {
      return undefined;
   }
   if(_global.isNaN(radiusIn) || _global.isNaN(radiusOut))
   {
      return undefined;
   }
   var _loc20_ = nCellNum * 1000 + radiusOut * 100;
   if(this._mcZones[layer] == undefined)
   {
      this._mcZones.createEmptyMovieClip(layer,this._nNextLayerDepth++);
   }
   this._mcZones[layer].__proto__ = MovieClip.prototype;
   this._mcZones[layer].cacheAsBitmap = this._mcZones.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["Zone/Zone"];
   var _loc19_ = this._mcZones[layer].attachClassMovie(ank.battlefield.mc.Zone,"zone" + _loc20_,_loc20_,[this._mcBattlefield.mapHandler]);
   var _loc10_ = new Object();
   var _loc3_;
   var _loc34_;
   var _loc30_;
   var _loc32_;
   var _loc31_;
   var _loc23_;
   loop8:
   switch(shape)
   {
      case "D":
         if(radiusIn == 0)
         {
            radiusIn = radiusOut % 2 != 0 ? 0 : 1;
         }
         _loc3_ = radiusIn;
         while(_loc3_ < radiusOut)
         {
            _loc19_.drawRing(_loc3_ + 1,_loc3_,col,nCellNum);
            _loc3_ += 2;
         }
         _loc3_ = radiusIn;
         while(_loc3_ < radiusOut)
         {
            ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCeldasPorDistanciaAnillo(this._mcBattlefield.mapHandler,nCellNum,_loc3_ + 1,radiusIn,_loc10_);
            _loc3_ += 2;
         }
         break;
      case "C":
         if(radiusIn == 0)
         {
            _loc19_.drawCircle(radiusOut,col,nCellNum);
         }
         else
         {
            _loc34_ = radiusIn;
            if(radiusIn > 0)
            {
               _loc34_ = radiusIn - 1;
            }
            _loc19_.drawRing(_loc34_,radiusOut,col,nCellNum);
         }
         _loc3_ = radiusIn;
         while(_loc3_ <= radiusOut)
         {
            ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCeldasPorDistancia(this._mcBattlefield.mapHandler,nCellNum,_loc3_,_loc10_);
            _loc3_ = _loc3_ + 1;
         }
         break;
      case "X":
         if(radiusIn == 0)
         {
            _loc19_.drawCross(radiusOut,col,nCellNum);
         }
         else
         {
            _loc30_ = this._mcBattlefield.mapHandler;
            _loc32_ = _loc30_.getWidth();
            _loc31_ = ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(_loc30_,nCellNum);
            _loc23_ = nCellNum - _loc32_ * radiusIn;
            if(ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(_loc30_,_loc23_).y == _loc31_.y)
            {
               _loc19_.drawLine(radiusOut - radiusIn,col,_loc23_,nCellNum,true);
            }
            _loc23_ = nCellNum - (_loc32_ - 1) * radiusIn;
            if(ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(_loc30_,_loc23_).x == _loc31_.x)
            {
               _loc19_.drawLine(radiusOut - radiusIn,col,_loc23_,nCellNum,true);
            }
            _loc23_ = nCellNum + _loc32_ * radiusIn;
            if(ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(_loc30_,_loc23_).y == _loc31_.y)
            {
               _loc19_.drawLine(radiusOut - radiusIn,col,_loc23_,nCellNum,true);
            }
            _loc23_ = nCellNum + (_loc32_ - 1) * radiusIn;
            if(ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(_loc30_,_loc23_).x == _loc31_.x)
            {
               _loc19_.drawLine(radiusOut - radiusIn,col,_loc23_,nCellNum,true);
            }
         }
         _loc3_ = radiusIn;
         while(_loc3_ <= radiusOut)
         {
            ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCeldasPorCruz(this._mcBattlefield.mapHandler,nCellNum,_loc3_,_loc10_);
            _loc3_ = _loc3_ + 1;
         }
         break;
      default:
         _loc19_.drawCircle(radiusOut,col,nCellNum);
         _loc3_ = radiusIn;
         while(true)
         {
            if(_loc3_ > radiusOut)
            {
               break loop8;
            }
            ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCeldasPorDistancia(this._mcBattlefield.mapHandler,nCellNum,_loc3_,_loc10_);
            _loc3_ = _loc3_ + 1;
         }
   }
   var _loc28_ = new Object();
   var _loc16_;
   var _loc7_;
   for(var _loc33_ in _loc10_)
   {
      _loc16_ = this._mcBattlefield.mapHandler.getCellData(_loc33_);
      _loc7_ = ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(this._mcBattlefield.mapHandler,_loc33_);
      if(_loc28_[_loc7_.x] == undefined)
      {
         _loc28_[_loc7_.x] = new Object();
      }
      _loc28_[_loc7_.x][_loc7_.y] = {a:true,b:true,c:true,d:true};
   }
   var _loc14_ = [[-1,0],[0,1],[1,0],[0,-1]];
   var _loc22_ = ["a","b","c","d"];
   var _loc21_ = ["c","d","a","b"];
   var _loc13_;
   var _loc12_;
   var _loc11_;
   var _loc8_;
   var _loc5_;
   var _loc15_;
   for(_loc33_ in _loc10_)
   {
      _loc16_ = this._mcBattlefield.mapHandler.getCellData(_loc33_);
      if(!(_loc16_.movement == 0 || _loc16_.movement == 1))
      {
         if(_loc16_.active)
         {
            _loc7_ = ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(this._mcBattlefield.mapHandler,_loc33_);
            _loc13_ = _loc28_[_loc7_.x][_loc7_.y];
            _loc3_ = 0;
            while(_loc3_ <= 4)
            {
               _loc12_ = _loc7_.x + _loc14_[_loc3_][0];
               _loc11_ = _loc7_.y + _loc14_[_loc3_][1];
               _loc8_ = _loc28_[_loc12_][_loc11_];
               if(_loc8_ != undefined)
               {
                  _loc13_[_loc22_[_loc3_]] = false;
                  _loc8_[_loc21_[_loc3_]] = false;
               }
               _loc3_ = _loc3_ + 1;
            }
            _loc5_ = this._mcBattlefield._mcMainContainer.ExternalContainer.Object2["zone" + _loc33_];
            if(_loc5_ == undefined)
            {
               _loc5_ = this._mcBattlefield._mcMainContainer.ExternalContainer.Object2.createEmptyMovieClip("zone" + _loc33_,_loc33_ * 100 + 3);
               _loc5_._visible = _global.BUILD_TACTICO;
            }
            if(_loc5_[layer] == undefined)
            {
               _loc5_.createEmptyMovieClip(layer,_loc5_.getNextHighestDepth());
            }
            _loc15_ = _loc5_[layer].attachMovie("20003","zone" + _loc20_,_loc20_,{data:{color:col,alpha:ank.battlefield.mc.Zone.ALPHA,bordes:_loc13_}});
            _loc15_._x = _loc16_.x;
            _loc15_._y = _loc16_.y;
         }
      }
   }
   this.moveZoneTo(_loc19_,nCellNum);
};
