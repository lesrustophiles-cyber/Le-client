var _loc1 = ank.battlefield.mc.ExternalContainer.prototype;
_loc1.clear = function()
{
   this.InteractionCell.removeMovieClip();
   this.createEmptyMovieClip("InteractionCell",100);
   var _loc4_;
   if(this.Ground == undefined)
   {
      this.createEmptyMovieClip("Ground",200);
      this.Ground.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["ExternalContainer/Ground"];
      if(ank.battlefield["\x12\x03"].USE_STREAMING_FILES && ank.battlefield["\x12\x03"].STREAMING_METHOD == "explod")
      {
         this._parent.onLoadInit(ank.battlefield.mc.ExternalContainer);
      }
      else
      {
         _loc4_ = new MovieClipLoader();
         _loc4_.addListener(this._parent._parent);
         _loc4_.loadClip(this._sGroundFile,this.Ground);
      }
   }
   else
   {
      if(ank.battlefield["\x12\x03"].USE_STREAMING_FILES || ank.battlefield["\x12\x03"].STREAMING_METHOD == "compact")
      {
         for(var _loc3_ in this.Ground)
         {
            if(typeof this.Ground[_loc3_] == "movieclip")
            {
               if(ank.battlefield["\x12\x03"].STREAMING_METHOD == "compact" && (this.Ground[_loc3_]._name == "InteractionCell" || this.Ground[_loc3_]._name == "Select"))
               {
                  continue;
               }
               this.Ground[_loc3_].unloadMovie();
               this.Ground[_loc3_].removeMovieClip();
            }
         }
      }
      this.Ground.clear();
   }
   if(ank.battlefield["\x12\x03"].USE_STREAMING_FILES && ank.battlefield["\x12\x03"].STREAMING_METHOD == "explod")
   {
      for(_loc3_ in this.Object1)
      {
         if(typeof this.Object1[_loc3_] == "movieclip")
         {
            this.Object1[_loc3_].unloadMovie();
            this.Object1[_loc3_].removeMovieClip();
         }
      }
      this.Object1.clear();
   }
   this.Object1.removeMovieClip();
   this.createEmptyMovieClip("Object1",300);
   this.Object1.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["ExternalContainer/Object1"];
   this.Grid.removeMovieClip();
   this.createEmptyMovieClip("Grid",400);
   this.Grid.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["ExternalContainer/Grid"];
   this.Zone.removeMovieClip();
   this.createEmptyMovieClip("Zone",500);
   this.Zone.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["ExternalContainer/Zone"];
   this.Select.removeMovieClip();
   this.createEmptyMovieClip("Select",600);
   this.Select.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["ExternalContainer/Select"];
   this.Pointer.removeMovieClip();
   this.createEmptyMovieClip("Pointer",700);
   this.Pointer.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["ExternalContainer/Pointer"];
   if(ank.battlefield["\x12\x03"].USE_STREAMING_FILES && ank.battlefield["\x12\x03"].STREAMING_METHOD == "explod")
   {
      for(_loc3_ in this.Object2)
      {
         if(typeof this.Object1[_loc3_] == "movieclip")
         {
            this.Object2[_loc3_].unloadMovie();
            this.Object2[_loc3_].removeMovieClip();
         }
      }
      this.Object2.clear();
   }
   this.Object2.removeMovieClip();
   this.createEmptyMovieClip("Object2",800);
   this.Object2.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["ExternalContainer/Object2"];
   this.Object2.__proto__ = MovieClip.prototype;
   this.Visual.removeMovieClip();
   this.createEmptyMovieClip("Visual",900);
};
