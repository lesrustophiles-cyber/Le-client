var _loc1 = dofus["\r\x13"].gapi.controls.BannerSpriteInfos.prototype;
_loc1.update = function(_loc2_)
{
   this.removeSpriteListeners();
   this.data = _loc2_;
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.addSpriteListeners});
};
_loc1.__set__data = function(_loc2_)
{
   this._oSprite = _loc2_;
   return this._oData();
};
_loc1.initData = function()
{
   this._lblName.text = this._oSprite.name;
   this._lblLevel.text = this.api.lang.getText("LEVEL") + " " + this._oSprite.Level;
   this._lblLP.text = _global.isNaN(this._oSprite.LP) ? "" : this._oSprite.LP;
   this._lblAP.text = _global.isNaN(this._oSprite.AP) ? "" : String(Math.max(0,this._oSprite.AP));
   this._lblMP.text = _global.isNaN(this._oSprite.MP) ? "" : String(Math.max(0,this._oSprite.MP));
   this._lblAverageDamages.text = this._oSprite.averageDamages;
   this._ldrSprite.contentPath = this._oSprite.artworkFile;
   this.updateResistances();
};
_loc1.monsterChanged = function(_loc2_)
{
   this._lblName.text = this._oSprite.name;
   this._lblLevel.text = this.api.lang.getText("LEVEL") + " " + this._oSprite.Level;
   this._lblLP.text = _global.isNaN(this._oSprite.LP) ? "" : this._oSprite.LP;
   this._lblAP.text = _global.isNaN(this._oSprite.AP) ? "" : String(Math.max(0,this._oSprite.AP));
   this._lblMP.text = _global.isNaN(this._oSprite.MP) ? "" : String(Math.max(0,this._oSprite.MP));
   this._lblAverageDamages.text = this._oSprite.averageDamages;
   this._ldrSprite.contentPath = this._oSprite.artworkFile;
   this.updateResistances();
};
_loc1.addListeners = function()
{
   this._ldrSprite.addEventListener("initialization",this);
   this._ldrSprite.addEventListener("complete",this);
   this.addSpriteListeners();
};
_loc1.removeSpriteListeners = function()
{
   this._oSprite.removeEventListener("apChanged",this);
   this._oSprite.removeEventListener("mpChanged",this);
   this._oSprite.removeEventListener("lpChanged",this);
   this._oSprite.removeEventListener("resistancesChanged",this);
   this._oSprite.removeEventListener("monsterChanged",this);
};
_loc1.addSpriteListeners = function()
{
   this._oSprite.addEventListener("apChanged",this);
   this._oSprite.addEventListener("mpChanged",this);
   this._oSprite.addEventListener("lpChanged",this);
   this._oSprite.addEventListener("resistancesChanged",this);
   this._oSprite.addEventListener("monsterChanged",this);
};
_loc1.apChanged = function(_loc2_)
{
   this._lblAP.text = String(Math.max(0,_loc2_.value));
};
_loc1.mpChanged = function(_loc2_)
{
   this._lblMP.text = String(Math.max(0,_loc2_.value));
};
_loc1.lpChanged = function(_loc2_)
{
   this._lblLP.text = String(_loc2_.value);
};
_loc1.resistancesChanged = function(_loc2_)
{
   this.updateResistances();
};
_loc1.updateResistances = function()
{
   var _loc2_ = this._oSprite.resistances;
   this._lblNeutral.text = _loc2_[0] == undefined ? "0%" : _loc2_[0] + "%";
   this._lblEarth.text = _loc2_[1] == undefined ? "0%" : _loc2_[1] + "%";
   this._lblFire.text = _loc2_[2] == undefined ? "0%" : _loc2_[2] + "%";
   this._lblWater.text = _loc2_[3] == undefined ? "0%" : _loc2_[3] + "%";
   this._lblAir.text = _loc2_[4] == undefined ? "0%" : _loc2_[4] + "%";
   this._lblDodgeAP.text = _loc2_[5] == undefined ? "0%" : _loc2_[5] + "%";
   this._lblDodgeMP.text = _loc2_[6] == undefined ? "0%" : _loc2_[6] + "%";
};
