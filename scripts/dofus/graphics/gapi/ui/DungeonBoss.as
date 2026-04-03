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
   var _loc3_ = this.getNextHighestDepth();
   this._winBg = this.attachMovie("Window","_winBg",_loc3_,{_x:152,_y:40,_width:495,_height:390});
   this._winBg.title = "BOSS DE DONJON";
   _loc3_ = this.getNextHighestDepth();
   this._mcRetroBg = this.createEmptyMovieClip("_mcRetroBg",_loc3_);
   this._mcRetroBg._x = 173;
   this._mcRetroBg._y = 83;
   this.drawPanel(this._mcRetroBg,453,275,3029575,7368816,100);
   _loc3_ = this.getNextHighestDepth();
   this._ldrBossArtwork = this.attachMovie("Loader","_ldrBossArtwork",_loc3_,{_x:188,_y:95,_width:220,_height:220,scaleContent:true,autoLoad:false});
   _loc3_ = this.getNextHighestDepth();
   this._lblBossName = this.attachMovie("Label","_lblBossName",_loc3_,{_x:417,_y:104,_width:214,_height:25,text:"-"});
   this._lblBossName.styleName = "DungeonBossNameLabel";
   _loc3_ = this.getNextHighestDepth();
   this._lblBossLevel = this.attachMovie("Label","_lblBossLevel",_loc3_,{_x:417,_y:132,_width:214,_height:22,text:"-"});
   this._lblBossLevel.styleName = "DungeonBossValueLabel";
   _loc3_ = this.getNextHighestDepth();
   this._lblTier = this.attachMovie("Label","_lblTier",_loc3_,{_x:417,_y:160,_width:214,_height:20,text:"-"});
   this._lblTier.styleName = "DungeonBossTierLabel";
   _loc3_ = this.getNextHighestDepth();
   this._lblStasisValue = this.attachMovie("Label","_lblStasisValue",_loc3_,{_x:188,_y:325,_width:430,_height:20,text:"0 / 0"});
   this._lblStasisValue.styleName = "DungeonBossValueLabel";
   _loc3_ = this.getNextHighestDepth();
   this._pbStasis = this.attachMovie("ProgressBar","_pbStasis",_loc3_,{_x:188,_y:348,_width:430,_height:13});
   _loc3_ = this.getNextHighestDepth();
   this._lblMarker25 = this.attachMovie("Label","_lblMarker25",_loc3_,{_x:285,_y:360,_width:36,_height:15,text:"25"});
   _loc3_ = this.getNextHighestDepth();
   this._lblMarker50 = this.attachMovie("Label","_lblMarker50",_loc3_,{_x:392,_y:360,_width:36,_height:15,text:"50"});
   _loc3_ = this.getNextHighestDepth();
   this._lblMarker75 = this.attachMovie("Label","_lblMarker75",_loc3_,{_x:500,_y:360,_width:36,_height:15,text:"75"});
   _loc3_ = this.getNextHighestDepth();
   this._btnClose = this.attachMovie("Button","_btnClose",_loc3_,{_x:544,_y:392,_width:74,_height:24,label:this.api.lang.getText("CLOSE")});
};
_loc1.drawPanel = function(mcTarget, nWidth, nHeight, nColor, nBorderColor, nAlpha)
{
   mcTarget.clear();
   mcTarget.lineStyle(2,nBorderColor,100);
   mcTarget.beginFill(nColor,nAlpha);
   mcTarget.moveTo(0,0);
   mcTarget.lineTo(nWidth,0);
   mcTarget.lineTo(nWidth,nHeight);
   mcTarget.lineTo(0,nHeight);
   mcTarget.lineTo(0,0);
   mcTarget.endFill();
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
};
_loc1.initData = function()
{
   this.applyBossData(this._nBossGfxId,this._sBossName,this._nBossLevel,this._nCurrentStasis,this._nMaxStasis);
};
_loc1.applyBossData = function(nBossGfxId, sBossName, nBossLevel, nCurrentStasis, nMaxStasis)
{
   this._nBossGfxId = Number(nBossGfxId);
   this._sBossName = sBossName == undefined || sBossName.length == 0 ? "Boss inconnu" : sBossName;
   this._nBossLevel = Math.max(1,Number(nBossLevel));
   this._nMaxStasis = Math.max(1,Number(nMaxStasis));
   this._nCurrentStasis = Math.max(0,Math.min(this._nMaxStasis,Number(nCurrentStasis)));
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
      this._lblTier.text = "Palier I - Menace faible";
   }
   else if(_loc2_ < 50)
   {
      this._pbStasis.styleName = "StasisGaugeYellow";
      this._lblTier.text = "Palier II - Menace modérée";
   }
   else if(_loc2_ < 75)
   {
      this._pbStasis.styleName = "StasisGaugeOrange";
      this._lblTier.text = "Palier III - Menace élevée";
   }
   else
   {
      this._pbStasis.styleName = "StasisGaugeRed";
      this._lblTier.text = "Palier IV - Menace extrême";
   }
};
_loc1.updateFromServer = function(nBossGfxId, sBossName, nBossLevel, nCurrentStasis, nMaxStasis)
{
   this.applyBossData(nBossGfxId,sBossName,nBossLevel,nCurrentStasis,nMaxStasis);
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
