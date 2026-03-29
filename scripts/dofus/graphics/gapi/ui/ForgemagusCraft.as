var _loc1 = _global.dofus["\r\x13"].gapi.ui.ForgemagusCraft.prototype;
_loc1.addListeners = function()
{
   this._cgGrid.addEventListener("dblClickItem",this);
   this._cgGrid.addEventListener("dropItem",this);
   this._cgGrid.addEventListener("dragItem",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgLocal.addEventListener("dblClickItem",this);
   this._cgLocal.addEventListener("dropItem",this);
   this._cgLocal.addEventListener("dragItem",this);
   this._cgLocal.addEventListener("selectItem",this);
   this._ctrItem.addEventListener("dblClick",this);
   this._ctrItem.addEventListener("drag",this);
   this._ctrItem.addEventListener("drop",this);
   this._ctrItem.addEventListener("click",this);
   this._ctrSignature.addEventListener("dblClick",this);
   this._ctrSignature.addEventListener("drag",this);
   this._ctrSignature.addEventListener("drop",this);
   this._ctrSignature.addEventListener("click",this);
   this._ctrRune.addEventListener("dblClick",this);
   this._ctrRune.addEventListener("drag",this);
   this._ctrRune.addEventListener("drop",this);
   this._ctrRune.addEventListener("click",this);
   this._cgDistant.addEventListener("selectItem",this);
   this._btnFilterEquipement.addEventListener("click",this);
   this._btnFilterNonEquipement.addEventListener("click",this);
   this._btnFilterRessoureces.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("over",this);
   this._btnFilterNonEquipement.addEventListener("over",this);
   this._btnFilterRessoureces.addEventListener("over",this);
   this._btnFilterEquipement.addEventListener("out",this);
   this._btnFilterNonEquipement.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("click",this);
   this._btnFilterRunes.addEventListener("over",this);
   this._btnFilterRessoureces.addEventListener("out",this);
   this._btnClose.addEventListener("click",this);
   this._btnOneShot.addEventListener("click",this);
   this._btnLoop.addEventListener("click",this);
   this._btnProb.addEventListener("click",this);
   this.api.datacenter.Exchange.addEventListener("localKamaChange",this);
   this.api.datacenter.Exchange.addEventListener("distantKamaChange",this);
   this.api.datacenter.Player.addEventListener("kamaChanged",this);
   this.addToQueue({object:this,method:this.kamaChanged,params:[{value:this.api.datacenter.Player.Kama}]});
   this._cbTypes.addEventListener("itemSelected",this);
};
_loc1.initTexts = function()
{
   this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
   this._winInventory.title = this.api.datacenter.Player.data.name;
   this._lblNewObject.text = this.api.lang.getText("CRAFTED_ITEM");
   this._lblSkill.text = this.api.lang.getText("SKILL") + " : " + this.api.lang.getSkillText(this._nSkillId).d;
   this._lblItemTitle.text = this.api.lang.getText("FM_CRAFT_ITEM");
   this._lblRuneTitle.text = this.api.lang.getText("FM_CRAFT_RUNE");
   this._lblSignatureTitle.text = this.api.lang.getText("FM_CRAFT_SIGNATURE");
   this._btnOneShot.label = this.api.lang.getText("APPLY_ONE_RUNE");
   this._btnLoop.label = this.api.lang.getText("APPLY_MULTIPLE_RUNES");
   this._btnProb.label = this.api.lang.getText("PROBABILIDAD_FORJA");
};
_loc1.validateDrop = function(sTargetGrid, oItem, nValue)
{
   if(nValue < 1 || nValue == undefined)
   {
      return undefined;
   }
   if(nValue > oItem.Quantity)
   {
      nValue = oItem.Quantity;
   }
   var _loc12_;
   var _loc13_;
   var _loc3_;
   var _loc9_;
   var _loc6_;
   var _loc5_;
   var _loc2_;
   var _loc7_;
   var _loc4_;
   var _loc8_;
   switch(sTargetGrid)
   {
      case "_cgGrid":
         this.api.network.Exchange.movementItem(false,oItem,nValue);
         break;
      case "_cgLocal":
         this.api.network.Exchange.movementItem(true,oItem,nValue);
         break;
      case "_ctrItem":
      case "_ctrRune":
      case "_ctrSignature":
         _loc12_ = false;
         _loc13_ = false;
         switch(sTargetGrid)
         {
            case "_ctrItem":
               if(this._nForgemagusItemType != oItem.type || !oItem.enhanceable)
               {
                  return undefined;
               }
               _loc3_ = -1;
               while(true)
               {
                  _loc3_ = _loc3_ + 1;
                  if(_loc3_ >= this._eaLocalDataProvider.length)
                  {
                     break;
                  }
                  _loc9_ = false;
                  _loc6_ = -1;
                  while(true)
                  {
                     _loc6_ = _loc6_ + 1;
                     if(_loc6_ >= dofus["\r\x13"].gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE.length)
                     {
                        break;
                     }
                     if(dofus["\r\x13"].gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE[_loc6_] == this._eaLocalDataProvider[_loc3_].unicID)
                     {
                        _loc9_ = true;
                     }
                  }
                  _loc5_ = -1;
                  while(true)
                  {
                     _loc5_ = _loc5_ + 1;
                     if(_loc5_ >= dofus["\r\x13"].gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT.length)
                     {
                        break;
                     }
                     if(dofus["\r\x13"].gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT[_loc5_] == this._eaLocalDataProvider[_loc3_].type)
                     {
                        _loc9_ = true;
                     }
                  }
                  if(!_loc9_)
                  {
                     this.api.network.Exchange.movementItem(false,this._eaLocalDataProvider[_loc3_],this._eaLocalDataProvider[_loc3_].Quantity);
                  }
               }
               _loc12_ = true;
               break;
            case "_ctrRune":
               _loc2_ = -1;
               while(true)
               {
                  _loc2_ = _loc2_ + 1;
                  if(_loc2_ >= this._eaLocalDataProvider.length)
                  {
                     break;
                  }
                  _loc7_ = -1;
                  while(true)
                  {
                     _loc7_ = _loc7_ + 1;
                     if(_loc7_ >= dofus["\r\x13"].gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT.length)
                     {
                        break;
                     }
                     if(dofus["\r\x13"].gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT[_loc7_] == this._eaLocalDataProvider[_loc2_].type && this._eaLocalDataProvider[_loc2_].unicID != oItem.unicID)
                     {
                        this.api.network.Exchange.movementItem(false,this._eaLocalDataProvider[_loc2_],this._eaLocalDataProvider[_loc2_].Quantity);
                     }
                  }
               }
               break;
            case "_ctrSignature":
               _loc4_ = -1;
               while(true)
               {
                  _loc4_ = _loc4_ + 1;
                  if(_loc4_ >= this._eaLocalDataProvider.length)
                  {
                     break;
                  }
                  _loc8_ = -1;
                  while(true)
                  {
                     _loc8_ = _loc8_ + 1;
                     if(_loc8_ >= dofus["\r\x13"].gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE.length)
                     {
                        break;
                     }
                     if(dofus["\r\x13"].gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE[_loc8_] == this._eaLocalDataProvider[_loc4_].unicID)
                     {
                        this.api.network.Exchange.movementItem(false,this._eaLocalDataProvider[_loc4_],this._eaLocalDataProvider[_loc4_].Quantity);
                     }
                  }
               }
               if(this.getCurrentCraftLevel() < 100)
               {
                  _loc13_ = true;
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CRAFT_LEVEL_DOESNT_ALLOW_A_SIGNATURE"),"ERROR_CHAT");
               }
               _loc12_ = true;
         }
         if(!_loc13_)
         {
            this.api.network.Exchange.movementItem(true,oItem,!_loc12_ ? nValue : 1);
            break;
         }
   }
   if(this._bInvalidateDistant)
   {
      this.api.datacenter.Exchange.clearDistantGarbage();
      this._bInvalidateDistant = false;
   }
};
_loc1.updateInventori = function()
{
};
_loc1.repeatCraft = function()
{
   var _loc2_ = this._ctrRune.contentData.Quantity;
   if(_loc2_ <= 1)
   {
      return undefined;
   }
   this._bIsLooping = true;
   this.api.network.Exchange.repeatCraft(_loc2_);
   this._btnLoop.label = this.api.lang.getText("STOP_WORD");
   this._btnOneShot.enabled = false;
   this._btnProb.enabled = false;
};
_loc1.setReady = function()
{
   if(this.api.datacenter.Exchange.localGarbage.length == 0)
   {
      return undefined;
   }
   this.api.network.Exchange.ready();
};
_loc1.onCraftLoopEnd = function()
{
   this._btnLoop.label = this.api.lang.getText("APPLY_MULTIPLE_RUNES");
   this._btnOneShot.enabled = true;
   this._btnProb.enabled = true;
   this._bIsLooping = false;
   this._nCurrentQuantity = 1;
   this.updateData();
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnProb:
         this.api.network.send("EF");
         break;
      case this._btnClose:
         this.callClose();
         break;
      case this._btnOneShot:
         if(this.checkIsBaka())
         {
            return undefined;
         }
         this.recordGarbage();
         this.setReady();
         break;
      case this._btnLoop:
         if(this._bIsLooping)
         {
            this.api.network.Exchange.stopRepeatCraft();
            return undefined;
         }
         if(this.checkIsBaka())
         {
            return undefined;
         }
         this.recordGarbage();
         this.repeatCraft();
         break;
      case this._ctrItem:
      case this._ctrRune:
      case this._ctrSignature:
         if(oEvent.target.contentData == undefined)
         {
            this.hideItemViewer(true);
         }
         else
         {
            if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY))
            {
               this.api.kernel.GameManager.insertItemInChat(oEvent.target.contentData);
               return undefined;
            }
            this.hideItemViewer(false);
            this._itvItemViewer.itemData = oEvent.target.contentData;
         }
         break;
      default:
         if(oEvent.target != this._btnSelectedFilterButton)
         {
            this._btnSelectedFilterButton.selected = false;
            this._btnSelectedFilterButton = oEvent.target;
            switch(oEvent.target._name)
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
            break;
         }
         oEvent.target.selected = true;
         break;
   }
};
_loc1.modifyDistant = function(sExtraData, ea, sKamaLocation, bForceModifyInventory)
{
   var _loc17_ = sExtraData.charAt(0);
   var _loc5_ = this.api.datacenter.Exchange;
   var _loc12_;
   var _loc6_;
   var _loc8_;
   var _loc9_;
   var _loc13_;
   var _loc14_;
   var _loc7_;
   var _loc4_;
   var _loc15_;
   var _loc3_;
   var _loc16_;
   switch(_loc17_)
   {
      case "O":
         _global.API.showMessage(undefined,"Aca.","INFO_CHAT");
         _loc12_ = sExtraData.charAt(1) == "+";
         _loc6_ = sExtraData.substr(2).split("|");
         _loc8_ = Number(_loc6_[0]);
         _loc9_ = Number(_loc6_[1]);
         _loc13_ = Number(_loc6_[2]);
         _loc14_ = _loc6_[3];
         _loc7_ = ea.findFirstItem("ID",_loc8_);
         if(_loc12_)
         {
            _loc4_ = new dofus.datacenter["\f\x0b"](_loc8_,_loc13_,_loc9_,-1,_loc14_);
            _loc15_ = bForceModifyInventory == undefined ? _loc5_.distantPlayerID == undefined : bForceModifyInventory;
            if(_loc7_.index != -1)
            {
               ea.updateItem(_loc7_.index,_loc4_);
            }
            else
            {
               ea.push(_loc4_);
            }
            if(_loc15_)
            {
               _loc3_ = _loc5_.inventory.findFirstItem("ID",_loc8_);
               if(_loc3_.index != -1)
               {
                  _loc3_.item.position = -1;
                  if(this.api.datacenter.Basics.aks_exchange_isForgemagus)
                  {
                     _loc3_.item.Quantity = Number(_loc9_);
                     this.api.ui.getUIComponent("Craft").updateDistantData();
                  }
                  else
                  {
                     _loc3_.item.Quantity = Number(_loc3_.item.Quantity) + Number(_loc9_);
                  }
                  _loc5_.inventory.updateItem(_loc3_.index,_loc4_);
               }
               else
               {
                  _loc5_.inventory.push(_loc4_);
                  _global.API.ui.getUIComponent("Craft").updateForgemagusResult(_loc4_);
               }
            }
         }
         else if(_loc7_.index != -1)
         {
            ea.removeItems(_loc7_.index,1);
         }
         break;
      case "G":
         _loc16_ = Number(sExtraData.substr(1));
         _loc5_[sKamaLocation] = _loc16_;
   }
};
