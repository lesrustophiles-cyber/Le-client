var _loc1 = dofus.aks.Exchange.prototype;
_loc1.transfertItems = function(_loc2_, _loc3_)
{
   this.aks.send("EMO" + _loc2_ + _loc3_,true);
};
_loc1.movementOgrine = function(_loc2_)
{
   this.aks.send("EMS" + _loc2_,true);
};
_loc1.repeatCraft = function(nHowManyTimes)
{
   if(Number(nHowManyTimes) == 1)
   {
      this.aks.send("EMR1",false);
   }
   else
   {
      this._nItemsToCraft = nHowManyTimes - 1;
      this.aks.send("EMR" + nHowManyTimes,false);
      this.api.datacenter.Basics.isCraftLooping = true;
   }
};
_loc1.onReady = function(sExtraData)
{
   var _loc2_ = sExtraData.charAt(0) == "1";
   var _loc3_ = Number(sExtraData.substr(1));
   var _loc4_ = _loc3_ != this.api.datacenter.Player.ID ? 1 : 0;
   this.api.datacenter.Exchange.readyStates.updateItem(_loc4_,_loc2_);
};
_loc1.onListBoutique = function(sExtraData)
{
   var _loc7_ = sExtraData.split("|");
   var _loc8_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc2_;
   var _loc6_;
   var _loc4_;
   var _loc5_;
   var _loc3_;
   for(var _loc9_ in _loc7_)
   {
      _loc2_ = _loc7_[_loc9_].split(";");
      _loc6_ = Number(_loc2_[0]);
      _loc4_ = _loc2_[1];
      _loc5_ = _loc2_[2];
      _loc3_ = new dofus.datacenter["\f\x0b"](0,_loc6_,undefined,undefined,_loc4_,_loc5_);
      _loc3_.priceMultiplicator = this.api.lang.getConfigText("BUY_PRICE_MULTIPLICATOR");
      _loc8_.push(_loc3_);
   }
   this.api.datacenter.Temporary.Shop.inventory = _loc8_;
};
_loc1.onCraft = function(bSuccess, sExtraData)
{
   if(this.api.datacenter.Basics.aks_exchange_isForgemagus || !this.api.datacenter.Basics.isCraftLooping)
   {
      this.api.datacenter.Exchange.clearLocalGarbage();
   }
   var _loc7_ = this.api.datacenter.Basics.aks_exchange_echangeType;
   var _loc3_;
   if(_loc7_ == 12 || _loc7_ == 13)
   {
      _loc3_ = this.api.datacenter.Exchange;
      _loc3_.clearDistantGarbage();
      _loc3_.clearPayGarbage();
      _loc3_.clearPayIfSuccessGarbage();
      _loc3_.payKama = 0;
      _loc3_.payIfSuccessKama = 0;
      this.api.ui.getUIComponent("SecureCraft").updateInventory();
   }
   var _loc10_ = !this.api.datacenter.Basics.aks_exchange_isForgemagus;
   var _loc2_;
   var _loc8_;
   var _loc12_;
   var _loc5_;
   var _loc9_;
   var _loc11_;
   var _loc4_;
   loop0:
   switch(sExtraData.substr(0,1))
   {
      case "I":
         if(!bSuccess)
         {
            this.api.kernel.showMessage(this.api.lang.getText("CRAFT"),this.api.lang.getText("NO_CRAFT_RESULT"),"ERROR_BOX",{name:"Impossible"});
         }
         break;
      case "F":
         if(!bSuccess && _loc10_)
         {
            this.api.kernel.showMessage(this.api.lang.getText("CRAFT"),this.api.lang.getText("CRAFT_FAILED"),"ERROR_BOX",{name:"CraftFailed"});
         }
         this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_CRAFT_KO);
         break;
      case ";":
         if(bSuccess)
         {
            _loc2_ = sExtraData.substr(1).split(";");
            if(_loc2_.length == 1)
            {
               _loc8_ = new dofus.datacenter["\f\x0b"](0,Number(_loc2_[0]),undefined,undefined,undefined);
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CRAFT_SUCCESS_SELF",[_loc8_.name]),"INFO_CHAT");
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_CRAFT_KO);
               break;
            }
            _loc12_ = _loc2_[1].substr(0,1);
            _loc5_ = _loc2_[1].substr(1);
            _loc9_ = Number(_loc2_[0]);
            _loc11_ = _loc2_[2];
            _loc4_ = new Array();
            _loc4_.push(_loc9_);
            _loc4_.push(_loc11_);
            switch(_loc12_)
            {
               case "T":
                  this.api.kernel.showMessage(undefined,this.api.kernel.ChatManager.parseInlineItems(this.api.lang.getText("CRAFT_SUCCESS_TARGET",[_loc5_]),_loc4_),"INFO_CHAT");
                  break loop0;
               case "B":
                  this.api.kernel.showMessage(undefined,this.api.kernel.ChatManager.parseInlineItems(this.api.lang.getText("CRAFT_SUCCESS_OTHER",[_loc5_]),_loc4_),"INFO_CHAT");
            }
         }
   }
   if(!bSuccess)
   {
      this.api.datacenter.Exchange.clearCoopGarbage();
   }
};
_loc1.onCraftLoopEnd = function(sExtraData)
{
   var _loc3_ = Number(sExtraData);
   this.api.datacenter.Basics.isCraftLooping = false;
   var _loc2_;
   switch(_loc3_)
   {
      case 1:
         _loc2_ = this.api.lang.getText("CRAFT_LOOP_END_OK");
         break;
      case 2:
         _loc2_ = this.api.lang.getText("CRAFT_LOOP_END_INTERRUPT");
         break;
      case 3:
         _loc2_ = this.api.lang.getText("CRAFT_LOOP_END_FAIL");
         break;
      case 4:
         _loc2_ = this.api.lang.getText("CRAFT_LOOP_END_INVALID");
   }
   this.api.kernel.showMessage(undefined,_loc2_,"INFO_CHAT");
   this.api.kernel.showMessage(this.api.lang.getText("CRAFT"),_loc2_,"ERROR_BOX");
   this.api.ui.getUIComponent("Craft").onCraftLoopEnd();
   if(!this.api.datacenter.Basics.aks_exchange_isForgemagus)
   {
      this.api.datacenter.Exchange.clearLocalGarbage();
   }
};
_loc1.onList = function(sExtraData)
{
   var _loc37_;
   var _loc41_;
   var _loc2_;
   var _loc28_;
   var _loc29_;
   var _loc9_;
   var _loc7_;
   var _loc12_;
   var _loc6_;
   var _loc10_;
   var _loc8_;
   var _loc11_;
   var _loc36_;
   var _loc40_;
   var _loc4_;
   var _loc16_;
   var _loc19_;
   var _loc30_;
   var _loc32_;
   var _loc20_;
   var _loc27_;
   var _loc13_;
   var _loc35_;
   var _loc39_;
   var _loc5_;
   var _loc33_;
   var _loc17_;
   var _loc22_;
   var _loc31_;
   var _loc18_;
   var _loc24_;
   var _loc15_;
   var _loc0_;
   var _loc38_;
   var _loc43_;
   var _loc3_;
   var _loc34_;
   var _loc26_;
   var _loc23_;
   var _loc21_;
   var _loc25_;
   var _loc14_;
   switch(this.api.datacenter.Basics.aks_exchange_echangeType)
   {
      case 0:
      case 20:
      case 23:
         _loc37_ = sExtraData.split("|");
         _loc41_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
         for(var _loc45_ in _loc37_)
         {
            _loc2_ = _loc37_[_loc45_].split(";");
            _loc28_ = Number(_loc2_[0]);
            _loc29_ = _loc2_[1];
            _loc9_ = _loc2_[2];
            _loc7_ = new dofus.datacenter["\f\x0b"](0,_loc28_,undefined,undefined,_loc29_,_loc9_);
            _loc7_.priceMultiplicator = this.api.lang.getConfigText("BUY_PRICE_MULTIPLICATOR");
            _loc7_.itemPago = _loc2_[3] != undefined ? Number(_loc2_[3]) : 0;
            _loc41_.push(_loc7_);
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc41_;
         break;
      case 5:
      case 15:
      case 8:
         _loc12_ = sExtraData.split(";");
         _loc9_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
         for(_loc45_ in _loc12_)
         {
            _loc6_ = _loc12_[_loc45_];
            _loc10_ = _loc6_.charAt(0);
            _loc8_ = _loc6_.substr(1);
            switch(_loc10_)
            {
               case "O":
                  _loc11_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc8_);
                  _loc9_.push(_loc11_);
                  break;
               case "G":
                  this.onStorageKama(_loc8_);
            }
         }
         this.api.datacenter.Temporary.Storage.inventory = _loc9_;
         if(dofus["\x12\x03"].SAVING_THE_WORLD)
         {
            dofus["\x1e\x14\x10"].getInstance().newItems(sExtraData);
            dofus["\x1e\x14\x10"].getInstance().nextAction();
         }
         break;
      case 4:
      case 6:
         _loc36_ = sExtraData.split("|");
         _loc40_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
         for(_loc45_ in _loc36_)
         {
            _loc4_ = _loc36_[_loc45_].split(";");
            _loc16_ = Number(_loc4_[0]);
            _loc19_ = Number(_loc4_[1]);
            _loc30_ = Number(_loc4_[2]);
            _loc32_ = _loc4_[3];
            _loc20_ = Number(_loc4_[4]);
            _loc27_ = _loc4_[5];
            _loc13_ = new dofus.datacenter["\f\x0b"](_loc16_,_loc30_,_loc19_,-1,_loc32_,_loc20_);
            _loc13_.rarity = _loc27_;
            _loc7_.itemPago = _loc2_[5] != undefined ? Number(_loc2_[5]) : 0;
            _loc40_.push(_loc13_);
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc40_;
         break;
      case 10:
         _loc35_ = sExtraData.split("|");
         _loc39_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
         if(sExtraData.length != 0)
         {
            for(_loc45_ in _loc35_)
            {
               _loc5_ = _loc35_[_loc45_].split(";");
               _loc33_ = Number(_loc5_[0]);
               _loc17_ = Number(_loc5_[1]);
               _loc22_ = Number(_loc5_[2]);
               _loc31_ = _loc5_[3];
               _loc18_ = Number(_loc5_[4]);
               _loc24_ = Number(_loc5_[5]);
               _loc15_ = new dofus.datacenter["\f\x0b"](_loc33_,_loc22_,_loc17_,-1,_loc31_,_loc18_);
               _loc7_.itemPago = _loc2_[6] != undefined ? Number(_loc2_[6]) : 0;
               _loc15_.remainingHours = _loc24_;
               _loc39_.push(_loc15_);
            }
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc39_;
         break;
      case 30:
         _loc12_ = sExtraData.split(";");
         _loc9_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
         for(_loc45_ in _loc12_)
         {
            _loc6_ = _loc12_[_loc45_];
            _loc10_ = _loc6_.charAt(0);
            _loc8_ = _loc6_.substr(1);
            if((_loc0_ = _loc10_) === "O")
            {
               _loc11_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc8_);
               _loc9_.push(_loc11_);
            }
         }
         this.api.datacenter.Player.Bank = _loc9_;
         break;
      default:
         _loc38_ = sExtraData.split("|");
         _loc43_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
         if(sExtraData.length != 0)
         {
            for(var _loc44_ in _loc38_)
            {
               _loc3_ = _loc38_[_loc44_].split(";");
               _loc34_ = Number(_loc3_[0]);
               _loc27_ = Number(_loc3_[1]);
               _loc26_ = Number(_loc3_[2]);
               _loc23_ = _loc3_[3];
               _loc21_ = Number(_loc3_[4]);
               _loc25_ = Number(_loc3_[5]);
               _loc14_ = new dofus.datacenter["\f\x0b"](_loc34_,_loc26_,_loc27_,-1,_loc23_,_loc21_);
               _loc14_.remainingHours = _loc25_;
               _loc43_.push(_loc14_);
            }
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc43_;
   }
};
_loc1.onList2 = function(sExtraData)
{
   var _loc6_ = sExtraData.split(";");
   var _loc7_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc2_;
   var _loc3_;
   var _loc4_;
   var _loc0_;
   var _loc5_;
   for(var _loc8_ in _loc6_)
   {
      _loc2_ = _loc6_[_loc8_];
      _loc3_ = _loc2_.charAt(0);
      _loc4_ = _loc2_.substr(1);
      if((_loc0_ = _loc3_) === "O")
      {
         _loc5_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc4_);
         _loc7_.push(_loc5_);
      }
   }
   this.api.datacenter.Player.Bank = _loc7_;
};
_loc1.onCreate = function(bSuccess, sExtraData)
{
   if(!bSuccess)
   {
      return undefined;
   }
   var _loc7_ = sExtraData.split("|");
   var _loc16_ = Number(_loc7_[0]);
   var _loc12_ = _loc7_[1];
   this.api.datacenter.Basics.aks_exchange_echangeType = _loc16_;
   var _loc5_ = this.api.datacenter.Temporary;
   var _loc15_;
   var _loc20_;
   var _loc25_;
   var _loc23_;
   var _loc24_;
   var _loc22_;
   var _loc21_;
   var _loc27_;
   var _loc26_;
   var _loc17_;
   var _loc11_;
   var _loc6_;
   var _loc8_;
   var _loc19_;
   var _loc18_;
   var _loc9_;
   var _loc10_;
   var _loc3_;
   var _loc4_;
   switch(_loc16_)
   {
      case 0:
      case 4:
      case 20:
         _loc5_.Shop = new dofus.datacenter.Shop();
         _loc15_ = this.api.datacenter.Sprites.getItemAt(_loc12_);
         if(_loc16_ == 20)
         {
            _loc5_.Shop.name = "Boutique";
            _loc5_.Shop.gfx = _loc12_;
         }
         else
         {
            _loc5_.Shop.name = _loc15_.name;
            _loc5_.Shop.gfx = _loc15_.gfxID;
         }
         _loc20_ = new Array();
         _loc20_[1] = _loc15_.color1 == undefined ? -1 : _loc15_.color1;
         _loc20_[2] = _loc15_.color2 == undefined ? -1 : _loc15_.color2;
         _loc20_[3] = _loc15_.color3 == undefined ? -1 : _loc15_.color3;
         if(_loc16_ == 0 || _loc16_ == 20)
         {
            this.api.ui.loadUIComponent("NpcShop","NpcShop",{data:_loc5_.Shop,colors:_loc20_});
         }
         else if(_loc16_ == 4)
         {
            this.api.ui.loadUIComponent("PlayerShop","PlayerShop",{data:_loc5_.Shop,colors:_loc20_});
         }
         break;
      case 1:
         this.api.datacenter.Exchange.inventory = this.api.datacenter.Player.Inventory.clone();
         this.api.ui.unloadUIComponent("AskYesNoIgnoreExchange");
         this.api.ui.unloadUIComponent("AskCancelExchange");
         this.api.ui.loadUIComponent("Exchange","Exchange");
         break;
      case 2:
      case 9:
      case 17:
      case 18:
      case 3:
         if(_loc16_ == 3)
         {
            this.api.datacenter.Exchange = new dofus.datacenter.Exchange();
         }
         else
         {
            this.api.datacenter.Exchange = new dofus.datacenter.Exchange(Number(_loc12_));
         }
         this.api.datacenter.Exchange.inventory = this.api.datacenter.Player.Inventory.clone();
         if(_loc16_ == 3)
         {
            _loc7_ = _loc12_.split(";");
            _loc25_ = Number(_loc7_[0]);
            _loc23_ = Number(_loc7_[1]);
            if(_global.API.lang.getSkillForgemagus(_loc23_) > 0)
            {
               this.api.ui.loadUIComponent("ForgemagusCraft","Craft",{skillId:_loc23_,maxItem:_loc25_});
            }
            else
            {
               this.api.ui.loadUIComponent("Craft","Craft",{skillId:_loc23_,maxItem:_loc25_});
            }
         }
         else
         {
            this.api.ui.unloadUIComponent("AskYesNoIgnoreExchange");
            this.api.ui.unloadUIComponent("AskCancelExchange");
            this.api.ui.loadUIComponent("Exchange","Exchange");
         }
         break;
      case 5:
         _loc5_.Storage = new dofus.datacenter.Storage();
         this.api.ui.loadUIComponent("Storage","Storage",{data:_loc5_.Storage});
         break;
      case 8:
         _loc5_.Storage = new dofus.datacenter.TaxCollectorStorage();
         _loc24_ = this.api.datacenter.Sprites.getItemAt(_loc12_);
         _loc5_.Storage.name = _loc24_.name;
         _loc5_.Storage.gfx = _loc24_.gfxID;
         this.api.ui.loadUIComponent("TaxCollectorStorage","TaxCollectorStorage",{data:_loc5_.Storage});
         break;
      case 6:
         _loc5_.Shop = new dofus.datacenter.Shop();
         this.api.ui.loadUIComponent("PlayerShopModifier","PlayerShopModifier",{data:_loc5_.Shop});
         break;
      case 10:
         _loc5_.Shop = new dofus.datacenter["\x19\x03"]();
         _loc7_ = _loc12_.split(";");
         _loc22_ = _loc7_[0].split(",");
         _loc5_.Shop.quantity1 = Number(_loc22_[0]);
         _loc5_.Shop.quantity2 = Number(_loc22_[1]);
         _loc5_.Shop.quantity3 = Number(_loc22_[2]);
         _loc5_.Shop.types = _loc7_[1].split(",");
         _loc5_.Shop.tax = Number(_loc7_[2]);
         _loc5_.Shop.maxLevel = Number(_loc7_[3]);
         _loc5_.Shop.maxItemCount = Number(_loc7_[4]);
         _loc5_.Shop.npcID = Number(_loc7_[5]);
         _loc5_.Shop.maxSellTime = Number(_loc7_[6]);
         this.api.ui.loadUIComponent("BigStoreSell","BigStoreSell",{data:_loc5_.Shop});
         break;
      case 11:
         _loc5_.Shop = new dofus.datacenter["\x19\x03"]();
         _loc7_ = _loc12_.split(";");
         _loc21_ = _loc7_[0].split(",");
         _loc5_.Shop.quantity1 = Number(_loc21_[0]);
         _loc5_.Shop.quantity2 = Number(_loc21_[1]);
         _loc5_.Shop.quantity3 = Number(_loc21_[2]);
         _loc5_.Shop.types = _loc7_[1].split(",");
         _loc5_.Shop.tax = Number(_loc7_[2]);
         _loc5_.Shop.maxLevel = Number(_loc7_[3]);
         _loc5_.Shop.maxItemCount = Number(_loc7_[4]);
         _loc5_.Shop.npcID = Number(_loc7_[5]);
         _loc5_.Shop.maxSellTime = Number(_loc7_[6]);
         this.api.ui.loadUIComponent("BigStoreBuy","BigStoreBuy",{data:_loc5_.Shop});
         break;
      case 12:
      case 13:
         this.api.datacenter.Exchange.inventory = this.api.datacenter.Player.Inventory.clone();
         _loc7_ = _loc12_.split(";");
         _loc27_ = Number(_loc7_[0]);
         _loc26_ = Number(_loc7_[1]);
         this.api.ui.unloadUIComponent("AskYesNoIgnoreExchange");
         this.api.ui.unloadUIComponent("AskCancelExchange");
         this.api.ui.loadUIComponent("SecureCraft","SecureCraft",{skillId:_loc26_,maxItem:_loc27_});
         break;
      case 14:
         _loc17_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
         _loc11_ = _loc12_.split(";");
         _loc6_ = 0;
         while(_loc6_ < _loc11_.length)
         {
            _loc8_ = Number(_loc11_[_loc6_]);
            _loc17_.push({label:this.api.lang.getJobText(_loc8_).n,id:_loc8_});
            _loc6_ += 1;
         }
         this.api.ui.loadUIComponent("CrafterList","CrafterList",{crafters:new ank["\x1e\n\t"]["\x0e\x1d"](),jobs:_loc17_});
         break;
      case 15:
         this.api.ui.unloadUIComponent("Mount");
         _loc5_.Storage = new dofus.datacenter.Storage();
         this.api.ui.loadUIComponent("Storage","Storage",{isMount:true,data:_loc5_.Storage});
         break;
      case 16:
         _loc19_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
         _loc18_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
         _loc7_ = _loc12_.split("~");
         _loc9_ = _loc7_[0].split(";");
         _loc10_ = _loc7_[1].split(";");
         if(_loc9_ != undefined)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc9_.length)
            {
               if(_loc9_[_loc3_] != "")
               {
                  _loc19_.push(this.api.network.Mount.createMount(_loc9_[_loc3_]));
               }
               _loc3_ += 1;
            }
         }
         if(_loc10_ != undefined)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc10_.length)
            {
               if(_loc10_[_loc4_] != "")
               {
                  _loc18_.push(this.api.network.Mount.createMount(_loc10_[_loc4_]));
               }
               _loc4_ += 1;
            }
         }
         this.api.ui.loadUIComponent("MountStorage","MountStorage",{mounts:_loc19_,parkMounts:_loc18_});
   }
};
_loc1.onDistantMovement = function(bSuccess, sExtraData)
{
   var _loc9_;
   var _loc2_;
   var _loc6_;
   var _loc10_;
   var _loc11_;
   var _loc12_;
   var _loc13_;
   var _loc14_;
   var _loc7_;
   var _loc4_;
   var _loc5_;
   var _loc3_;
   switch(this.api.datacenter.Basics.aks_exchange_echangeType)
   {
      case 1:
      case 2:
      case 9:
      case 12:
      case 13:
         this.modifyDistant(sExtraData,this.api.datacenter.Exchange.distantGarbage,"distantKama");
         break;
      case 3:
         this.modifyDistant(sExtraData,this.api.datacenter.Exchange.distantGarbage,"distantKama",true);
         break;
      case 10:
         _loc9_ = sExtraData.charAt(0) == "+";
         _loc2_ = sExtraData.substr(1).split("|");
         _loc6_ = Number(_loc2_[0]);
         _loc10_ = Number(_loc2_[1]);
         _loc11_ = Number(_loc2_[2]);
         _loc12_ = _loc2_[3];
         _loc13_ = Number(_loc2_[4]);
         _loc14_ = Number(_loc2_[5]);
         _loc7_ = _loc2_[6];
         _loc4_ = this.api.datacenter.Temporary.Shop;
         _loc5_ = _loc4_.inventory.findFirstItem("ID",_loc6_);
         if(_loc9_)
         {
            _loc3_ = new dofus.datacenter["\f\x0b"](_loc6_,_loc11_,_loc10_,-1,_loc12_,_loc13_,_loc7_);
            _loc3_.remainingHours = _loc14_;
            _loc3_.rarity = _loc7_;
            if(_loc5_.index != -1)
            {
               _loc4_.inventory.updateItem(_loc5_.index,_loc3_);
            }
            else
            {
               _loc4_.inventory.push(_loc3_);
            }
         }
         else if(_loc5_.index != -1)
         {
            _loc4_.inventory.removeItems(_loc5_.index,1);
         }
         else
         {
            ank["\x1e\n\t"]["\x0b\x0b"].err("[onDistantMovement] cet objet n\'existe pas id=" + _loc6_);
         }
         this.api.ui.getUIComponent("BigStoreSell").updateItemCount();
   }
};
_loc1.modifyDistant = function(sExtraData, ea, sKamaLocation, bForceModifyInventory)
{
   var _loc18_ = sExtraData.charAt(0);
   var _loc6_ = this.api.datacenter.Exchange;
   var _loc12_;
   var _loc5_;
   var _loc8_;
   var _loc9_;
   var _loc13_;
   var _loc14_;
   var _loc15_;
   var _loc7_;
   var _loc3_;
   var _loc16_;
   var _loc4_;
   var _loc17_;
   switch(_loc18_)
   {
      case "O":
         _loc12_ = sExtraData.charAt(1) == "+";
         _loc5_ = sExtraData.substr(2).split("|");
         _loc8_ = Number(_loc5_[0]);
         _loc9_ = Number(_loc5_[1]);
         _loc13_ = Number(_loc5_[2]);
         _loc14_ = _loc5_[3];
         _loc15_ = _loc5_[4];
         _loc7_ = ea.findFirstItem("ID",_loc8_);
         if(_loc12_)
         {
            _loc3_ = new dofus.datacenter["\f\x0b"](_loc8_,_loc13_,_loc9_,-1,_loc14_);
            _loc3_.rarity = _loc15_;
            _loc16_ = bForceModifyInventory == undefined ? _loc6_.distantPlayerID == undefined : bForceModifyInventory;
            if(_loc7_.index != -1)
            {
               ea.updateItem(_loc7_.index,_loc3_);
            }
            else
            {
               ea.push(_loc3_);
            }
            if(_loc16_)
            {
               _loc4_ = _loc6_.inventory.findFirstItem("ID",_loc8_);
               if(_loc4_.index != -1)
               {
                  _loc4_.item.position = -1;
                  if(this.api.datacenter.Basics.aks_exchange_isForgemagus)
                  {
                     _loc4_.item.Quantity = Number(_loc9_);
                     this.api.ui.getUIComponent("Craft").updateDistantData();
                  }
                  else
                  {
                     _loc4_.item.Quantity = Number(_loc4_.item.Quantity) + Number(_loc9_);
                  }
                  _loc6_.inventory.updateItem(_loc4_.index,_loc3_);
               }
               else
               {
                  _loc6_.inventory.push(_loc3_);
                  _global.API.ui.getUIComponent("Craft").updateForgemagusResult(_loc3_);
               }
            }
         }
         else if(_loc7_.index != -1)
         {
            ea.removeItems(_loc7_.index,1);
         }
         break;
      case "G":
         _loc17_ = Number(sExtraData.substr(1));
         _loc6_[sKamaLocation] = _loc17_;
   }
};
_loc1.modifyLocal = function(sExtraData, ea, sKamaLocation)
{
   var _loc15_ = sExtraData.charAt(0);
   var _loc4_ = this.api.datacenter.Exchange;
   var _loc16_;
   var _loc6_;
   var _loc5_;
   var _loc9_;
   var _loc8_;
   var _loc2_;
   var _loc3_;
   var _loc18_;
   var _loc12_;
   var _loc7_;
   var _loc14_;
   var _loc13_;
   var _loc17_;
   switch(_loc15_)
   {
      case "O":
         _loc16_ = sExtraData.charAt(1) == "+";
         _loc6_ = sExtraData.substr(2).split("|");
         _loc5_ = Number(_loc6_[0]);
         _loc9_ = Number(_loc6_[1]);
         _loc8_ = this.api.datacenter.Player.Inventory.findFirstItem("ID",_loc5_);
         _loc2_ = _loc4_.inventory.findFirstItem("ID",_loc5_);
         _loc3_ = ea.findFirstItem("ID",_loc5_);
         _loc18_ = _loc6_[2];
         if(_loc16_)
         {
            _loc12_ = _loc2_.item;
            _loc7_ = new dofus.datacenter["\f\x0b"](_loc5_,_loc12_.unicID,_loc9_,-2,_loc12_.compressedEffects);
            _loc14_ = -1;
            _loc13_ = _loc8_.item.Quantity - _loc9_;
            if(_loc13_ == 0)
            {
               _loc14_ = -3;
            }
            _loc2_.item.Quantity = _loc13_;
            _loc7_.rarity = _loc18_;
            _loc2_.item.position = _loc14_;
            _loc4_.inventory.updateItem(_loc2_.index,_loc2_.item);
            if(_loc3_.index != -1)
            {
               ea.updateItem(_loc3_.index,_loc7_);
            }
            else
            {
               ea.push(_loc7_);
            }
         }
         else if(_loc3_.index != -1)
         {
            _loc2_.item.position = -1;
            _loc2_.item.Quantity = _loc8_.item.Quantity;
            _loc4_.inventory.updateItem(_loc2_.index,_loc2_.item);
            ea.removeItems(_loc3_.index,1);
         }
         break;
      case "G":
         _loc17_ = Number(sExtraData.substr(1));
         _loc4_[sKamaLocation] = _loc17_;
   }
};
_loc1.onRequest = function(bSuccess, sExtraData)
{
   var _loc7_;
   var _loc5_;
   var _loc8_;
   var _loc4_;
   var _loc10_;
   var _loc9_;
   var _loc11_;
   var _loc6_;
   var _loc2_;
   var _loc3_;
   var _loc12_;
   if(bSuccess)
   {
      _loc7_ = sExtraData.split("|");
      _loc5_ = _loc7_[0];
      _loc8_ = _loc7_[1];
      _loc4_ = Number(_loc7_[2]);
      _loc10_ = this.api.datacenter.Player.ID == _loc5_ ? _loc8_ : _loc5_;
      if(_loc4_ == 12 || _loc4_ == 13)
      {
         _loc9_ = new dofus.datacenter["\x1e\x12\x1d"](_loc10_);
      }
      else
      {
         _loc9_ = new dofus.datacenter.Exchange(_loc10_);
      }
      this.api.datacenter.Exchange = _loc9_;
      if(this.api.datacenter.Player.ID == _loc5_)
      {
         _loc11_ = this.api.datacenter.Sprites.getItemAt(_loc8_);
         switch(_loc4_)
         {
            case 1:
               _loc6_ = "WAIT_FOR_EXCHANGE";
               break;
            case 12:
               _loc6_ = "WAIT_FOR_CRAFT_CLIENT";
               break;
            case 13:
               _loc6_ = "WAIT_FOR_CRAFT_ARTISAN";
         }
         this.api.kernel.showMessage(this.api.lang.getText("EXCHANGE"),this.api.lang.getText(_loc6_,[_loc11_.name]),"INFO_CANCEL",{name:"Exchange",listener:this});
      }
      else
      {
         _loc2_ = this.api.datacenter.Sprites.getItemAt(_loc5_);
         if(this.api.kernel.ChatManager.isBlacklisted(_loc2_.name))
         {
            this.leave();
            return undefined;
         }
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CHAT_A_WANT_EXCHANGE",[this.api.kernel.ChatManager.getLinkName(_loc2_.name)]),"INFO_CHAT");
         switch(_loc4_)
         {
            case 1:
               _loc3_ = "A_WANT_EXCHANGE";
               break;
            case 12:
               _loc3_ = "A_WANT_CRAFT_CLIENT";
               break;
            case 13:
               _loc3_ = "A_WANT_CRAFT_ARTISAN";
         }
         this.api.kernel.makeNotification(this.api.lang.getText(_loc3_,[_loc2_.name]));
         this.api.kernel.showMessage(this.api.lang.getText("EXCHANGE"),this.api.lang.getText(_loc3_,[_loc2_.name]),"CAUTION_YESNOIGNORE",{name:"Exchange",player:_loc2_.name,listener:this,params:{player:_loc2_.name}});
      }
   }
   else
   {
      _loc12_ = sExtraData.charAt(0);
      switch(_loc12_)
      {
         case "O":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ALREADY_EXCHANGE"),"ERROR_CHAT");
            break;
         case "T":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_NEAR_CRAFT_TABLE"),"ERROR_CHAT");
            break;
         case "J":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_85"),"ERROR_CHAT");
            break;
         case "o":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_70"),"ERROR_CHAT");
            break;
         case "S":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_62"),"ERROR_CHAT");
            break;
         case "I":
         default:
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_EXCHANGE"),"ERROR_CHAT");
      }
   }
};
_loc1.onBigStoreTypeItemsList = function(sExtraData)
{
   this.api.ui.getUIComponent("BigStoreBuy").refreshItemTypeList();
   var _loc7_ = sExtraData.split("|");
   var _loc8_ = Number(_loc7_[0]);
   var _loc6_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc5_;
   var _loc2_;
   var _loc3_;
   var _loc4_;
   if(_loc7_[1].length > 0)
   {
      _loc5_ = _loc7_[1].split(";");
      _loc2_ = 0;
      while(_loc2_ < _loc5_.length)
      {
         _loc3_ = Number(_loc5_[_loc2_]);
         if(_loc3_ != -1)
         {
            _loc4_ = new dofus.datacenter["\f\x0b"](0,_loc3_,1,-1,"",0);
            _loc6_.push(_loc4_);
         }
         _loc2_ += 1;
      }
   }
   this.api.datacenter.Temporary.Shop.inventory = _loc6_;
   this.api.ui.getUIComponent("BigStoreBuy").setType(_loc8_);
};
_loc1.onBigStoreItemsList = function(sExtraData)
{
   var _loc11_ = sExtraData.split("|");
   var _loc17_ = Number(_loc11_[0]);
   _loc11_.shift();
   var _loc18_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc2_;
   var _loc3_;
   var _loc10_;
   var _loc8_;
   var _loc4_;
   var _loc9_;
   var _loc5_;
   var _loc6_;
   var _loc7_;
   for(var _loc19_ in _loc11_)
   {
      _loc2_ = _loc11_[_loc19_].split(";");
      _loc3_ = Number(_loc2_[0]);
      _loc10_ = _loc2_[1];
      _loc8_ = Number(_loc2_[2]);
      _loc4_ = Number(_loc2_[3]);
      _loc9_ = Number(_loc2_[4]);
      _loc5_ = Number(_loc2_[5]);
      _loc6_ = new dofus.datacenter["\f\x0b"](_loc3_,_loc17_,0,-1,_loc10_,0,undefined,undefined,_loc5_);
      _loc7_ = {id:_loc3_,item:_loc6_,priceSet1:_loc8_,priceSet2:_loc4_,priceSet3:_loc9_};
      _loc18_.push(_loc7_);
   }
   this.api.datacenter.Temporary.Shop.inventory2 = _loc18_;
   this.api.ui.getUIComponent("BigStoreBuy").updateItemCount();
   this.api.ui.getUIComponent("BigStoreBuy").setItem(_loc17_);
};
_loc1.onBigStoreItemsMovement = function(sExtraData)
{
   var _loc10_ = sExtraData.charAt(0) == "+";
   var _loc2_ = sExtraData.substr(1).split("|");
   var _loc3_ = Number(_loc2_[0]);
   var _loc11_ = Number(_loc2_[1]);
   var _loc7_ = _loc2_[2];
   var _loc9_ = Number(_loc2_[3]);
   var _loc8_ = Number(_loc2_[4]);
   var _loc14_ = Number(_loc2_[5]);
   var _loc13_ = Number(_loc2_[6]);
   var _loc4_ = this.api.datacenter.Temporary.Shop;
   var _loc5_ = _loc4_.inventory2.findFirstItem("id",_loc3_);
   var _loc12_;
   var _loc6_;
   if(_loc10_)
   {
      _loc12_ = new dofus.datacenter["\f\x0b"](_loc3_,_loc11_,0,-1,_loc7_,0,undefined,undefined,_loc13_);
      _loc6_ = {id:_loc3_,item:_loc12_,priceSet1:_loc9_,priceSet2:_loc8_,priceSet3:_loc14_};
      if(_loc5_.index != -1)
      {
         _loc4_.inventory2.updateItem(_loc5_.index,_loc6_);
      }
      else
      {
         _loc4_.inventory2.push(_loc6_);
      }
   }
   else if(_loc5_.index != -1)
   {
      _loc4_.inventory2.removeItems(_loc5_.index,1);
   }
   else
   {
      ank["\x1e\n\t"]["\x0b\x0b"].err("[onBigStoreItemsMovement] cet objet n\'existe pas id=" + _loc3_);
   }
};
