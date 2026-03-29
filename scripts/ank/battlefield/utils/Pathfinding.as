var _loc1 = ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].prototype;
_loc1.checkView = function(mapHandler, cell1, cell2)
{
   var _loc8_ = this.getCaseCoordonnee(mapHandler,cell1);
   var _loc7_ = this.getCaseCoordonnee(mapHandler,cell2);
   var _loc23_ = mapHandler.getCellData(cell1);
   var _loc22_ = mapHandler.getCellData(cell2);
   var _loc20_ = !_loc23_.spriteOnID ? 0 : 1.5;
   var _loc21_ = !_loc22_.spriteOnID ? 0 : 1.5;
   _loc20_ += !_loc23_.carriedSpriteOnId ? 0 : 1.5;
   _loc21_ += !_loc22_.carriedSpriteOnId ? 0 : 1.5;
   _loc8_.z = mapHandler.getCellHeight(cell1) + _loc20_;
   _loc7_.z = mapHandler.getCellHeight(cell2) + _loc21_;
   var _loc15_ = _loc7_.z - _loc8_.z;
   var _loc14_ = Math.max(Math.abs(_loc8_.y - _loc7_.y),Math.abs(_loc8_.x - _loc7_.x));
   var _loc17_ = (_loc8_.y - _loc7_.y) / (_loc8_.x - _loc7_.x);
   var _loc18_ = _loc8_.y - _loc17_ * _loc8_.x;
   var _loc10_ = _loc7_.x - _loc8_.x >= 0 ? 1 : -1;
   var _loc4_ = _loc7_.y - _loc8_.y >= 0 ? 1 : -1;
   var _loc16_ = _loc8_.y;
   var _loc26_ = _loc8_.x;
   var _loc19_ = _loc7_.x * _loc10_;
   var _loc25_ = _loc7_.y * _loc4_;
   var _loc5_ = _loc8_.x + 0.5 * _loc10_;
   if(cell2 == _global.NUMERO_CELDA)
   {
      _global.STR_PATH = "_loc5.x " + _loc8_.x + " _loc5.y " + _loc8_.y + " alto5 " + mapHandler.getCellHeight(cell1) + " _loc7.spriteOnID " + _loc23_.spriteOnID + " _loc7.carriedSpriteOnId " + _loc23_.carriedSpriteOnId + " _loc5.z " + _loc8_.z + " _loc6.x " + _loc7_.x + " _loc6.y " + _loc7_.y + " alto6 " + mapHandler.getCellHeight(cell2) + " _loc8.spriteOnID " + _loc22_.spriteOnID + " _loc8.carriedSpriteOnId " + _loc22_.carriedSpriteOnId + " _loc6.z " + _loc7_.z + " _loc9 " + _loc20_ + " _loc10 " + _loc21_ + " _loc11 " + _loc15_ + " _loc12 " + _loc14_ + " _loc13 " + _loc17_ + " _loc14 " + _loc18_ + " _loc15 " + _loc10_ + " _loc16 " + _loc4_ + " _loc17 " + _loc16_ + " _loc19 " + _loc19_ + " _loc27 " + _loc5_;
   }
   var _loc6_;
   var _loc11_;
   var _loc9_;
   var _loc3_;
   while(_loc5_ * _loc10_ <= _loc19_)
   {
      _loc6_ = _loc17_ * _loc5_ + _loc18_;
      if(cell2 == _global.NUMERO_CELDA)
      {
         _global.STR_PATH = _global.STR_PATH + " ENTRA_loc25 " + _loc6_;
      }
      if(_loc4_ > 0)
      {
         _loc11_ = Math.round(_loc6_);
         _loc9_ = Math.ceil(_loc6_ - 0.5);
      }
      else
      {
         _loc11_ = Math.ceil(_loc6_ - 0.5);
         _loc9_ = Math.round(_loc6_);
      }
      if(cell2 == _global.NUMERO_CELDA)
      {
         _global.STR_PATH = _global.STR_PATH + " ENTRA_loc21 " + _loc11_ + " ENTRA_loc22 " + _loc9_;
      }
      _loc3_ = _loc16_;
      while(_loc3_ * _loc4_ <= _loc9_ * _loc4_)
      {
         if(!this.checkCellView(mapHandler,_loc5_ - _loc10_ / 2,_loc3_,false,_loc8_,_loc7_,_loc15_,_loc14_))
         {
            return false;
         }
         _loc3_ += _loc4_;
      }
      _loc16_ = _loc11_;
      if(cell2 == _global.NUMERO_CELDA)
      {
         _global.STR_PATH = _global.STR_PATH + " ENTRA_loc17 " + _loc16_;
      }
      _loc5_ += _loc10_;
   }
   _loc3_ = _loc16_;
   if(cell2 == _global.NUMERO_CELDA)
   {
      _global.STR_PATH = _global.STR_PATH + " _loc26 " + _loc3_;
   }
   while(_loc3_ * _loc4_ <= _loc7_.y * _loc4_)
   {
      if(cell2 == _global.NUMERO_CELDA)
      {
         _global.STR_PATH = _global.STR_PATH + " entro " + _loc3_;
      }
      if(!this.checkCellView(mapHandler,_loc5_ - 0.5 * _loc10_,_loc3_,false,_loc8_,_loc7_,_loc15_,_loc14_))
      {
         return false;
      }
      _loc3_ += _loc4_;
   }
   if(!this.checkCellView(mapHandler,_loc5_ - 0.5 * _loc10_,_loc3_ - _loc4_,true,_loc8_,_loc7_,_loc15_,_loc14_))
   {
      return false;
   }
   return true;
};
_loc1.checkCellView = function(mapHandler, x, y, bool, p1, p2, zDiff, d)
{
   var _loc7_ = this.getCaseNum(mapHandler,x,y);
   var _loc6_ = mapHandler.getCellData(_loc7_);
   var _loc5_ = Math.max(Math.abs(p1.y - y),Math.abs(p1.x - x));
   var _loc4_ = _loc5_ / d * zDiff + p1.z;
   var _loc3_ = mapHandler.getCellHeight(_loc7_);
   var _loc8_ = !(_loc6_.spriteOnID == undefined || (_loc5_ == 0 || (bool || p2.x == x && p2.y == y))) ? true : false;
   if(_loc7_ == _global.NUMERO_CELDA)
   {
      _global.STR_PATH = _global.STR_PATH + " _loc11.lineOfSight " + _loc6_.lineOfSight + " _loc12 " + _loc5_ + " _loc13 " + _loc4_ + " _loc14 " + _loc3_ + " _loc15 " + _loc8_ + " _loc14 = _loc13 " + (_loc3_ <= _loc4_) + " (_loc14 = _loc13 && !_loc15) " + (_loc3_ <= _loc4_ && !_loc8_);
   }
   if(_loc6_.lineOfSight && (_loc3_ <= _loc4_ && !_loc8_))
   {
      return true;
   }
   if(bool)
   {
      return true;
   }
   return false;
};
_loc1.getCeldasPorDistanciaAnillo = function(maphandler, celda, distancia, par, celdas)
{
   if(celdas == undefined)
   {
      celdas = new Object();
   }
   var _loc16_ = this.getCaseCoordonnee(maphandler,celda);
   var _loc13_ = _loc16_.x;
   var _loc12_ = _loc16_.y;
   var _loc8_ = [[1,1],[1,-1],[-1,1],[-1,-1]];
   var _loc7_ = [[-1,0],[1,0],[-1,0],[1,0]];
   var _loc6_ = 0;
   var _loc10_;
   var _loc3_;
   var _loc5_;
   var _loc4_;
   var _loc2_;
   while(_loc6_ <= distancia)
   {
      _loc10_ = distancia - _loc6_;
      for(var _loc14_ in _loc8_)
      {
         _loc3_ = _loc8_[_loc14_];
         _loc5_ = _loc13_ + _loc3_[0] * _loc6_;
         _loc4_ = _loc12_ + _loc3_[1] * _loc10_;
         if(p == 0)
         {
            _loc5_ += _loc7_[_loc14_][0];
            _loc4_ += _loc7_[_loc14_][1];
         }
         _loc2_ = this.getCaseNum(maphandler,_loc5_,_loc4_);
         if(!(_loc2_ == undefined || _loc2_ < 0 || _loc2_ >= maphandler.getCellCount()))
         {
            celdas[_loc2_] = true;
         }
      }
      _loc6_ = _loc6_ + 1;
   }
   return celdas;
};
_loc1.getCeldasPorDistancia = function(maphandler, celda, distancia, celdas)
{
   if(celdas == undefined)
   {
      celdas = new Object();
   }
   var _loc15_ = this.getCaseCoordonnee(maphandler,celda);
   var _loc12_ = _loc15_.x;
   var _loc11_ = _loc15_.y;
   var _loc7_ = [[1,1],[1,-1],[-1,1],[-1,-1]];
   var _loc4_ = 0;
   var _loc9_;
   var _loc3_;
   var _loc6_;
   var _loc5_;
   var _loc2_;
   while(_loc4_ <= distancia)
   {
      _loc9_ = distancia - _loc4_;
      for(var _loc13_ in _loc7_)
      {
         _loc3_ = _loc7_[_loc13_];
         _loc6_ = _loc12_ + _loc3_[0] * _loc4_;
         _loc5_ = _loc11_ + _loc3_[1] * _loc9_;
         _loc2_ = this.getCaseNum(maphandler,_loc6_,_loc5_);
         if(!(_loc2_ == undefined || _loc2_ < 0 || _loc2_ >= maphandler.getCellCount()))
         {
            celdas[_loc2_] = true;
         }
      }
      _loc4_ = _loc4_ + 1;
   }
   return celdas;
};
_loc1.getCeldasPorCruz = function(maphandler, celda, distancia, celdas)
{
   if(celdas == undefined)
   {
      celdas = new Object();
   }
   var _loc13_ = this.getCaseCoordonnee(maphandler,celda);
   var _loc11_ = _loc13_.x;
   var _loc10_ = _loc13_.y;
   var _loc6_ = [[1,0],[0,1],[-1,0],[0,-1]];
   var _loc3_;
   var _loc5_;
   var _loc4_;
   var _loc2_;
   for(var _loc12_ in _loc6_)
   {
      _loc3_ = _loc6_[_loc12_];
      _loc5_ = _loc11_ + _loc3_[0] * distancia;
      _loc4_ = _loc10_ + _loc3_[1] * distancia;
      _loc2_ = this.getCaseNum(maphandler,_loc5_,_loc4_);
      if(!(_loc2_ == undefined || _loc2_ < 0 || _loc2_ >= maphandler.getCellCount()))
      {
         celdas[_loc2_] = true;
      }
   }
   return celdas;
};
_loc1.getCeldasPorDireccion = function(maphandler, celda, distancia, celdas, direccion)
{
   if(celdas == undefined)
   {
      celdas = new Object();
   }
   while(direccion < 0)
   {
      direccion += 8;
   }
   while(direccion >= 8)
   {
      direccion -= 8;
   }
   var _loc4_ = this.getCaseCoordonnee(maphandler,celda);
   var _loc11_ = _loc4_.x;
   var _loc10_ = _loc4_.y;
   var _loc5_ = this.getCoordPorDireccion(direccion);
   var _loc9_ = _loc11_ + _loc5_[0] * distancia;
   var _loc8_ = _loc10_ + _loc5_[1] * distancia;
   var _loc3_ = this.getCaseNum(maphandler,_loc9_,_loc8_);
   if(_loc3_ == undefined || _loc3_ < 0 || _loc3_ >= maphandler.getCellCount())
   {
   }
   celdas[_loc3_] = true;
   return celdas;
};
_loc1.getCaseNum = function(mapHandler, x, y)
{
   var _loc1_ = mapHandler.getWidth();
   var _loc6_ = mapHandler.getHeight();
   var _loc4_ = x + y;
   if(x - Math.abs(y) < 0 || x - y > _loc1_ * 2 - 2)
   {
      return -1;
   }
   return x * _loc1_ + y * (_loc1_ - 1);
};
_loc1.getCoordPorDireccion = function(dir)
{
   var _loc1_ = [[1,-1],[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1]];
   return _loc1_[dir];
};
