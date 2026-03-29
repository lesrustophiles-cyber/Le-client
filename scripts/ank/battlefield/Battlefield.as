var _loc1 = _global.ank.battlefield["\x1c\n"].prototype;
_loc1.setObject2Frame = function(nCellNum, frame)
{
   if(!this.isMapBuild)
   {
      return undefined;
   }
   this.mapHandler.setObject2Frame(nCellNum,frame);
};
_loc1.setObject2Interactive = function(nCellNum, bInteractive, nPermanentLevel, nEstrellas)
{
   if(!this.isMapBuild)
   {
      return undefined;
   }
   this.mapHandler.setObject2Interactive(nCellNum,bInteractive,nPermanentLevel,nEstrellas);
};
_loc1.activarModoTactico = function(bModoTactico)
{
   if(!this.isMapBuild)
   {
      return undefined;
   }
   _global.BUILD_TACTICO = bModoTactico == true;
   this.mapHandler.modoTactico(bModoTactico);
   this.refreshPositions();
   this.zoneHandler._visible = !bModoTactico;
   this.pointerHandler._visible = !bModoTactico;
   this.selectionHandler._visible = !bModoTactico;
   this.gridHandler._visible = !bModoTactico;
   return undefined;
};
_loc1.createHandlers = function(Void)
{
   this.mapHandler = new ank.battlefield["\x0b\x05"](this,this._mcMainContainer,this._oDatacenter);
   this.spriteHandler = new ank.battlefield["\x1e\x0e\x0f"](this,this._mcMainContainer.ExternalContainer.Object2,this._oDatacenter.Sprites);
   this.interactionHandler = new ank.battlefield["\f\x11"](this._mcMainContainer.ExternalContainer.InteractionCell,this._oDatacenter);
   this.zoneHandler = new ank.battlefield["\x1e\t\x04"](this,this._mcMainContainer.ExternalContainer.Zone);
   this.pointerHandler = new ank.battlefield["\x1e\x16\r"](this,this._mcMainContainer.ExternalContainer.Pointer);
   this.selectionHandler = new ank.battlefield["\x1e\x12\x1b"](this,this._mcMainContainer.ExternalContainer,this._oDatacenter);
   this.gridHandler = new ank.battlefield["\r\x12"](this._mcMainContainer.ExternalContainer.Grid,this._oDatacenter);
   this.visualEffectHandler = new ank.battlefield["\x1e\n\x02"](this,this._mcMainContainer.ExternalContainer.Visual);
   this.textHandler = new ank.battlefield["\x1e\x0b\t"](this,this._mcMainContainer.Text,this._oDatacenter);
   this.pointsHandler = new ank.battlefield["\x1e\x16\f"](this,this._mcMainContainer.Points,this._oDatacenter);
   this.overHeadHandler = new ank.battlefield["\x1e\x17\b"](this,this._mcMainContainer.OverHead);
};
_loc1.onLoadInit = function(mc)
{
   if(mc._name !== "Ground")
   {
      mc.__proto__ = ank.battlefield.mc.ExternalContainer.prototype;
      mc.initialize(this._sGroundFile);
      this.createHandlers();
   }
   else
   {
      mc._parent.useCustomGroundGfxFile(this._bUseCustomGroundGfxFile);
      this.bCustomFileLoaded = true;
      this.onInitComplete();
   }
};
_loc1.refreshPositions = function()
{
   this.spriteHandler.refreshPositions();
};
_loc1.addSpriteExtraClip = function(sID, sFile, nColor, bTop, bTurno)
{
   this.spriteHandler.addSpriteExtraClip(sID,sFile,nColor,bTop,bTurno);
};
_loc1.spriteLaunchVisualEffect2 = function(sID, oEffectData, nCellNum, nDisplayType, mSpriteAnimation, sVeces, nDuracion, nTalla)
{
   if(!this.isMapBuild)
   {
      return undefined;
   }
   this.spriteHandler.launchVisualEffect2(sID,oEffectData,nCellNum,nDisplayType,mSpriteAnimation,sVeces,nDuracion,nTalla);
};
