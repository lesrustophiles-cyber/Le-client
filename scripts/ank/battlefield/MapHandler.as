var _loc1 = _global.ank.battlefield["\x0b\x05"].prototype;
_loc1.build = function(var2, var3, var4)
{
   this._oDatacenter.Map = var2;
   var _loc25_ = ank.battlefield["\x12\x03"].CELL_WIDTH;
   var _loc34_ = ank.battlefield["\x12\x03"].CELL_HALF_WIDTH;
   var _loc26_ = ank.battlefield["\x12\x03"].CELL_HALF_HEIGHT;
   var _loc35_ = ank.battlefield["\x12\x03"].LEVEL_HEIGHT;
   var _loc14_ = -1;
   var _loc23_ = 0;
   var _loc16_ = 0;
   var _loc32_ = var2.data;
   var _loc31_ = _loc32_.length;
   var _loc24_ = var2.width - 1;
   var _loc5_ = this._mcContainer.ExternalContainer;
   var _loc17_ = var3 != undefined;
   var _loc15_ = false;
   var _loc33_ = this._nLastCellCount == _loc31_;
   this._nLoadRequest = 0;
   if(!_loc17_ && (ank.battlefield["\x12\x03"].USE_STREAMING_FILES && ank.battlefield["\x12\x03"].STREAMING_METHOD == "explod"))
   {
      this._mcContainer.applyMask(false);
   }
   var _loc37_;
   if(var2.backgroundNum != 0)
   {
      if(ank.battlefield["\x12\x03"].USE_STREAMING_FILES && (ank.battlefield["\x12\x03"].STREAMING_METHOD == "explod" && !_loc17_))
      {
         _loc37_ = _loc5_.Ground.createEmptyMovieClip("background",-1);
         _loc37_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/BACKGROUND"];
         this._mclLoader.loadClip(ank.battlefield["\x12\x03"].STREAMING_GROUNDS_DIR + var2.backgroundNum + ".swf",_loc37_);
         this._nLoadRequest++;
      }
      else if(ank.battlefield["\x12\x03"].STREAMING_METHOD != "")
      {
         _loc5_.Ground.attachMovie(var2.backgroundNum,"background",-1).cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/BACKGROUND"];
      }
      else
      {
         _loc5_.Ground.attach(var2.backgroundNum,"background",-1).cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/BACKGROUND"];
      }
   }
   var _loc4_ = -1;
   var _loc3_;
   var _loc9_;
   var _loc10_;
   var _loc11_;
   var _loc18_;
   var _loc6_;
   var _loc19_;
   var _loc8_;
   var _loc12_;
   var _loc22_;
   var _loc7_;
   var _loc20_;
   var _loc21_;
   var _loc13_;
   while((_loc4_ += 1) < _loc31_)
   {
      if(_loc14_ == _loc24_)
      {
         _loc14_ = 0;
         _loc23_ += 1;
         if(_loc16_ == 0)
         {
            _loc16_ = _loc34_;
            _loc24_ -= 1;
         }
         else
         {
            _loc16_ = 0;
            _loc24_ += 1;
         }
      }
      else
      {
         _loc14_ += 1;
      }
      if(_loc17_)
      {
         if(_loc4_ < var3)
         {
            continue;
         }
         if(_loc4_ > var3)
         {
            return undefined;
         }
      }
      _loc3_ = _loc32_[_loc4_];
      if(_loc3_.active)
      {
         _loc9_ = _loc14_ * _loc25_ + _loc16_;
         _loc10_ = _loc23_ * _loc26_ - _loc35_ * (_loc3_.groundLevel - 7);
         _loc3_.x = _loc9_;
         _loc3_.y = _loc10_;
         if(_loc3_.movement || var4)
         {
            if(!_loc33_ && !_loc5_.InteractionCell["cell" + _loc4_])
            {
               if(!_loc15_)
               {
                  if(ank.battlefield["\x12\x03"].STREAMING_METHOD != "")
                  {
                     _loc11_ = _loc5_.InteractionCell.attachMovie("i" + _loc3_.groundSlope,"cell" + _loc4_,_loc4_,{_x:_loc9_,_y:_loc10_});
                  }
                  else
                  {
                     _loc11_ = _loc5_.InteractionCell.attachMovie("i" + _loc3_.groundSlope,"cell" + _loc4_,_loc4_,{_x:_loc9_,_y:_loc10_});
                  }
               }
               else
               {
                  _loc11_ = _loc5_.InteractionCell.createEmptyMovieClip("cell" + _loc4_,_loc4_,{_x:_loc9_,_y:_loc10_});
               }
               _loc11_.__proto__ = ank.battlefield.mc["\x13\n"].prototype;
               _loc11_.initialize(this._mcBattlefield);
            }
            else
            {
               _loc11_ = _loc5_.InteractionCell["cell" + _loc4_];
            }
            _loc3_.mc = _loc11_;
            _loc11_.data = _loc3_;
         }
         else
         {
            _loc5_.InteractionCell["cell" + _loc4_].removeMovieClip();
         }
         if(_loc3_.layerGroundNum != 0)
         {
            if(ank.battlefield["\x12\x03"].USE_STREAMING_FILES && ank.battlefield["\x12\x03"].STREAMING_METHOD == "explod")
            {
               _loc18_ = true;
               if(_loc17_)
               {
                  _loc6_ = _loc5_.Ground["cell" + _loc4_];
                  if(_loc6_ != undefined && _loc6_.lastGroundID == _loc3_.layerGroundNum)
                  {
                     _loc6_.fullLoaded = _loc18_ = false;
                     this._oLoadingCells[_loc6_] = _loc3_;
                     this.onLoadInit(_loc6_);
                  }
               }
               if(_loc18_)
               {
                  _loc6_ = _loc5_.Ground.createEmptyMovieClip("cell" + _loc4_,_loc4_);
                  _loc6_.fullLoaded = false;
                  this._oLoadingCells[_loc6_] = _loc3_;
                  this._mclLoader.loadClip(ank.battlefield["\x12\x03"].STREAMING_GROUNDS_DIR + _loc3_.layerGroundNum + ".swf",_loc6_);
                  this._nLoadRequest++;
               }
            }
            else
            {
               if(!_loc15_)
               {
                  if(ank.battlefield["\x12\x03"].STREAMING_METHOD != "")
                  {
                     _loc6_ = _loc5_.Ground.attachMovie(_loc3_.layerGroundNum,"cell" + _loc4_,_loc4_);
                  }
                  else
                  {
                     _loc6_ = _loc5_.Ground.attach(_loc3_.layerGroundNum,"cell" + _loc4_,_loc4_);
                  }
               }
               else
               {
                  _loc6_ = new MovieClip();
               }
               _loc6_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/Ground"];
               _loc6_._x = _loc9_;
               _loc6_._y = _loc10_;
               if(_loc3_.groundSlope != 1)
               {
                  _loc6_.gotoAndStop(_loc3_.groundSlope);
               }
               else if(_loc3_.layerGroundRot != 0)
               {
                  _loc6_._rotation = _loc3_.layerGroundRot * 90;
                  if(_loc6_._rotation % 180)
                  {
                     _loc6_._yscale = 192.86;
                     _loc6_._xscale = 51.85;
                  }
               }
               if(_loc3_.layerGroundFlip)
               {
                  _loc6_._xscale *= -1;
               }
            }
         }
         else
         {
            _loc5_.Ground["cell" + _loc4_].removeMovieClip();
         }
         if(_loc3_.layerObject1Num != 0)
         {
            if(ank.battlefield["\x12\x03"].USE_STREAMING_FILES && ank.battlefield["\x12\x03"].STREAMING_METHOD == "explod")
            {
               _loc19_ = true;
               if(_loc17_)
               {
                  _loc8_ = _loc5_.Object1["cell" + _loc4_];
                  if(_loc8_ != undefined && _loc8_.lastObject1ID == _loc3_.layerObject1Num)
                  {
                     _loc8_.fullLoaded = _loc19_ = false;
                     this._oLoadingCells[_loc8_] = _loc3_;
                     this.onLoadInit(_loc8_);
                  }
               }
               if(_loc19_)
               {
                  _loc8_ = _loc5_.Object1.createEmptyMovieClip("cell" + _loc4_,_loc4_);
                  _loc8_.fullLoaded = false;
                  this._oLoadingCells[_loc8_] = _loc3_;
                  this._mclLoader.loadClip(ank.battlefield["\x12\x03"].STREAMING_OBJECTS_DIR + _loc3_.layerObject1Num + ".swf",_loc8_);
                  this._nLoadRequest++;
               }
            }
            else
            {
               if(!_loc15_)
               {
                  _loc8_ = _loc5_.Object1.attachMovie(_loc3_.layerObject1Num,"cell" + _loc4_,_loc4_);
               }
               else
               {
                  _loc8_ = new MovieClip();
               }
               _loc8_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/Object1"];
               _loc8_._x = _loc9_;
               _loc8_._y = _loc10_;
               if(_loc3_.groundSlope == 1 && _loc3_.layerObject1Rot != 0)
               {
                  _loc8_._rotation = _loc3_.layerObject1Rot * 90;
                  if(_loc8_._rotation % 180)
                  {
                     _loc8_._yscale = 192.86;
                     _loc8_._xscale = 51.85;
                  }
               }
               if(_loc3_.layerObject1Flip)
               {
                  _loc8_._xscale *= -1;
               }
            }
            _loc3_.mcObject1 = _loc8_;
         }
         else
         {
            _loc5_.Object1["cell" + _loc4_].removeMovieClip();
         }
         if(_loc3_.layerObjectExternal != "")
         {
            if(!_loc15_)
            {
               _loc12_ = _loc5_.Object2.attachClassMovie(ank.battlefield.mc["\f\x10"],"cellExt" + _loc4_,_loc4_ * 100 + 1);
            }
            _loc12_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/ObjectExternal"];
            _loc12_.initialize(this._mcBattlefield,_loc3_,_loc3_.layerObjectExternalInteractive);
            _loc12_.loadExternalClip(_loc3_.layerObjectExternal,_loc3_.layerObjectExternalAutoSize);
            _loc12_._x = _loc9_;
            _loc12_._y = _loc10_;
            _loc3_.mcObjectExternal = _loc12_;
         }
         else
         {
            _loc5_.Object2["cellExt" + _loc4_].removeMovieClip();
            delete register21.mcObjectExternal;
         }
         if(_loc3_.layerObject2Num != 0)
         {
            if(ank.battlefield["\x12\x03"].USE_STREAMING_FILES && ank.battlefield["\x12\x03"].STREAMING_METHOD == "explod")
            {
               _loc22_ = true;
               if(_loc17_)
               {
                  _loc7_ = _loc5_.Object2["cell" + _loc4_];
                  if(_loc7_ != undefined && _loc7_.lastObject2ID == _loc3_.layerObject2Num)
                  {
                     _loc7_.fullLoaded = _loc22_ = false;
                     this._oLoadingCells[_loc7_] = _loc3_;
                     this.onLoadInit(_loc7_);
                  }
               }
               if(_loc22_)
               {
                  _loc7_ = _loc5_.Object2.createEmptyMovieClip("cell" + _loc4_,_loc4_ * 100);
                  _loc7_.fullLoaded = false;
                  this._oLoadingCells[_loc7_] = _loc3_;
                  this._mclLoader.loadClip(ank.battlefield["\x12\x03"].STREAMING_OBJECTS_DIR + _loc3_.layerObject2Num + ".swf",_loc7_);
                  this._nLoadRequest++;
               }
            }
            else
            {
               if(!_loc15_)
               {
                  _loc7_ = _loc5_.Object2.attachMovie(_loc3_.layerObject2Num,"cell" + _loc4_,_loc4_ * 100);
               }
               else
               {
                  _loc7_ = new MovieClip();
               }
               if(_loc7_)
               {
                  _loc7_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/Object2"];
                  if(_loc3_.layerObject2Interactive)
                  {
                     _loc7_.__proto__ = ank.battlefield.mc["\f\x10"].prototype;
                     _loc7_.initialize(this._mcBattlefield,_loc3_,true);
                  }
                  _loc7_._x = _loc9_;
                  _loc7_._y = _loc10_;
                  if(_loc3_.layerObject2Flip)
                  {
                     _loc7_._xscale = -100;
                  }
               }
            }
            if(_loc7_)
            {
               _loc3_.mcObject2 = _loc7_;
            }
            else
            {
               _loc3_.layerObject2Num = 0;
               _loc5_.Object2["cell" + _loc4_].removeMovieClip();
               delete register21.mcObject2;
            }
         }
         else
         {
            _loc5_.Object2["cell" + _loc4_].removeMovieClip();
            delete register21.mcObject2;
         }
      }
      else if(var4)
      {
         _loc20_ = _loc14_ * _loc25_ + _loc16_;
         _loc21_ = _loc23_ * _loc26_;
         _loc3_.x = _loc20_;
         _loc3_.y = _loc21_;
         _loc13_ = _loc5_.InteractionCell.attachMovie("i1","cell" + _loc4_,_loc4_,{_x:_loc20_,_y:_loc21_});
         _loc13_.__proto__ = ank.battlefield.mc["\x13\n"].prototype;
         _loc13_.initialize(this._mcBattlefield);
         _loc3_.mc = _loc13_;
         _loc13_.data = _loc3_;
      }
   }
   if(!_loc17_)
   {
      if(ank.battlefield["\x12\x03"].USE_STREAMING_FILES && ank.battlefield["\x12\x03"].STREAMING_METHOD == "explod")
      {
         if(this._nAdjustTimer != undefined)
         {
            return undefined;
         }
         this._nAdjustTimer = _global.setInterval(this,"adjustAndMaskMap",ank.battlefield.MapHandler.TIME_BEFORE_AJUSTING_MAP);
      }
      else
      {
         this.adjustAndMaskMap();
      }
   }
};
_loc1.initializeCell = function(var2, var3, var4)
{
   if(var3 == undefined)
   {
      var3 = Infinity;
   }
   else
   {
      var3 = Number(var3);
   }
   var _loc5_ = this._oDatacenter.Map;
   var _loc9_ = _loc5_.data;
   var _loc3_ = _loc5_.originalsCellsBackup.getItemAt(String(var2));
   if(_loc3_ == undefined)
   {
      ank["\x1e\n\t"]["\x0b\x0b"].err("La case est déjà dans son état init");
      return undefined;
   }
   var _loc10_;
   var _loc4_;
   if(_loc9_[var2].nPermanentLevel <= var3)
   {
      if(var4 == true)
      {
         _loc10_ = _global.API.datacenter.Game.isTacticMode;
         _loc4_ = new ank.battlefield.datacenter["\x13\n"]();
         for(var _loc7_ in _loc3_)
         {
            _loc4_[_loc7_] = _loc3_[_loc7_];
         }
         if(_loc10_)
         {
            _loc4_.turnTactic(this,_loc5_);
         }
         _loc9_[var2] = _loc4_;
         this.build(_loc5_,var2);
         if(!_loc10_)
         {
            _loc5_.originalsCellsBackup.removeItemAt(String(var2));
         }
      }
      else
      {
         _loc9_[var2] = _loc3_;
         this.build(_loc5_,var2);
         _loc5_.originalsCellsBackup.removeItemAt(String(var2));
      }
   }
};
_loc1.tacticModeRefreshCell = function(var2, var3)
{
   if(var2 > this.getCellCount())
   {
      ank["\x1e\n\t"]["\x0b\x0b"].err("[updateCell] Cellule " + var2 + " inexistante");
      return undefined;
   }
   var _loc5_ = this._oDatacenter.Map;
   var _loc2_ = _loc5_.data[var2];
   if(!_loc2_.active)
   {
      return undefined;
   }
   var _loc4_;
   var _loc3_;
   if(!var3)
   {
      _loc4_ = _loc5_.originalsCellsBackup.getItemAt(String(var2));
      if(_loc4_ == undefined)
      {
         ank["\x1e\n\t"]["\x0b\x0b"].err("La case est déjà dans son état init");
         return undefined;
      }
      _loc2_.layerGroundNum = _loc4_.layerGroundNum;
      _loc2_.groundSlope = _loc4_.groundSlope;
      _loc2_.layerObject1Rot = _loc4_.layerObject1Rot;
      _loc2_.layerObject1Num = _loc4_.layerObject1Num;
      if(_loc2_.layerObject2Num != 25)
      {
         _loc2_.layerObject2Num = _loc4_.layerObject2Num;
      }
   }
   else
   {
      if(_loc2_.nPermanentLevel == 0)
      {
         _loc3_ = new ank.battlefield.datacenter["\x13\n"]();
         for(var _loc7_ in _loc2_)
         {
            _loc3_[_loc7_] = _loc2_[_loc7_];
         }
         _loc5_.originalsCellsBackup.addItemAt(String(var2),_loc3_);
      }
      _loc2_.turnTactic(this,_loc5_);
   }
   this.build(_loc5_,var2);
};
_loc1.setObject2Interactive = function(nCellNum, bInteractive, nPermanentLevel, nEstrellas)
{
   if(nCellNum > this.getCellCount())
   {
      return undefined;
   }
   var _loc4_ = this._oDatacenter.Map.data[nCellNum];
   _loc4_.mcObject2.select(false);
   var _loc2_ = new ank.battlefield.datacenter["\x13\n"]();
   _loc2_.layerObject2Interactive = bInteractive;
   _loc2_.estrellas = nEstrellas;
   this.updateCell(nCellNum,_loc2_,"1",nPermanentLevel);
};
_loc1.updateCell = function(nCellNum, oNewCell, sMaskHex, nPermanentLevel)
{
   if(nCellNum > this.getCellCount())
   {
      ank["\x1e\n\t"]["\x0b\x0b"].err("[updateCell] Cellule " + nCellNum + " inexistante");
      return undefined;
   }
   if(nPermanentLevel == undefined || _global.isNaN(nPermanentLevel))
   {
      nPermanentLevel = 0;
   }
   else
   {
      nPermanentLevel = Number(nPermanentLevel);
   }
   var _loc5_ = _global.parseInt(sMaskHex,16);
   var _loc12_ = (_loc5_ & 0x010000) != 0;
   var _loc14_ = (_loc5_ & 0x8000) != 0;
   var _loc20_ = (_loc5_ & 0x4000) != 0;
   var _loc19_ = (_loc5_ & 0x2000) != 0;
   var _loc26_ = (_loc5_ & 0x1000) != 0;
   var _loc22_ = (_loc5_ & 0x0800) != 0;
   var _loc16_ = (_loc5_ & 0x0400) != 0;
   var _loc13_ = (_loc5_ & 0x0200) != 0;
   var _loc10_ = (_loc5_ & 0x0100) != 0;
   var _loc23_ = (_loc5_ & 0x80) != 0;
   var _loc24_ = (_loc5_ & 0x40) != 0;
   var _loc17_ = (_loc5_ & 0x20) != 0;
   var _loc18_ = (_loc5_ & 0x10) != 0;
   var _loc25_ = (_loc5_ & 8) != 0;
   var _loc21_ = (_loc5_ & 4) != 0;
   var _loc15_ = (_loc5_ & 2) != 0;
   var _loc11_ = (_loc5_ & 1) != 0;
   var _loc3_ = this._oDatacenter.Map.data[nCellNum];
   var _loc6_;
   if(nPermanentLevel > 0)
   {
      if(_loc3_.nPermanentLevel == 0)
      {
         _loc6_ = new ank.battlefield.datacenter["\x13\n"]();
         for(var _loc8_ in _loc3_)
         {
            _loc6_[_loc8_] = _loc3_[_loc8_];
         }
         this._oDatacenter.Map.originalsCellsBackup.addItemAt(nCellNum,_loc6_);
         _loc3_.nPermanentLevel = nPermanentLevel;
      }
   }
   if(_loc19_)
   {
      _loc3_.active = oNewCell.active;
   }
   if(_loc26_)
   {
      _loc3_.lineOfSight = oNewCell.lineOfSight;
   }
   if(_loc22_)
   {
      _loc3_.movement = oNewCell.movement;
   }
   if(_loc16_)
   {
      _loc3_.groundLevel = oNewCell.groundLevel;
   }
   if(_loc13_)
   {
      _loc3_.groundSlope = oNewCell.groundSlope;
   }
   if(_loc10_)
   {
      _loc3_.layerGroundNum = oNewCell.layerGroundNum;
   }
   if(_loc23_)
   {
      _loc3_.layerGroundFlip = oNewCell.layerGroundFlip;
   }
   if(_loc24_)
   {
      _loc3_.layerGroundRot = oNewCell.layerGroundRot;
   }
   if(_loc17_)
   {
      _loc3_.layerObject1Num = oNewCell.layerObject1Num;
   }
   if(_loc25_)
   {
      _loc3_.layerObject1Rot = oNewCell.layerObject1Rot;
   }
   if(_loc18_)
   {
      _loc3_.layerObject1Flip = oNewCell.layerObject1Flip;
   }
   if(_loc15_)
   {
      _loc3_.layerObject2Flip = oNewCell.layerObject2Flip;
   }
   if(_loc11_)
   {
      _loc3_.layerObject2Interactive = oNewCell.layerObject2Interactive;
   }
   if(_loc21_)
   {
      _loc3_.layerObject2Num = oNewCell.layerObject2Num;
   }
   if(_loc20_)
   {
      _loc3_.layerObjectExternal = oNewCell.layerObjectExternal;
   }
   if(_loc14_)
   {
      _loc3_.layerObjectExternalInteractive = oNewCell.layerObjectExternalInteractive;
   }
   if(_loc12_)
   {
      _loc3_.layerObjectExternalAutoSize = oNewCell.layerObjectExternalAutoSize;
   }
   _loc3_.layerObjectExternalData = oNewCell.layerObjectExternalData;
   _loc3_.estrellas = oNewCell.estrellas;
   this.build(this._oDatacenter.Map,nCellNum);
};
