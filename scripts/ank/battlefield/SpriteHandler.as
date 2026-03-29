var _loc1 = _global.ank.battlefield["\x1e\x0e\x0f"].prototype;
_loc1.addSpriteExtraClip = function(sID, clipFile, col, bTop, bTurno)
{
   var _loc2_ = this._oSprites.getItemAt(sID);
   if(_loc2_ == undefined)
   {
      ank["\x1e\n\t"]["\x0b\x0b"].err("[addSpriteExtraClip] Sprite " + sID + " inexistant");
      return undefined;
   }
   if(bTurno == undefined || !bTurno)
   {
      _loc2_.mc.addExtraClip(clipFile,col,bTop);
   }
   else
   {
      _loc2_.mc.addExtraClipTurno(clipFile);
   }
};
_loc1.addEstiloVIP = function(sID)
{
   var _loc2_ = this._oSprites.getItemAt(sID);
   if(_loc2_ == undefined)
   {
      ank["\x1e\n\t"]["\x0b\x0b"].err("[addSpriteExtraClip] Sprite " + sID + " inexistant");
      return undefined;
   }
   _loc2_.mc.addEstiloVIP();
};
_loc1.launchVisualEffect2 = function(sID, oEffectData, nCellNum, nDisplayType, mSpriteAnimation, nVeces, nDuracion, nTalla)
{
   var _loc5_ = this._oSprites.getItemAt(sID);
   if(_loc5_ == undefined)
   {
      ank["\x1e\n\t"]["\x0b\x0b"].err("[launchVisualEffect] Sprite " + sID + " inexistant");
      return undefined;
   }
   var _loc8_;
   var _loc4_ = _loc5_.mc;
   var _loc3_ = new ank["\x1e\n\t"]["\x1e\x12\x16"](1000);
   var _loc23_ = true;
   var _loc26_ = false;
   _loc4_._ACTION = _loc5_;
   _loc4_._OBJECT = _loc4_;
   _loc3_.addAction(false,this,this.autoCalculateSpriteDirection,[sID,nCellNum]);
   var _loc20_;
   var _loc16_;
   var _loc19_;
   var _loc18_;
   var _loc17_;
   var _loc10_;
   var _loc22_;
   var _loc21_;
   if(mSpriteAnimation != undefined)
   {
      _loc20_ = typeof mSpriteAnimation;
      if(_loc20_ == "object")
      {
         if(mSpriteAnimation.length >= 3)
         {
            _loc16_ = _loc5_.cellNum;
            _loc19_ = this._mcBattlefield.mapHandler.getCellData(_loc16_);
            _loc18_ = this._mcBattlefield.mapHandler.getCellData(nCellNum);
            _loc17_ = ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getDirectionFromCoordinates(_loc19_.x,_loc19_.y,_loc18_.x,_loc18_.y,false);
            _loc10_ = ank.battlefield["\x1e\n\t"]["\x12\r"].makeFullPath(this._mcBattlefield.mapHandler,ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].pathFind(this._mcBattlefield.mapHandler,_loc16_,nCellNum,{bIgnoreSprites:true,bWithBeginCellNum:true}));
            _loc10_.pop();
            _loc22_ = _loc10_[_loc10_.length - 1];
            this.moveSprite(sID,_loc10_,_loc3_,false,mSpriteAnimation[0],false,true);
            _loc3_.addAction(false,_loc4_,_loc4_.setDirection,[ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].convertHeightToFourDirection(_loc17_)]);
            _loc3_.addAction(true,_loc4_,_loc4_.setAnim,[mSpriteAnimation[1]]);
            _loc21_ = ank.battlefield["\x1e\n\t"]["\x12\r"].makeFullPath(this._mcBattlefield.mapHandler,ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].pathFind(this._mcBattlefield.mapHandler,_loc22_,_loc16_,{bIgnoreSprites:true,bWithBeginCellNum:true}));
            this.moveSprite(sID,_loc21_,_loc3_,false,mSpriteAnimation[2],false,true);
            _loc3_.addAction(false,_loc4_,_loc4_.setDirection,[_loc17_]);
            if(mSpriteAnimation[3] != undefined)
            {
               _loc3_.addAction(false,_loc4_,_loc4_.setAnim,[mSpriteAnimation[3]]);
            }
         }
      }
      else if(_loc20_ == "string")
      {
         _loc3_.addAction(true,_loc4_,_loc4_.setAnim,[mSpriteAnimation,false,true]);
      }
   }
   var _loc2_ = 1;
   while(_loc2_ <= nVeces)
   {
      _loc3_.addAction(true,this._mcBattlefield.visualEffectHandler,this._mcBattlefield.visualEffectHandler.addEffect,[_loc5_,oEffectData,nCellNum,nDisplayType,_loc8_,true,true,nTalla],nDuracion);
      _loc2_ = _loc2_ + 1;
   }
   _loc3_.execute();
};
_loc1.refreshPositions = function()
{
   var _loc2_ = this._oSprites.getItems();
   for(var _loc3_ in _loc2_)
   {
      if(!_loc2_.isClear)
      {
         this.setSpritePosition2(_loc2_[_loc3_].id,_loc2_[_loc3_].cellNum,_loc2_[_loc3_].direction);
      }
   }
};
_loc1.setSpritePosition2 = function(sID, nCellNum, nDir)
{
   var _loc7_ = this._oSprites.getItemAt(sID);
   if(_loc7_ == undefined)
   {
      ank["\x1e\n\t"]["\x0b\x0b"].err("[setSpritePosition] Sprite " + sID + " inexistant");
      return undefined;
   }
   if(_global.isNaN(Number(nCellNum)))
   {
      ank["\x1e\n\t"]["\x0b\x0b"].err("[setSpritePosition] cellNum n\'est pas un nombre");
      return undefined;
   }
   if(Number(nCellNum) < 0 || Number(nCellNum) > this._mcBattlefield.mapHandler.getCellCount())
   {
      ank["\x1e\n\t"]["\x0b\x0b"].err("[setSpritePosition] cellNum invalide");
      return undefined;
   }
   var _loc3_;
   var _loc4_;
   if(_loc7_.hasChilds)
   {
      _loc3_ = _loc7_.linkedChilds.getItems();
      for(var _loc8_ in _loc3_)
      {
         _loc4_ = ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getArroundCellNum(this._mcBattlefield.mapHandler,nCellNum,nDir,_loc3_[_loc8_].childIndex);
         this.setSpriteDirection(_loc3_[_loc8_].id,_loc4_,nDir);
      }
   }
   this._mcBattlefield.removeSpriteBubble(sID);
   this._mcBattlefield.hideSpriteOverHead(sID);
   if(nDir != undefined)
   {
      _loc7_.direction = nDir;
   }
   var _loc10_ = _loc7_.mc;
   _loc10_.setPosition2(nCellNum);
};
