var _loc1 = dofus["\r\x13"].gapi.controls.ItemViewer.prototype;
_loc1.__set__displayPrice = function(bDisplayPrice)
{
   this._bPrice = bDisplayPrice;
   this._lblPrice._visible = bDisplayPrice;
   this._ldrPago._visible = bDisplayPrice;
};
_loc1.__get__displayPrice = function()
{
   return this._bPrice;
};
_loc1.addListeners = function()
{
   this._btnAction.addEventListener("click",this);
   this._btnAction.addEventListener("over",this);
   this._btnAction.addEventListener("out",this);
   this._btnAgregar.addEventListener("click",this);
   this._btnModificar.addEventListener("click",this);
   this._btnTabEffects.addEventListener("click",this);
   this._btnTabCharacteristics.addEventListener("click",this);
   this._btnTabConditions.addEventListener("click",this);
   this._pbEthereal.addEventListener("over",this);
   this._pbEthereal.addEventListener("out",this);
   this._ldrRarity.addEventListener("over",this);
   this._ldrRarity.addEventListener("out",this);
   this._ldrTwoHanded.addEventListener("over",this);
   this._ldrTwoHanded.addEventListener("out",this);
   this._ldrPago.onRollOver = function()
   {
      this._parent.over({target:this});
   };
   this._ldrPago.onRollOut = function()
   {
      this._parent.out({target:this});
   };
};
_loc1.showItemData = function(oItem)
{
   var _loc6_;
   var _loc3_;
   var _loc8_;
   var _loc5_;
   var _loc7_;
   if(oItem != undefined)
   {
      if(oItem.rarity > 0)
      {
         this._ldrRarity._visible = true;
         this._ldrRarity.contentPath = "ItemViewerRarity" + oItem._rarity.toString();
      }
      else
      {
         this._ldrRarity.contentPath = "ItemViewerRarity1";
         this._ldrRarity._visible = false;
      }
      this._lblName.text = oItem.name;
      if(dofus.Constants.DEBUG || _global.CONFIG.skipLanguageVerification)
      {
         this._lblName.text += " (" + oItem.unicID + ")";
      }
      if(_global.CONFIG.skipLanguageVerification)
      {
         this._lblName.text += "  *" + oItem.ID + "*";
      }
      if(oItem.style == "")
      {
         this._lblName.styleName = "WhiteLeftMediumBoldLabel";
         if(this._ldrPago._visible)
         {
            this._sPago = this.api.lang.getText("KAMAS");
            this._ldrPago.contentPath = "KamaSymbol";
         }
      }
      else
      {
         this._lblName.styleName = oItem.style + "LeftMediumBoldLabel";
         if(this._ldrPago._visible)
         {
            if(oItem.style == "VIP")
            {
               this._sPago = this.api.lang.getText("OGRINAS");
               this._ldrPago.contentPath = "OgrineSymbol";
            }
            else
            {
               this._sPago = this.api.lang.getText("KAMAS");
               this._ldrPago.contentPath = "KamaSymbol";
            }
         }
      }
      if(oItem.itemPago > 0)
      {
         _loc6_ = this.api.lang.getItemUnicText(oItem.itemPago);
         this._sPago = _loc6_.n;
         _loc3_ = !_global.GFX[oItem.itemPago] ? _loc6_.g : _global.GFX[oItem.itemPago];
         if(_global.API.kernel.OptionsManager.getOption("SkinsItemsOficial"))
         {
            _loc8_ = _loc6_.t;
            if(_loc3_.length > 3)
            {
               _loc8_ = _loc3_.substr(0,_loc3_.length - 3);
               _loc3_ = _loc3_.substr(_loc3_.length - 3);
               while(_loc3_.charAt(0) == "0")
               {
                  _loc3_ = _loc3_.substr(1);
               }
            }
            this._ldrPago.contentPath = dofus["\x12\x03"].ITEMS_PATH + _loc8_ + "/" + _loc3_ + ".swf";
         }
         else
         {
            _loc5_ = _loc3_ + "";
            if(_loc5_.length <= 3)
            {
               while(_loc5_.length < 3)
               {
                  _loc5_ = "0" + _loc5_;
               }
               _loc5_ = _loc6_.t + _loc5_;
            }
            this._ldrPago.contentPath = dofus["\x12\x03"].ITEMS_PATH + _loc5_ + ".swf";
         }
      }
      this._lblLevel.text = this.api.lang.getText("LEVEL_SMALL") + oItem.level;
      this._txtDescription.text = oItem.description;
      this._ldrIcon.contentParams = oItem.params;
      this._ldrIcon.contentPath = oItem.iconFile;
      this._bShowBaseEffects = this.showBaseEffects;
      this.getItemEffects(this._bShowBaseEffects);
      if(oItem.superType == 2)
      {
         this._btnTabCharacteristics._visible = true;
      }
      else
      {
         if(this._sCurrentTab == "Characteristics")
         {
            this.setCurrentTab("Effects");
         }
         this._btnTabCharacteristics._visible = false;
      }
      this._lblPrice.text = oItem.price != undefined ? new ank["\x1e\n\t"]["\x0e\x1b"](oItem.price).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) : "";
      if(oItem.price == undefined || oItem.price == -1)
      {
         this._ldrPago._visible = false;
      }
      this._lblWeight.text = oItem.weight + " " + ank["\x1e\n\t"]["\x1e\x16\x1a"].combine(this.api.lang.getText("PODS"),"m",oItem.weight < 2);
      if(oItem.isEthereal)
      {
         _loc7_ = oItem.etherealResistance;
         this._pbEthereal.maximum = _loc7_.param3;
         this._pbEthereal.value = _loc7_.param2;
         this._pbEthereal._visible = true;
         if(_loc7_.param2 < 4)
         {
            this._pbEthereal.styleName = "EtherealCriticalProgressBar";
         }
         else
         {
            this._pbEthereal.styleName = "EtherealNormalProgressBar";
         }
      }
      else
      {
         this._pbEthereal._visible = false;
      }
      this._ldrTwoHanded._visible = oItem.needTwoHands;
   }
   else if(this._lblName.text != undefined)
   {
      this._lblName.text = "";
      this._lblLevel.text = "";
      this._txtDescription.text = "";
      this._ldrIcon.contentPath = "";
      this._lstInfos.removeAll();
      this._lblPrice.text = "";
      this._lblWeight.text = "";
      this._pbEthereal._visible = false;
      this._ldrTwoHanded._visible = false;
      this._ldrPago._visible = false;
   }
};
_loc1.click = function(oEvent)
{
   var _loc4_;
   var _loc5_;
   var _loc3_;
   switch(oEvent.target._name)
   {
      case "_btnAgregar":
         _loc4_ = this._oItem.compressedEffects;
         if(_loc4_ == undefined)
         {
            _loc4_ = "";
         }
         if(_loc4_.length > 0)
         {
            _loc4_ += ",";
         }
         _loc4_ += "6f#1#0#0#0d0+1";
         this._oItem.setEffects(_loc4_);
         this.updateCurrentTabInformations();
         break;
      case "_btnModificar":
         this.actualizarStats();
         break;
      case "_btnTabEffects":
         if(this._sCurrentTab == "Effects")
         {
            _loc5_ = this["_btnTab" + this._sCurrentTab];
            _loc5_.selected = false;
            this._bShowBaseEffects = !this._bShowBaseEffects;
            this.getItemEffects(this._bShowBaseEffects);
         }
         else
         {
            this.setCurrentTab("Effects");
         }
         break;
      case "_btnTabCharacteristics":
         this.setCurrentTab("Characteristics");
         break;
      case "_btnTabConditions":
         this.setCurrentTab("Conditions");
         break;
      case "_btnAction":
         _loc3_ = this.api.ui.createPopupMenu();
         _loc3_.addStaticItem(this._oItem.name);
         if(this._oItem.compressedEffects.indexOf("7d0") != -1)
         {
            _loc3_.addItem("Contenu",this,this.dispatchEvent,[{type:"verContenido",item:this._oItem}]);
         }
         if(this._bUseButton && this._oItem.canUse)
         {
            _loc3_.addItem(this._parent.api.lang.getText("CLICK_TO_USE"),this,this.dispatchEvent,[{type:"useItem",item:this._oItem}]);
            if(this._oItem.Quantity > 1)
            {
               _loc3_.addItem(this._parent.api.lang.getText("CLICK_TO_BATCH_USE"),this,this.dispatchEvent,[{type:"batchUseItem",item:this._oItem}]);
            }
         }
         _loc3_.addItem(this._parent.api.lang.getText("CLICK_TO_INSERT"),this.api.kernel.GameManager,this.api.kernel.GameManager.insertItemInChat,[this._oItem]);
         if(this._bTargetButton && this._oItem.canTarget)
         {
            _loc3_.addItem(this._parent.api.lang.getText("CLICK_TO_TARGET"),this,this.dispatchEvent,[{type:"targetItem",item:this._oItem}]);
         }
         _loc3_.addItem(this._parent.api.lang.getText("ASSOCIATE_RECEIPTS"),this.api.ui,this.api.ui.loadUIComponent,["ItemUtility","ItemUtility",{item:this._oItem}]);
         if(this._bDestroyButton)
         {
            if(this._oItem.canDestroy)
            {
               _loc3_.addItem(this._parent.api.lang.getText("CLICK_TO_DESTROY"),this,this.dispatchEvent,[{type:"destroyItem",item:this._oItem}]);
            }
            if(this._oItem.isMimobionte)
            {
               _loc3_.addItem(this._parent.api.lang.getText("ISASSOCIATE_MIMOBIONTE"),this,this.dispatchEvent,[{type:"separarMimobionte",item:this._oItem}]);
            }
            _loc3_.addItem("LIER/DELIER OBJET",this,this.dispatchEvent,[{type:"linkItem",item:this._oItem}]);
         }
         if(this.api.ui.getUIComponent("Party") != null && this._oItem.position == -1)
         {
            _loc3_.addItem(this._parent.api.lang.getText("SEND_TO"),this,this.dispatchEvent,[{type:"sendItem",item:this._oItem,cmp:this}]);
         }
         _loc3_.show(_root._xmouse,_root._ymouse);
   }
};
_loc1.over = function(oEvent)
{
   var _loc2_;
   switch(oEvent.target._name)
   {
      case "_pbEthereal":
         _loc2_ = this._oItem.etherealResistance;
         this.gapi.showTooltip(_loc2_.description,oEvent.target,-20);
         break;
      case "_ldrTwoHanded":
         this.gapi.showTooltip(this.api.lang.getText("TWO_HANDS_WEAPON"),this._ldrTwoHanded,-20);
         break;
      case "_ldrRarity":
         this.gapi.showTooltip("Item jet",this._ldrRarity,-20);
         break;
      case "_ldrPago":
         this.gapi.showTooltip(this._sPago,this._ldrPago,-20);
   }
};
_loc1.setCurrentTab = function(_loc2_)
{
   var _loc3_ = this["_btnTab" + this._sCurrentTab];
   var _loc2_ = this["_btnTab" + _loc2_];
   _loc3_.selected = true;
   _loc3_.enabled = true;
   _loc2_.selected = false;
   if(_loc2_ != "Effects")
   {
      _loc2_.enabled = false;
   }
   this._sCurrentTab = _loc2_;
   this.getItemEffects(this._bShowBaseEffects);
};
_loc1.updateCurrentTabInformations = function()
{
   var _loc2_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   switch(this._sCurrentTab)
   {
      case "Effects":
         for(var _loc3_ in this._oItem.effects)
         {
            if(this._oItem.effects[_loc3_].description.length > 0)
            {
               _loc2_.push(this._oItem.effects[_loc3_]);
            }
         }
         break;
      case "Characteristics":
         for(_loc3_ in this._oItem.characteristics)
         {
            if(this._oItem.characteristics[_loc3_].length > 0)
            {
               _loc2_.push(this._oItem.characteristics[_loc3_]);
            }
         }
         break;
      case "Conditions":
         for(_loc3_ in this._oItem.conditions)
         {
            if(this._oItem.conditions[_loc3_].length > 0)
            {
               _loc2_.push(this._oItem.conditions[_loc3_]);
            }
         }
   }
   _loc2_.reverse();
   this._lstInfos.dataProvider = _loc2_;
};
_loc1.createActionPopupMenu = function(_loc2_)
{
   var _loc5_ = this.api.ui.createPopupMenu();
   _loc5_.addStaticItem(_loc2_.name);
   if(this._bUseButton && _loc2_.canUse)
   {
      _loc5_.addItem(this.api.lang.getText("CLICK_TO_USE"),this,this.dispatchEvent,[{type:"useItem",item:_loc2_}]);
      _loc5_.addItem(this.api.lang.getText("CLICK_TO_BATCH_USE"),this,this.dispatchEvent,[{type:"batchUseItem",item:_loc2_}]);
   }
   _loc5_.addItem(this.api.lang.getText("TEST"),this.api.kernel.GameManager,this.api.kernel.GameManager.insertItemInChat,[_loc2_]);
   _loc5_.addItem(this.api.lang.getText("CLICK_TO_INSERT"),this.api.kernel.GameManager,this.api.kernel.GameManager.insertItemInChat,[_loc2_]);
   if(this._bTargetButton && _loc2_.canTarget)
   {
      _loc5_.addItem(this.api.lang.getText("CLICK_TO_TARGET"),this,this.dispatchEvent,[{type:"targetItem",item:_loc2_}]);
   }
   _loc5_.addItem(this.api.lang.getText("ASSOCIATE_RECEIPTS"),this.api.ui,this.api.ui.loadUIComponent,["ItemUtility","ItemUtility",{item:_loc2_}]);
   if(this._bDestroyButton)
   {
      if(_loc2_.canDestroy)
      {
         _loc5_.addItem(this.api.lang.getText("CLICK_TO_DESTROY"),this,this.dispatchEvent,[{type:"destroyItem",item:_loc2_}]);
      }
      if(_loc2_.hasCustomGfx())
      {
         _loc5_.addItem(this.api.lang.getText("CLICK_TO_DESTROY_MIMIBIOTE"),this,this.dispatchEvent,[{type:"destroyMimibiote",item:_loc2_}]);
      }
   }
   var _loc3_;
   for(var _loc6_ in _loc2_.effects)
   {
      _loc3_ = _loc2_.effects[_loc6_];
      if(_loc3_.type == 995)
      {
         _loc5_.addItem(this.api.lang.getText("VIEW_MOUNT_DETAILS"),this.api.network.Mount,this.api.network.Mount.data,[_loc3_.param1,_loc3_.param2]);
         break;
      }
   }
   _loc5_.show(_root._xmouse,_root._ymouse);
};
_loc1.getItemEffects = function(bBaseEffects)
{
   var _loc10_;
   var _loc7_;
   var _loc8_;
   var _loc6_;
   var _loc4_;
   var _loc3_;
   var _loc5_;
   if(this._bShowBaseEffects)
   {
      if(this._sCurrentTab == "Effects")
      {
         _loc10_ = this.api.lang.getItemStats(this._oItem.unicID);
         if(_loc10_ != undefined)
         {
            _loc7_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
            _loc8_ = new Array();
            _loc6_ = _loc10_.split(",");
            _loc4_ = 0;
            while(_loc4_ < _loc6_.length)
            {
               _loc3_ = _loc6_[_loc4_].split("#");
               _loc3_[0] = _global.parseInt(_loc3_[0],16);
               _loc3_[1] = !(_loc3_[1] != "0" && _loc3_[1] != "") ? undefined : _global.parseInt(_loc3_[1],16);
               _loc3_[2] = !(_loc3_[2] != "0" && _loc3_[2] != "") ? undefined : _global.parseInt(_loc3_[2],16);
               _loc3_[3] = !(_loc3_[3] != "0" && _loc3_[3] != "") ? undefined : _global.parseInt(_loc3_[3],16);
               _loc8_.push(_loc3_);
               _loc4_ += 1;
            }
            _loc5_ = dofus.datacenter["\f\x0b"].getItemDescriptionEffects(_loc8_);
            for(var _loc9_ in _loc5_)
            {
               if(_loc5_[_loc9_].description.length > 0)
               {
                  _loc7_.push(_loc5_[_loc9_]);
               }
            }
            _loc7_.reverse();
            this._lstInfos.dataProvider = _loc7_;
         }
      }
      else
      {
         this.updateCurrentTabInformations();
      }
   }
   else
   {
      this.updateCurrentTabInformations();
   }
};
_loc1.__set__showBaseEffects = function(bShowBaseEffects)
{
   this._bShowBaseEffects = bShowBaseEffects;
};
_loc1.__get__showBaseEffects = function()
{
   return this._bShowBaseEffects;
};
_loc1.__set__displayWidth = function(_loc2_)
{
   this._nDisplayWidth = _loc2_ + 2;
};
_loc1.__get__displayWidth = function()
{
   return this._nDisplayWidth;
};
_loc1._sPago = "Kamas";
_loc1._bUseButton = false;
_loc1._bDestroyButton = false;
_loc1._bTargetButton = false;
_loc1._sCurrentTab = "Effects";
_loc1.addProperty("displayWidth",_loc1.__get__displayWidth,_loc1.__set__displayWidth);
_loc1.addProperty("showBaseEffects",_loc1.__get__showBaseEffects,_loc1.__set__showBaseEffects);
_loc1.addProperty("displayPrice",_loc1.__get__displayPrice,_loc1.__set__displayPrice);
_loc1.STAT_TEXTO = [7,10,146,148,188,197,201,221,222,229,230,333,335,501,513,600,602,603,604,605,612,613,614,615,616,620,622,624,627,640,641,642,643,645,647,648,649,669,699,700,701,705,710,715,716,717,720,724,725,730,731,751,760,765,791,795,800,805,806,807,808,810,811,813,814,825,900,901,902,905,915,930,931,932,933,934,935,936,937,939,940,946,947,948,949,950,960,961,962,963,964,970,971,972,973,974,983,985,986,987,988,989,990,994,996,997,998,999];
