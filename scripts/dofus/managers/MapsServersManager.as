var _loc1 = _global.dofus["\x0b\x07"].MapsServersManager.prototype;
_loc1.parseMap2 = function(sID, sDate, oData)
{
   if(this.api.network.Game.isBusy)
   {
      this.addToQueue({object:this,method:this.parseMap2,params:[sID,sDate,oData]});
      return undefined;
   }
   var _loc6_;
   if(oData == undefined)
   {
      oData = this.api.lang.getValueFromSOMapData("MAP_" + sID).data;
      if((oData.id == undefined || oData.date != sDate) && oData.id != sID)
      {
         this.api.network.send("GDm" + sID);
         return undefined;
      }
   }
   else
   {
      _loc6_ = this.api.lang.getValueFromSOMapData("MAP_" + sID);
      _loc6_.data = oData;
      _loc6_.flush();
   }
   var _loc4_ = Number(oData.id);
   this._bCustomFileCall = false;
   if(this.api.network.Game.nLastMapIdReceived != _loc4_ && this.api.network.Game.nLastMapIdReceived != -1)
   {
      this.api.gfx.onMapLoaded();
      return undefined;
   }
   this._bBuildingMap = true;
   this._lastLoadedMap = oData;
   var _loc11_ = this.getMapName(_loc4_);
   var _loc7_ = Number(oData.width);
   var _loc9_ = Number(oData.height);
   var _loc16_ = Number(oData.backgroundNum);
   var _loc17_ = oData.mapData;
   var _loc14_ = oData.ambianceId;
   var _loc10_ = oData.musicId;
   var _loc12_ = oData.bOutdoor != 1 ? false : true;
   var _loc15_ = (oData.capabilities & 1) == 0;
   var _loc8_ = (oData.capabilities >> 1 & 1) == 0;
   var _loc18_ = (oData.capabilities >> 2 & 1) == 0;
   var _loc13_ = (oData.capabilities >> 3 & 1) == 0;
   this.api.datacenter.Basics.aks_current_map_id = _loc4_;
   this.api.kernel.TipsManager.onNewMap(_loc4_);
   this.api.kernel.StreamingDisplayManager.onNewMap(_loc4_);
   var _loc3_ = new dofus.datacenter["\x10\x14"](_loc4_);
   _loc3_.bCanChallenge = _loc15_;
   _loc3_.bCanAttack = _loc8_;
   _loc3_.bSaveTeleport = _loc18_;
   _loc3_.bUseTeleport = _loc13_;
   _loc3_.bOutdoor = _loc12_;
   _loc3_.ambianceID = _loc14_;
   _loc3_.musicID = _loc10_;
   this.api.gfx.buildMap(_loc4_,_loc11_,_loc7_,_loc9_,_loc16_,_loc17_,_loc3_);
   this._bBuildingMap = false;
};
