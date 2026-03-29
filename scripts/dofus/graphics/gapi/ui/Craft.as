var _loc1 = dofus["\r\x13"].gapi.ui.Craft.prototype;
_loc1.addListeners = function()
{
   this._cgGrid.addEventListener("dblClickItem",this);
   this._cgGrid.addEventListener("dropItem",this);
   this._cgGrid.addEventListener("dragItem",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgGrid.addEventListener("overItem",this);
   this._cgGrid.addEventListener("outItem",this);
   this._cgLocal.addEventListener("dblClickItem",this);
   this._cgLocal.addEventListener("dropItem",this);
   this._cgLocal.addEventListener("dragItem",this);
   this._cgLocal.addEventListener("selectItem",this);
   this._cgLocal.addEventListener("overItem",this);
   this._cgLocal.addEventListener("outItem",this);
   this._cgDistant.addEventListener("selectItem",this);
   this._btnFilterEquipement.addEventListener("click",this);
   this._btnFilterNonEquipement.addEventListener("click",this);
   this._btnFilterRessoureces.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("over",this);
   this._btnFilterNonEquipement.addEventListener("over",this);
   this._btnFilterRessoureces.addEventListener("over",this);
   this._btnFilterEquipement.addEventListener("out",this);
   this._btnFilterNonEquipement.addEventListener("out",this);
   this._btnFilterRessoureces.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("over",this);
   this._btnFilterRunes.addEventListener("click",this);
   this._btnClose.addEventListener("click",this);
   this._btnQuantity.addEventListener("click",this);
   this._btnTries.addEventListener("click",this);
   this._btnApplyRunes.addEventListener("click",this);
   this.api.datacenter.Exchange.addEventListener("localKamaChange",this);
   this.api.datacenter.Exchange.addEventListener("distantKamaChange",this);
   this._btnValidate.addEventListener("click",this);
   this._btnCraft.addEventListener("click",this);
   this._btnMemoryRecall.addEventListener("click",this);
   this._ctrPreview.addEventListener("over",this);
   this._ctrPreview.addEventListener("out",this);
   this._cbTypes.addEventListener("itemSelected",this);
   this._cgGrid.multipleContainerSelectionEnabled = false;
   this._cgDistant.multipleContainerSelectionEnabled = false;
   this._cgLocal.multipleContainerSelectionEnabled = false;
   this._cgLocalSave.multipleContainerSelectionEnabled = false;
};
_loc1.over = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._btnFilterEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("EQUIPEMENT"),_loc2_.target,-20);
         break;
      case this._btnFilterNonEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("NONEQUIPEMENT"),_loc2_.target,-20);
         break;
      case this._btnFilterRessoureces:
         this.api.ui.showTooltip(this.api.lang.getText("RESSOURECES"),_loc2_.target,-20);
         break;
      case this._btnFilterRunes:
         this.api.ui.showTooltip(this.api.lang.getText("RUNES"),_loc2_.target,-20);
         break;
      case this._ctrPreview:
         if(this._mcFiligrane.itemName != undefined)
         {
            this.gapi.showTooltip(this._mcFiligrane.itemName,this._ctrPreview,-22);
            break;
         }
   }
};
_loc1.click = function(_loc2_)
{
   if(_loc2_.target == this._btnClose)
   {
      this.callClose();
      return undefined;
   }
   var _loc9_;
   var _loc8_;
   var _loc6_;
   var _loc4_;
   var _loc5_;
   var _loc2_;
   var _loc3_;
   var _loc11_;
   if(_loc2_.target == this._btnQuantity)
   {
      _loc9_ = 99;
      _loc8_ = 0;
      _loc6_ = 10000000;
      _loc4_ = 0;
      while(_loc4_ < this._eaLocalDataProvider.length)
      {
         _loc5_ = false;
         _loc2_ = 0;
         while(_loc2_ < this._eaDataProvider.length)
         {
            if(this._eaLocalDataProvider[_loc4_].ID == this._eaDataProvider[_loc2_].ID)
            {
               _loc5_ = true;
               _loc3_ = Math.floor(this._eaDataProvider[_loc2_].Quantity / this._eaLocalDataProvider[_loc4_].Quantity);
               if(_loc3_ < _loc6_)
               {
                  _loc6_ = _loc3_;
               }
            }
            _loc2_ += 1;
         }
         if(!_loc5_)
         {
            break;
         }
         _loc4_ += 1;
      }
      if(_loc5_)
      {
         _loc8_ = 1;
         _loc9_ = _loc6_ + 1;
         if(_loc8_ > _loc6_)
         {
            _loc8_ = _loc6_;
         }
      }
      else
      {
         _loc9_ = 0;
         _loc8_ = 0;
      }
      _loc11_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc9_,params:{targetType:"repeat"}});
      _loc11_.addEventListener("validate",this);
      return undefined;
   }
   var _loc10_;
   if(_loc2_.target == this._btnTries)
   {
      _loc10_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:99,params:{targetType:"tries"}});
      _loc10_.addEventListener("validate",this);
      return undefined;
   }
   var _loc12_;
   if(_loc2_.target == this._btnValidate || _loc2_.target == this._btnApplyRunes)
   {
      if(this._bIsLooping)
      {
         this.api.network.Exchange.stopRepeatCraft();
         return undefined;
      }
      if(this._eaLocalDataProvider.length == 0)
      {
         return undefined;
      }
      _loc12_ = this.api.kernel.GameManager.analyseReceipts(this.api.kernel.GameManager.mergeUnicItemInInventory(this._eaLocalDataProvider),this._nSkillId,this._nMaxItem);
      if(_loc12_ == undefined && this.api.kernel.OptionsManager.getOption("AskForWrongCraft"))
      {
         this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("WRONG_CRAFT_CONFIRM"),"CAUTION_YESNO",{name:"confirmWrongCraft",listener:this});
      }
      else
      {
         this.validCraft();
      }
      return undefined;
   }
   if(_loc2_.target == this._btnCraft)
   {
      this.showCraftViewer(_loc2_.target.selected);
      return undefined;
   }
   if(_loc2_.target == this._btnMemoryRecall)
   {
      this.api.network.Exchange.replayCraft();
      return undefined;
   }
   if(_loc2_.target != this._btnSelectedFilterButton)
   {
      this._btnSelectedFilterButton.selected = false;
      this._btnSelectedFilterButton = _loc2_.target;
      switch(_loc2_.target._name)
      {
         case "_btnFilterEquipement":
            this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_EQUIPEMENT;
            this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
            break;
         case "_btnFilterNonEquipement":
            this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_NONEQUIPEMENT;
            this._lblFilter.text = this.api.lang.getText("NONEQUIPEMENT");
            break;
         case "_btnFilterRunes":
            this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_RUNES;
            this._lblFilter.text = this.api.lang.getText("RUNES");
            break;
         case "_btnFilterRessoureces":
            this._aSelectedSuperTypes = dofus["\x12\x03"].FILTER_RESSOURECES;
            this._lblFilter.text = this.api.lang.getText("RESSOURECES");
      }
      this.updateData(true);
   }
   else
   {
      _loc2_.target.selected = true;
   }
};
_loc1.validCraft = function()
{
   if(this._nCurrentQuantity > 1)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("CRAFT_LOOP_START",[this._nCurrentQuantity]),"INFO_CHAT");
      this.showCraftViewer(false);
      this._btnCraft.selected = false;
      this.recordGarbage();
      this.setReady();
      this.addToQueue({object:this,method:this.repeatCraft});
   }
   else
   {
      this.showCraftViewer(false);
      this._btnCraft.selected = false;
      this.recordGarbage();
      this.setReady();
   }
};
_loc1.repeatCraft = function()
{
   if(this.api.datacenter.Exchange.localGarbage.length == 0)
   {
      return undefined;
   }
   this._bIsLooping = true;
   this._btnValidate.label = this._btnApplyRunes.label = this.api.lang.getText("STOP_WORD");
   this.api.network.Exchange.repeatCraft(this._nCurrentQuantity);
};
_loc1.setReady = function()
{
   if(this.api.datacenter.Exchange.localGarbage.length == 0)
   {
      return undefined;
   }
   this.api.network.Exchange.ready();
};
