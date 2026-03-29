var _loc1 = dofus["\r\x13"].gapi.ui.CardsCollection.prototype;
_loc1.__set__Mobs = function(sMobs)
{
   this._aMobs = new Array();
   var _loc4_;
   var _loc2_;
   var _loc3_;
   if(sMobs.length > 0)
   {
      _loc4_ = sMobs.split(",");
      for(var _loc8_ in _loc4_)
      {
         _loc2_ = Number(_loc4_[_loc8_]);
         _loc3_ = this.api.lang.getMonstersText(_loc2_);
         this._aMobs.push({id:_loc2_,name:_loc3_.n,gfxFile:_loc3_.g});
      }
      this._aMobs.sortOn("name");
   }
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initAnimList});
};
_loc1.initTexts = function()
{
   this._lblSpells.text = "LISTE DES SORTS";
   this._lblDrops.text = "LISTE DES DROPS";
   this._textresume.text = this._aMobs.length + " -  Monstres sur la Map";
   this._btnSearchMob.label = "Monstres";
   this._btnSearchDrop.label = "Items";
   this._btnLocate.label = "Localiser";
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   var _loc2_ = 0;
   var _loc3_;
   while(true)
   {
      _loc2_ += 1;
      if(_loc2_ > 9)
      {
         break;
      }
      _loc3_ = this["_ctr" + _loc2_];
      _loc3_.addEventListener("click",this);
      _loc3_.addEventListener("over",this);
      _loc3_.addEventListener("out",this);
   }
   _loc2_ = 0;
   while(true)
   {
      _loc2_ += 1;
      if(_loc2_ > 6)
      {
         break;
      }
      _loc3_ = this["_btnLevel" + _loc2_];
      _loc3_.addEventListener("click",this);
      _loc3_.enabled = false;
   }
   this._btnDer.addEventListener("click",this);
   this._btnIzq.addEventListener("click",this);
   this._btnSearchMob.addEventListener("click",this);
   this._btnLocate.addEventListener("click",this);
   this._btnLocate.enabled = false;
   this._btnSearchDrop.addEventListener("click",this);
   this._lstSpells.addEventListener("itemSelected",this);
   this._lstDrops.addEventListener("itemSelected",this);
   this._cbAnim.addEventListener("itemSelected",this);
   this._tiSearch.onSetFocus = function()
   {
      this.api.kernel.OptionsManager.setOption("BannerShortcuts",false);
      this._tiSearch.text = "";
   };
   this._tiSearch.onKillFocus = function()
   {
      this.api.kernel.OptionsManager.setOption("BannerShortcuts",true);
   };
};
_loc1.initAnimList = function(eaTypes)
{
   var _loc4_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc2_ = 0;
   while(true)
   {
      _loc2_ = _loc2_ + 1;
      if(_loc2_ >= dofus["\r\x13"].gapi.ui.MonsterAndLookSelector.ANIM_LIST.length)
      {
         break;
      }
      _loc4_.push({label:dofus["\r\x13"].gapi.ui.MonsterAndLookSelector.ANIM_LIST[_loc2_]});
   }
   this._cbAnim.dataProvider = _loc4_;
};
_loc1.initData = function()
{
   this._cciSprite.deleteButton = false;
   this._btnIzq._visible = false;
   this._mcSpellFullInfosPlacer._visible = false;
   this.infoDrop(false);
   this._nMaxPages = _global.parseInt(this._aMobs.length / 9) + 1;
   if(this._nMaxPages > Number(1))
   {
      this._btnDer._visible = true;
   }
   else
   {
      this._btnDer._visible = false;
   }
   this._txtPage.text = this._nPage + "/" + this._nMaxPages;
   this.actualizarData();
};
_loc1.buscarMob = function(sFilter)
{
   this._aMobs = new Array();
   var _loc2_;
   var _loc3_;
   for(var _loc8_ in this._realMobs)
   {
      _loc2_ = this._realMobs[_loc8_];
      _loc3_ = _loc2_.name;
      if(!(sFilter.length > 0 && _loc3_.toUpperCase().indexOf(sFilter.toUpperCase()) == -1))
      {
         this._aMobs.push({id:_loc2_.id,name:_loc2_.name,gfxFile:_loc2_.gfxFile});
      }
   }
   this._aMobs.sortOn("name");
   this._nPage = 1;
   this.actualizarData();
   this.api.network.send("ZV" + sFilter);
};
_loc1.buscarDrop = function(sFilter)
{
   if(sFilter == undefined || sFilter == "")
   {
      this.buscarMob("");
      return undefined;
   }
   var _loc3_ = "";
   var _loc2_;
   var _loc4_;
   for(var _loc6_ in this._aDrops)
   {
      _loc2_ = this._aDrops[_loc6_];
      _loc4_ = _loc2_.name;
      if(!(sFilter.length > 0 && _loc4_.toUpperCase().indexOf(sFilter.toUpperCase()) == -1))
      {
         if(_loc3_.length > 0)
         {
            _loc3_ += ",";
         }
         _loc3_ += _loc2_.id;
      }
   }
   this.api.network.send("Zv" + sFilter);
};
_loc1.mostrarMobsDrops = function(sMobs)
{
   this._aMobs = new Array();
   var _loc3_ = sMobs.split(",");
   var _loc4_ = new Object();
   var _loc2_;
   for(var _loc8_ in _loc3_)
   {
      _loc2_ = Number(_loc3_[_loc8_]);
      _loc4_[_loc2_] = true;
   }
   for(_loc8_ in this._realMobs)
   {
      _loc2_ = this._realMobs[_loc8_];
      if(_loc4_[_loc2_.id])
      {
         this._aMobs.push({id:_loc2_.id,name:_loc2_.name,gfxFile:_loc2_.gfxFile});
      }
   }
   this._aMobs.sortOn("name");
   this._nPage = 1;
   this.actualizarData();
};
_loc1.actualizarData = function()
{
   var _loc2_ = 0;
   var _loc4_;
   var _loc3_;
   while(true)
   {
      _loc2_ += 1;
      if(_loc2_ > 9)
      {
         break;
      }
      _loc4_ = Number((this._nPage - 1) * 9) + _loc2_;
      this["_ctr" + _loc2_].forceNextLoad();
      if(_loc4_ > this._aMobs.length)
      {
         this["_ctr" + _loc2_].contentData = {iconFile:"Card",params:{name:"",gfxFile:""}};
      }
      else
      {
         _loc3_ = this._aMobs[_loc4_ - 1];
         this["_ctr" + _loc2_].contentData = {iconFile:"Card",params:{name:_loc3_.name,gfxFile:dofus.Constants.ARTWORKS_BIG_PATH + _loc3_.gfxFile + ".swf"},id:_loc3_.id,gfxId:_loc3_.gfxFile,name:_loc3_.name};
      }
   }
   if(this._nPage == this._nMaxPages)
   {
      this._btnDer._visible = false;
   }
   else if(this._nPage == 1)
   {
      this._btnIzq._visible = false;
   }
   this._tiSearch.text = "";
   this._textresume.text = "" + this._aMobs.length + " - Monstres trouvés";
};
_loc1.visualizar = function(sPacket)
{
   var _loc4_ = sPacket.split("|");
   var _loc7_ = Number(_loc4_[0]);
   var _loc6_ = _loc4_[1];
   var _loc5_ = _loc4_[2];
   var _loc2_ = 2;
   var _loc3_ = 0;
   while(true)
   {
      _loc3_ += 1;
      if(_loc3_ > 6)
      {
         break;
      }
      this["_btnLevel" + _loc3_].enabled = false;
   }
   this._oStats = new Object();
   while(true)
   {
      _loc2_ += 1;
      if(_loc2_ >= _loc4_.length)
      {
         break;
      }
      this._oStats[_loc2_ - 2] = _loc4_[_loc2_];
      this["_btnLevel" + (_loc2_ - 2)].enabled = true;
   }
   this._btnLocate.enabled = true;
   this._lblTipo.text = this.api.lang.getMonstersRaceText(_loc7_).n;
   this._lblKamas.text = _loc6_;
   this.cargarDrops(_loc5_);
   this.cambiarNivel(1);
};
_loc1.cargarDrops = function(sS)
{
   var _loc5_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc3_;
   var _loc2_;
   if(sS.length > 0)
   {
      _loc3_ = sS.split(";");
      for(var _loc6_ in _loc3_)
      {
         _loc2_ = _loc3_[_loc6_].split(",");
         _loc5_.push({id:_loc2_[0],label:this.api.lang.getItemUnicText(_loc2_[0]).n + (!this.api.datacenter.Player.isAuthorized ? "" : " (" + _loc2_[0] + ")"),drop:_loc2_[1]});
      }
   }
   else
   {
      _loc5_.push({id:-1,label:this.api.lang.getText("NONE")});
   }
   this._lstDrops.dataProvider = _loc5_;
};
_loc1.cargarHechizos = function(sS)
{
   var _loc4_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc3_;
   var _loc2_;
   if(sS.length > 0)
   {
      _loc3_ = sS.split(",");
      for(var _loc5_ in _loc3_)
      {
         _loc2_ = _loc3_[_loc5_].split("@")[0];
         _loc4_.push({id:_loc2_,label:this.api.lang.getSpellText(_loc2_).n + (this.api.datacenter.Player.isAuthorized ? " (" + _loc2_ + ")" : "")});
      }
   }
   else
   {
      _loc4_.push({id:-1,label:this.api.lang.getText("NONE")});
   }
   this._lstSpells.dataProvider = _loc4_;
};
_loc1.cambiarNivel = function(nNumber)
{
   if(this._oStats[nNumber] == undefined)
   {
      return undefined;
   }
   var _loc2_ = 1;
   while(_loc2_ <= 6)
   {
      this["_btnLevel" + _loc2_].selected = _loc2_ == Number(nNumber);
      _loc2_ = _loc2_ + 1;
   }
   var _loc3_ = this._oStats[nNumber].split("~");
   this._lblLP.text = _loc3_[0];
   this._lblAP.text = _loc3_[1];
   this._lblMP.text = _loc3_[2];
   var _loc5_ = _loc3_[3].split(",");
   this._lblLevel.text = this.api.lang.getText("LEVEL") + " " + _loc5_[0];
   this._lblNeutral.text = _loc5_[1];
   this._lblEarth.text = _loc5_[2];
   this._lblFire.text = _loc5_[3];
   this._lblWater.text = _loc5_[4];
   this._lblAir.text = _loc5_[5];
   this.cargarHechizos(_loc3_[4]);
   this._lblExp.text = _loc3_[5];
   this._lblKamas.text = _loc3_[6];
};
_loc1.close = function(oEvent)
{
   this.showDetails(false);
};
_loc1.click = function(oEvent)
{
   this.infoDrop(false);
   var _loc2_;
   switch(oEvent.target._name)
   {
      case "_btnSearchMob":
         this.buscarMob(this._tiSearch.text);
         break;
      case "_btnSearchDrop":
         this.buscarDrop(this._tiSearch.text);
         break;
      case "_btnDer":
         if(this._nPage + 1 > this._nMaxPages)
         {
            this._btnDer._visible = false;
            return undefined;
         }
         this._btnIzq._visible = true;
         this._nPage++;
         this.actualizarData();
         break;
      case "_btnIzq":
         if(this._nPage - 1 <= 0)
         {
            this._btnIzq._visible = false;
            return undefined;
         }
         this._btnDer._visible = true;
         this._nPage--;
         this.actualizarData();
         break;
      case "_btnClose":
         this.callClose();
         break;
      case "_btnLevel1":
      case "_btnLevel2":
      case "_btnLevel3":
      case "_btnLevel4":
      case "_btnLevel5":
      case "_btnLevel6":
         this.cambiarNivel(Number(oEvent.target._name.substr(9)));
         break;
      case "_ctr1":
      case "_ctr2":
      case "_ctr3":
      case "_ctr4":
      case "_ctr5":
      case "_ctr6":
      case "_ctr7":
      case "_ctr8":
      case "_ctr9":
         if(oEvent.target.contentData.id == undefined)
         {
            return undefined;
         }
         this.api.network.send("ZE" + oEvent.target.contentData.id);
         _loc2_ = oEvent.target.contentData;
         if(_loc2_ != undefined)
         {
            this._cciSprite.data = {name:_loc2_.name,gfxFile:dofus["\x12\x03"].CLIPS_PERSOS_PATH + _loc2_.gfxId + ".swf",title:_loc2_.id};
            _loc1._selectedMstr = _loc2_.id;
            this._cciSprite.enabled = true;
         }
         else
         {
            this._cciSprite.data = undefined;
            this._cciSprite.enabled = false;
         }
         break;
      case "_btnLocate":
         this.api.network.send("Ze" + _loc1._selectedMstr);
   }
};
_loc1.showDetails = function(bShow)
{
   this._sfivSpellFullInfosViewer.removeMovieClip();
   if(bShow)
   {
      this.attachMovie("SpellFullInfosViewer","_sfivSpellFullInfosViewer",this.getNextHighestDepth(),{_x:this._mcSpellFullInfosPlacer._x,_y:this._mcSpellFullInfosPlacer._y});
      this._sfivSpellFullInfosViewer.addEventListener("close",this);
   }
};
_loc1.itemSelected = function(oEvent)
{
   if(oEvent.target.selectedItem.id == -1 || oEvent.target.selectedItem.id == Number(-1))
   {
      return undefined;
   }
   var _loc3_;
   switch(oEvent.target._name)
   {
      case "_cbAnim":
         this._cciSprite.setAnim(this._cbAnim.selectedItem.label,true);
         break;
      case "_lstSpells":
         this.infoDrop(false);
         if(oEvent.row.item != undefined)
         {
            if(this._sfivSpellFullInfosViewer.spell.ID != oEvent.target.selectedItem.id)
            {
               this.showDetails(true);
               this._sfivSpellFullInfosViewer.spell = new dofus.datacenter["\x1e\x0f\x02"](oEvent.target.selectedItem.id,1);
            }
            else
            {
               this.showDetails(false);
            }
         }
         break;
      case "_lstDrops":
         if(this._nItem == oEvent.target.selectedItem.id)
         {
            this._nItem = 0;
            this.infoDrop(false);
            break;
         }
         this.showDetails(false);
         this._nItem = oEvent.target.selectedItem.id;
         this.infoDrop(true);
         this._itvItemViewer.itemData = new dofus.datacenter["\f\x0b"](0,oEvent.target.selectedItem.id,1,-1,"");
         _loc3_ = oEvent.target.selectedItem.drop.split("#");
         this._lblPP.text = _loc3_[0];
         this._lblPorcentaje.text = _loc3_[1];
         this._lblMax.text = _loc3_[2];
         break;
   }
};
_loc1.infoDrop = function(bVisible)
{
   this._itvItemViewer._visible = bVisible;
   this._winItemViewer._visible = bVisible;
   this._infoPP._visible = bVisible;
   this._lblPP._visible = bVisible;
   this._lblPorcentaje._visible = bVisible;
   this._lblMax._visible = bVisible;
};
_loc1._nItem = Number(0);
_loc1._oStats = new Object();
_loc1._nPage = Number(1);
_loc1._selectedMstr = Number(0);
_loc1._nMaxPages = Number(1);
_loc1._aMobs = new Array();
_loc1._realMobs = new Array();
_loc1.addProperty("mobs",function()
{
}
,_loc1.__set__Mobs);
