if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.graphics)
{
   _global.dofus.graphics = new Object();
}
if(!dofus.graphics.gapi)
{
   _global.dofus.graphics.gapi = new Object();
}
if(!dofus.graphics.gapi.ui)
{
   _global.dofus.graphics.gapi.ui = new Object();
}
_global.dofus.graphics.gapi.ui.DungeonBoss = function()
{
   super();
};
dofus.graphics.gapi.ui.DungeonBoss.prototype = new ank.gapi.core.UIAdvancedComponent();
var _loc1 = _global.dofus.graphics.gapi.ui.DungeonBoss.prototype;
_loc1.__set__bossGfxId = function(nValue)
{
   this._nBossGfxId = Number(nValue);
};
_loc1.__set__bossName = function(sValue)
{
   this._sBossName = sValue;
};
_loc1.__set__bossLevel = function(nValue)
{
   this._nBossLevel = Number(nValue);
};
_loc1.__set__currentStasis = function(nValue)
{
   this._nCurrentStasis = Number(nValue);
};
_loc1.__set__maxStasis = function(nValue)
{
   this._nMaxStasis = Math.max(1,Number(nValue));
};
_loc1.init = function()
{
   super.init(false,dofus.graphics.gapi.ui.DungeonBoss.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initLayout});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initLayout = function()
{
   var _loc2_ = 24;
   this._winBg = this.attachMovie("Window","_winBg",this.getNextHighestDepth(),{_x:170,_y:62,_width:460,_height:365});
   this._winBg.title = "BOSS DONJON";
   this._ldrBossArtwork = this.attachMovie("Loader","_ldrBossArtwork",this.getNextHighestDepth(),{_x:190,_y:95,_width:190,_height:190,scaleContent:true,autoLoad:false});
   this._lblBossName = this.attachMovie("Label","_lblBossName",this.getNextHighestDepth(),{_x:394,_y:115,_width:215,_height:_loc2_});
   this._lblBossName.styleName = "DungeonBossNameLabel";
   this._lblBossLevel = this.attachMovie("Label","_lblBossLevel",this.getNextHighestDepth(),{_x:394,_y:145,_width:215,_height:_loc2_});
   this._lblBossLevel.styleName = "DungeonBossValueLabel";
   this._lblStasisValue = this.attachMovie("Label","_lblStasisValue",this.getNextHighestDepth(),{_x:202,_y:301,_width:400,_height:_loc2_});
   this._lblStasisValue.styleName = "DungeonBossValueLabel";
   this._pbStasis = this.attachMovie("ProgressBar","_pbStasis",this.getNextHighestDepth(),{_x:202,_y:328,_width:400,_height:14});
   this._lblMarker25 = this.attachMovie("Label","_lblMarker25",this.getNextHighestDepth(),{_x:284,_y:343,_width:50,_height:18,text:"25%"});
   this._lblMarker50 = this.attachMovie("Label","_lblMarker50",this.getNextHighestDepth(),{_x:384,_y:343,_width:50,_height:18,text:"50%"});
   this._lblMarker75 = this.attachMovie("Label","_lblMarker75",this.getNextHighestDepth(),{_x:484,_y:343,_width:50,_height:18,text:"75%"});
   this._btnClose = this.attachMovie("Button","_btnClose",this.getNextHighestDepth(),{_x:534,_y:386,_width:72,_height:24,label:this.api.lang.getText("CLOSE")});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
};
_loc1.initData = function()
{
   this._lblBossName.text = this._sBossName;
   this._lblBossLevel.text = this.api.lang.getText("LEVEL") + " " + this._nBossLevel;
   this._lblStasisValue.text = "Stasis : " + this._nCurrentStasis + " / " + this._nMaxStasis;
   this._pbStasis.minimum = 0;
   this._pbStasis.maximum = this._nMaxStasis;
   this._pbStasis.value = this._nCurrentStasis;
   this.updateGaugeColor();
   if(this._nBossGfxId > 0)
   {
      this._ldrBossArtwork.contentPath = dofus.Constants.ARTWORKS_BIG_PATH + this._nBossGfxId + ".swf";
   }
};
_loc1.updateGaugeColor = function()
{
   var _loc2_ = this._nCurrentStasis / this._nMaxStasis * 100;
   if(_loc2_ < 25)
   {
      this._pbStasis.styleName = "StasisGaugeGreen";
   }
   else if(_loc2_ < 50)
   {
      this._pbStasis.styleName = "StasisGaugeYellow";
   }
   else if(_loc2_ < 75)
   {
      this._pbStasis.styleName = "StasisGaugeOrange";
   }
   else
   {
      this._pbStasis.styleName = "StasisGaugeRed";
   }
};
_loc1.click = function(oEvent)
{
   if(oEvent.target == this._btnClose)
   {
      this.api.ui.unloadUIComponent(dofus.graphics.gapi.ui.DungeonBoss.CLASS_NAME);
   }
};
_loc1.addProperty("bossGfxId",function()
{
}
,_loc1.__set__bossGfxId);
_loc1.addProperty("bossName",function()
{
}
,_loc1.__set__bossName);
_loc1.addProperty("bossLevel",function()
{
}
,_loc1.__set__bossLevel);
_loc1.addProperty("currentStasis",function()
{
}
,_loc1.__set__currentStasis);
_loc1.addProperty("maxStasis",function()
{
}
,_loc1.__set__maxStasis);
ASSetPropFlags(_loc1,null,1);
_loc1._nBossGfxId = 0;
_loc1._sBossName = "";
_loc1._nBossLevel = 1;
_loc1._nCurrentStasis = 0;
_loc1._nMaxStasis = 100;
_global.dofus.graphics.gapi.ui.DungeonBoss.CLASS_NAME = "DungeonBoss";
