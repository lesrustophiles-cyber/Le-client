var _loc1 = ank.gapi.controls.Loader.prototype;
_loc1.load = function()
{
   if(this._sPrevURL == undefined && this._sURL == "")
   {
      return undefined;
   }
   if(!this._bForceReload && (this._sPrevURL == this._sURL || this._sURL == undefined || this.holder_mc == undefined))
   {
      return undefined;
   }
   this._visible = false;
   this._bLoaded = false;
   this._sPrevURL = this._sURL;
   this.holder_mc.content_mc.removeMovieClip();
   var _loc2_ = this.holder_mc.attachMovie(this._sURL,"content_mc",1,this._oParams);
   if(this._sURL == "")
   {
      return undefined;
   }
   if(this.holder_mc.content_mc == undefined)
   {
      this.holder_mc.createEmptyMovieClip("content_mc",1);
      this._mvlLoader.loadClip(this._sURL,this.holder_mc.content_mc);
   }
   else
   {
      this.onLoadComplete(this.holder_mc.content_mc);
      this.onLoadInit(this.holder_mc.content_mc);
   }
};
