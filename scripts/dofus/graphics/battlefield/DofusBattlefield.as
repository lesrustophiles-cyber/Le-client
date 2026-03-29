var _loc1 = dofus["\r\x13"].battlefield["\x10\x17"].prototype;
_loc1.onSpriteRollOver = function(_loc2_)
{
   this._rollOverMcSprite = _loc2_;
   if(this.api.ui.getUIComponent("Zoom") != undefined)
   {
      return undefined;
   }
   var _loc3_ = _loc2_.data;
   var _loc5_ = _global.palmad.dofus.Constants.OVERHEAD_TEXT_OTHER;
   var _loc4_ = _loc3_.name;
   _global.resetPerso = _loc3_.resets;
   _global.omegaPerso = _loc3_.Omega;
   if(_loc3_.resets > 0)
   {
      _loc4_ = "[P" + _loc3_.resets + "]" + _loc4_;
   }
   if(_loc3_.isClear)
   {
      return undefined;
   }
   if(_loc3_.hasParent)
   {
      this.onSpriteRollOver(_loc3_.linkedParent.mc);
      return undefined;
   }
   var _loc13_;
   if(this.api.datacenter.Game.isRunning || this.api.datacenter.Game.interactionType == 5)
   {
      _loc13_ = this.mapHandler.getCellData(_loc3_.cellNum).mc;
      if(_loc3_.isVisible)
      {
         this.onCellRollOver(_loc13_);
      }
   }
   var _loc10_;
   var _loc7_;
   var _loc8_;
   var _loc6_;
   var _loc12_;
   var _loc14_;
   var _loc11_;
   var _loc9_;
   var _loc15_;
   if(_loc3_ instanceof _global.palmad.dofus.datacenter.Mutant && _loc3_.showIsPlayer)
   {
      if(this.api.datacenter.Game.isRunning)
      {
         _loc4_ = _loc3_.playerName + " (" + _loc3_.LP + ")";
         this.showSpriteInfosIfWeNeed(_loc3_);
      }
      else
      {
         _loc4_ = _loc3_.playerName + " [" + _loc3_.monsterName + " (" + _loc3_.Level + ")]";
      }
   }
   else if(_loc3_ instanceof _global.palmad.dofus.datacenter.Mutant || (_loc3_ instanceof dofus.datacenter.Creature || _loc3_ instanceof _global.palmad.dofus.datacenter.Monster))
   {
      _loc5_ = _global.palmad.dofus.Constants.NPC_ALIGNMENT_COLOR[_loc3_.alignment.index];
      if(this.api.datacenter.Game.isRunning)
      {
         _loc4_ += " (" + _loc3_.LP + ")";
         this.showSpriteInfosIfWeNeed(_loc3_);
      }
      else
      {
         _loc4_ += " (" + _loc3_.Level + ")";
      }
   }
   else if(_loc3_ instanceof _global.palmad.dofus.datacenter.Character)
   {
      _loc5_ = _global.palmad.dofus.Constants.OVERHEAD_TEXT_CHARACTER;
      if(_loc3_.colorNombre != undefined && _loc3_.colorNombre > -1)
      {
         _loc5_ = _loc3_.colorNombre;
      }
      if(this.api.datacenter.Game.isRunning)
      {
         _loc4_ += " (" + _loc3_.LP + ")";
         if(_loc3_.isVisible)
         {
            _loc10_ = _loc3_.EffectsManager.getEffects();
            if(_loc10_.length != 0)
            {
               this.addSpriteOverHeadItem(_loc3_.id,"effects",_global.palmad.dofus.graphics.battlefield.EffectsOverHead,[_loc10_]);
            }
         }
         this.showSpriteInfosIfWeNeed(_loc3_);
      }
      else if(this.api.datacenter.Game.isFight)
      {
         _loc4_ += " (" + _loc3_.Level + ")";
      }
      if(!_loc3_.isVisible)
      {
         return undefined;
      }
      _loc7_ = _global.palmad.dofus.Constants.DEMON_ANGEL_FILE;
      if(_loc3_.alignment.fallenAngelDemon)
      {
         _loc7_ = _global.palmad.dofus.Constants.FALLEN_DEMON_ANGEL_FILE;
      }
      _loc8_ = _loc3_.haveFakeAlignement ? _loc3_.fakeAlignment.index : _loc3_.alignment.index;
      if(_loc3_.rank.value > 0)
      {
         if(_loc8_ == 1)
         {
            _loc6_ = _loc3_.rank.value;
         }
         else if(_loc8_ == 2)
         {
            _loc6_ = 10 + _loc3_.rank.value;
         }
         else if(_loc8_ == 3)
         {
            _loc6_ = 20 + _loc3_.rank.value;
         }
      }
      _loc12_ = _loc3_.title;
      if(_loc3_.guildName != undefined && _loc3_.guildName.length != 0)
      {
         this.addSpriteOverHeadItem(_loc3_.id,"text",dofus["\r\x13"].battlefield["\r\x0b"],[_loc3_.guildName,_loc4_,_loc3_.emblem,_loc7_,_loc6_,_loc3_.pvpGain,_loc12_,"clips/others/css.swf",_loc3_.ornamento],undefined,true);
         _loc4_ = "";
      }
   }
   else if(_loc3_ instanceof _global.palmad.dofus.datacenter.TaxCollector)
   {
      if(this.api.datacenter.Game.isRunning)
      {
         _loc4_ += " (" + _loc3_.LP + ")";
         this.showSpriteInfosIfWeNeed(_loc3_);
      }
      else if(this.api.datacenter.Game.isFight)
      {
         _loc4_ += " (" + _loc3_.Level + ")";
      }
      else
      {
         _loc4_ = "";
         this.addSpriteOverHeadItem(_loc3_.id,"text",_global.palmad.dofus.graphics.battlefield.GuildOverHead,[_loc3_.guildName,_loc3_.name,_loc3_.emblem]);
      }
   }
   else if(_loc3_ instanceof _global.palmad.dofus.datacenter.PrismSprite)
   {
      _loc7_ = _global.palmad.dofus.Constants.DEMON_ANGEL_FILE;
      if(_loc3_.alignment.value > 0)
      {
         if(_loc3_.alignment.index == 1)
         {
            _loc6_ = _loc3_.alignment.value;
         }
         else if(_loc3_.alignment.index == 2)
         {
            _loc6_ = 10 + _loc3_.alignment.value;
         }
         else if(_loc3_.alignment.index == 3)
         {
            _loc6_ = 20 + _loc3_.alignment.value;
         }
      }
      _loc5_ = _global.palmad.dofus.Constants.NPC_ALIGNMENT_COLOR[_loc3_.alignment.index];
      this.addSpriteOverHeadItem(_loc3_.id,"text",_global.palmad.dofus.graphics.battlefield.TextOverHead,[_loc4_,_loc7_,_loc5_,_loc6_]);
   }
   else if(_loc3_ instanceof _global.palmad.dofus.datacenter.ParkMount)
   {
      _loc5_ = _global.palmad.dofus.Constants.OVERHEAD_TEXT_CHARACTER;
      _loc4_ = this.api.lang.getText("MOUNT_PARK_OVERHEAD",[_loc3_.modelName,_loc3_.level,_loc3_.ownerName]);
      this.addSpriteOverHeadItem(_loc3_.id,"text",_global.palmad.dofus.graphics.battlefield.TextOverHead,[_loc4_,_loc7_,_loc5_,_loc6_]);
   }
   else if(_loc3_ instanceof _global.palmad.dofus.datacenter.OfflineCharacter)
   {
      _loc5_ = _global.palmad.dofus.Constants.OVERHEAD_TEXT_CHARACTER;
      _loc4_ = "";
      this.addSpriteOverHeadItem(_loc3_.id,"text",_global.palmad.dofus.graphics.battlefield.OfflineOverHead,[_loc3_]);
   }
   else if(_loc3_ instanceof _global.palmad.dofus.datacenter.NonPlayableCharacter)
   {
      _loc14_ = this.api.datacenter.Map;
      _loc11_ = this.api.datacenter.Subareas.getItemAt(_loc14_.subarea);
      if(_loc11_ != undefined)
      {
         _loc5_ = _global.palmad.dofus.Constants.NPC_ALIGNMENT_COLOR[_loc11_.alignment.index];
      }
   }
   else if(_loc3_ instanceof _global.palmad.dofus.datacenter.MonsterGroup || _loc3_ instanceof dofus.datacenter.Team)
   {
      if(_loc3_.alignment.index != -1)
      {
         _loc5_ = _global.palmad.dofus.Constants.NPC_ALIGNMENT_COLOR[_loc3_.alignment.index];
      }
      _loc9_ = _loc3_.challenge.fightType;
      if(_loc3_.isVisible && (_loc3_ instanceof _global.palmad.dofus.datacenter.MonsterGroup || _loc3_.type == 1 && (_loc9_ == 2 || (_loc9_ == 3 || _loc9_ == 4))))
      {
         if(_loc4_ != "")
         {
            _loc15_ = _global.palmad.dofus.Constants.OVERHEAD_TEXT_TITLE;
            this.addSpriteOverHeadItem(_loc3_.id,"text",_global.palmad.dofus.graphics.battlefield.TextWithTitleOverHead,[_loc4_,_loc7_,_loc5_,_loc6_,this.api.lang.getText("LEVEL") + " " + _loc3_.totalLevel,_loc15_,_loc3_.bonusValue,_loc3_.totalExp]);
         }
         this.selectSprite(_loc3_.id,true);
         return undefined;
      }
   }
   if(_loc3_.isVisible)
   {
      if(_loc4_ != "")
      {
         this.addSpriteOverHeadItem(_loc3_.id,"text",dofus["\r\x13"].battlefield["\x1e\x0b\b"],[_loc4_,_loc7_,_loc5_,_loc6_,_loc3_.pvpGain,_loc12_,"clips/others/css.swf",_loc3_.ornamento]);
      }
      this.selectSprite(_loc3_.id,true);
   }
};
_loc1.onCellRollOver = function(var2)
{
   if(this.api.kernel.TutorialManager.isTutorialMode)
   {
      this.api.kernel.TutorialManager.onWaitingCase({code:"CELL_OVER",params:[var2.num]});
      return undefined;
   }
   if(this.api.datacenter.Game.isRunning && (!this.api.datacenter.Player.isCurrentPlayer && this.api.datacenter.Game.interactionType != 6))
   {
      return undefined;
   }
   var _loc9_;
   var _loc5_;
   var _loc12_;
   var _loc8_;
   var _loc4_;
   var _loc6_;
   var _loc14_;
   var _loc7_;
   var _loc11_;
   var _loc10_;
   switch(this.api.datacenter.Game.interactionType)
   {
      case 1:
         _loc9_ = this.api.datacenter.Player;
         _loc5_ = _loc9_.data;
         _loc12_ = this.mapHandler.getCellData(var2.num).spriteOnID;
         _loc8_ = this.api.datacenter.Sprites.getItemAt(_loc12_);
         if(_loc8_ != undefined)
         {
            this.showSpriteInfosIfWeNeed(_loc8_);
         }
         if(ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].checkRange(this.mapHandler,_loc5_.cellNum,var2.num,false,0,_loc5_.MP,0))
         {
            this.api.datacenter.Player.InteractionsManager.setState(this.api.datacenter.Game.isFight);
            this.api.datacenter.Player.InteractionsManager.calculatePath(this.mapHandler,var2.num,false,this.api.datacenter.Game.isFight);
         }
         else
         {
            delete this.api.datacenter.Basics.interactionsManager_path;
         }
         break;
      case 5:
      case 6:
         this.api.datacenter.Basics.gfx_canLaunch = true;
         this.api.ui.setCursorForbidden(false);
         this.drawPointer(var2.num);
         break;
      case 2:
      case 3:
         _loc4_ = this.api.datacenter.Player;
         _loc6_ = _loc4_.data;
         _loc14_ = _loc6_.cellNum;
         _loc7_ = _loc4_.currentUseObject;
         _loc11_ = _loc4_.SpellsManager;
         _loc10_ = _loc7_.canBoostRange ? _loc6_.CharacteristicsManager.getModeratorValue(19) + _loc4_.RangeModerator : 0;
         this.api.gfx.mapHandler.resetEmptyCells();
         this.api.datacenter.Basics.gfx_canLaunch = _loc11_.checkCanLaunchSpellOnCell(this.mapHandler,_loc7_,this.mapHandler.getCellData(var2.num),_loc10_);
         if(this.api.datacenter.Basics.gfx_canLaunch)
         {
            this.api.ui.setCursorForbidden(false);
            this.drawPointer(var2.num);
         }
         else
         {
            this.api.ui.setCursorForbidden(true,dofus["\x12\x03"].FORBIDDEN_FILE);
         }
         break;
      case 7:
         this.api.ui.setCursorForbidden(false);
         if(Key.isDown(16))
         {
            if(var2.num != undefined)
            {
               if(_global.COLOR_POS_PELEA == 1 || _global.COLOR_POS_PELEA == 2)
               {
                  this.api.network.send("BAADD_FIGHT_POS " + _global.COLOR_POS_PELEA + " " + var2.num);
               }
               else if(_global.COLOR_POS_PELEA == 4)
               {
                  this.api.network.send("BAADD_CELL_MOUNTPARK " + var2.num);
               }
               else
               {
                  this.api.network.send("BADEL_FIGHT_POS " + var2.num);
               }
            }
         }
         break;
      case 8:
         this.api.ui.setCursorForbidden(false);
   }
};
_loc1.onCellRollOut = function(var2)
{
   if(this.api.kernel.TutorialManager.isTutorialMode)
   {
      this.api.kernel.TutorialManager.onWaitingCase({code:"CELL_OUT",params:[var2.num]});
      return undefined;
   }
   if(this.api.datacenter.Game.isRunning && (!this.api.datacenter.Player.isCurrentPlayer && this.api.datacenter.Game.interactionType != 6))
   {
      return undefined;
   }
   switch(this.api.datacenter.Game.interactionType)
   {
      case 1:
         this.hideSpriteInfos();
         this.unSelect(true);
         break;
      case 2:
      case 3:
         this.api.ui.setCursorForbidden(true,dofus["\x12\x03"].FORBIDDEN_FILE);
         this.hidePointer();
         this.api.datacenter.Basics.gfx_canLaunch = false;
         this.hideSpriteInfos();
         break;
      case 5:
      case 6:
         this.api.ui.setCursorForbidden(true,dofus["\x12\x03"].FORBIDDEN_FILE);
         this.api.datacenter.Basics.gfx_canLaunch = false;
         this.hidePointer();
         break;
      case 7:
      case 8:
         this.api.ui.setCursorForbidden(true,dofus["\x12\x03"].FORBIDDEN_FILE);
   }
};
_loc1.onObjectRelease = function(mcObject)
{
   if(this.api.datacenter.Game.interactionType == 7 || this.api.datacenter.Game.interactionType == 8)
   {
      return undefined;
   }
   this.api.ui.hideTooltip();
   var _loc30_ = mcObject.cellData;
   var _loc4_ = _loc30_.mc;
   var _loc35_ = _loc30_.layerObject2Num;
   if(this.api.kernel.TutorialManager.isTutorialMode)
   {
      this.api.kernel.TutorialManager.onWaitingCase({code:"OBJECT_RELEASE",params:[_loc30_.num,_loc35_]});
      return undefined;
   }
   var _loc34_ = _loc30_.layerObjectExternalData;
   var _loc33_;
   if(_loc34_ != undefined)
   {
      if(_loc34_.durability != undefined)
      {
         if(this.api.datacenter.Map.mountPark.isMine(this.api))
         {
            _loc33_ = this.api.ui.createPopupMenu();
            _loc33_.addStaticItem(_loc34_.name);
            _loc33_.addItem(this.api.lang.getText("REMOVE"),this.api.network.Mount,this.api.network.Mount.removeObjectInPark,[_loc4_.num]);
            _loc33_.show(_root._xmouse,_root._ymouse);
            return undefined;
         }
      }
   }
   var _loc32_;
   var _loc29_;
   var _loc5_;
   var _loc38_;
   var _loc36_;
   var _loc26_;
   var _loc23_;
   var _loc7_;
   var _loc16_;
   var _loc21_;
   var _loc20_;
   var _loc13_;
   var _loc22_;
   var _loc37_;
   var _loc8_;
   var _loc9_;
   var _loc18_;
   var _loc17_;
   var _loc40_;
   var _loc39_;
   var _loc28_;
   var _loc27_;
   var _loc24_;
   var _loc11_;
   var _loc10_;
   var _loc19_;
   var _loc6_;
   var _loc25_;
   var _loc15_;
   var _loc14_;
   var _loc12_;
   if(!_global.isNaN(_loc35_) && (this.api.datacenter.Player.canUseInteractiveObjects && this.api.datacenter.Game.interactionType != 5))
   {
      _loc32_ = this.api.lang.getInteractiveObjectDataByGfxText(_loc35_);
      _loc29_ = _loc32_.n;
      _loc5_ = _loc32_.sk;
      _loc38_ = _loc32_.t;
      switch(_loc38_)
      {
         case 1:
         case 2:
         case 3:
         case 4:
         case 7:
         case 10:
         case 12:
         case 14:
         case 15:
            _loc36_ = this.api.datacenter.Player.currentJobID != undefined;
            if(_loc36_)
            {
               _loc26_ = this.api.datacenter.Player.Jobs.findFirstItem("id",this.api.datacenter.Player.currentJobID).item.skills;
            }
            else
            {
               _loc26_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
            }
            _loc23_ = this.api.ui.createPopupMenu();
            _loc23_.addStaticItem(_loc29_);
            for(var _loc31_ in _loc5_)
            {
               _loc7_ = _loc5_[_loc31_];
               _loc16_ = new dofus.datacenter["\x1e\x11\x03"](_loc7_);
               _loc21_ = _loc26_.findFirstItem("id",_loc7_).index != -1;
               _loc20_ = this.api.datacenter.Player.Level <= dofus["\x12\x03"].NOVICE_LEVEL;
               _loc13_ = _loc16_.getState(_loc21_,false,false,false,false,_loc20_);
               if(_loc13_ != "X")
               {
                  _loc23_.addItem(_loc16_.description,this.api.kernel.GameManager,this.api.kernel.GameManager.useRessource,[_loc4_,_loc4_.num,_loc7_],_loc13_ == "V");
               }
            }
            _loc23_.show(_root._xmouse,_root._ymouse);
            break;
         case 5:
            _loc22_ = this.api.ui.createPopupMenu();
            _loc37_ = this.api.lang.getHousesDoorText(this.api.datacenter.Map.id,_loc4_.num);
            _loc8_ = this.api.datacenter.Houses.getItemAt(_loc37_);
            _loc22_.addStaticItem(_loc29_ + " " + _loc8_.name);
            if(_loc8_.localOwner)
            {
               _loc22_.addStaticItem(this.api.lang.getText("MY_HOME"));
            }
            else if(_loc8_.ownerName != undefined)
            {
               if(_loc8_.ownerName == "?")
               {
                  _loc22_.addStaticItem(this.api.lang.getText("HOUSE_WITH_NO_OWNER"));
               }
               else
               {
                  _loc22_.addStaticItem(this.api.lang.getText("HOME_OF",[_loc8_.ownerName]));
               }
            }
            for(_loc31_ in _loc5_)
            {
               _loc9_ = _loc5_[_loc31_];
               _loc18_ = new dofus.datacenter["\x1e\x11\x03"](_loc9_);
               _loc17_ = _loc18_.getState(true,_loc8_.localOwner,_loc8_.isForSale,_loc8_.isLocked);
               if(_loc17_ != "X")
               {
                  _loc22_.addItem(_loc18_.description,this.api.kernel.GameManager,this.api.kernel.GameManager.useRessource,[_loc4_,_loc4_.num,_loc9_],_loc17_ == "V");
               }
            }
            _loc22_.show(_root._xmouse,_root._ymouse);
            break;
         case 6:
            _loc40_ = this.api.datacenter.Map.id + "_" + _loc4_.num;
            _loc39_ = this.api.datacenter.Storages.getItemAt(_loc40_);
            _loc28_ = _loc39_.isLocked;
            _loc27_ = this.api.datacenter.Player.isAtHome(this.api.datacenter.Map.id);
            _loc24_ = this.api.ui.createPopupMenu();
            _loc24_.addStaticItem(_loc29_);
            for(_loc31_ in _loc5_)
            {
               _loc11_ = _loc5_[_loc31_];
               _loc10_ = new dofus.datacenter["\x1e\x11\x03"](_loc11_);
               _loc19_ = _loc10_.getState(true,_loc27_,true,_loc28_);
               if(_loc19_ != "X")
               {
                  _loc24_.addItem(_loc10_.description,this.api.kernel.GameManager,this.api.kernel.GameManager.useRessource,[_loc4_,_loc4_.num,_loc11_],_loc19_ == "V");
               }
            }
            _loc24_.show(_root._xmouse,_root._ymouse);
            break;
         case 13:
            _loc6_ = this.api.datacenter.Map.mountPark;
            _loc25_ = this.api.ui.createPopupMenu();
            _loc25_.addStaticItem(_loc29_);
            for(_loc31_ in _loc5_)
            {
               _loc15_ = _loc5_[_loc31_];
               _loc14_ = new dofus.datacenter["\x1e\x11\x03"](_loc15_);
               _loc12_ = _loc14_.getState(true,_loc6_.isMine(this.api),_loc6_.price > 0,_loc6_.isPublic || _loc6_.isMine(this.api),false,_loc6_.isPublic);
               if(_loc12_ != "X")
               {
                  _loc25_.addItem(_loc14_.description,this.api.kernel.GameManager,this.api.kernel.GameManager.useRessource,[_loc4_,_loc4_.num,_loc15_],_loc12_ == "V");
               }
            }
            _loc25_.show(_root._xmouse,_root._ymouse);
            break;
         default:
            this.onCellRelease(_loc4_);
      }
   }
   else
   {
      this.onCellRelease(_loc4_);
   }
};
_loc1.onObjectRollOver = function(mcObject)
{
   if(this.api.ui.getUIComponent("Zoom") != undefined || this.api.datacenter.Game.interactionType == 7 || this.api.datacenter.Game.interactionType == 8)
   {
      return undefined;
   }
   var _loc5_ = mcObject.cellData;
   var _loc3_ = _loc5_.mc;
   var _loc15_ = _loc5_.layerObject2Num;
   if(this.api.datacenter.Game.interactionType == 5)
   {
      this.onCellRollOver(_loc3_);
   }
   mcObject.select(true);
   var _loc4_ = _loc5_.layerObjectExternalData;
   var _loc8_;
   var _loc12_;
   if(_loc4_ != undefined)
   {
      _loc8_ = _loc4_.name;
      if(_loc4_.durability != undefined)
      {
         if(this.api.datacenter.Map.mountPark.isMine(this.api))
         {
            _loc8_ += "\n" + this.api.lang.getText("DURABILITY") + " : " + _loc4_.durability + "/" + _loc4_.durabilityMax;
         }
      }
      _loc12_ = new dofus.datacenter["\x13\x01"]("itemOnCell",ank.battlefield.mc["\x1e\x0e\x12"],"",_loc3_.num,0,0);
      this.api.datacenter.Sprites.addItemAt("itemOnCell",_loc12_);
      this.api.gfx.addSprite("itemOnCell");
      this.addSpriteOverHeadItem("itemOnCell","text",dofus["\r\x13"].battlefield.TextOverHead,[_loc8_,"",dofus["\x12\x03"].OVERHEAD_TEXT_CHARACTER]);
   }
   var _loc6_ = this.api.lang.getInteractiveObjectDataByGfxText(_loc15_);
   var _loc13_ = _loc6_.n;
   var _loc19_ = _loc6_.sk;
   var _loc10_ = _loc6_.t;
   var _loc14_;
   var _loc11_;
   var _loc7_;
   var _loc16_;
   var _loc2_;
   var _loc17_;
   var _loc9_;
   switch(_loc10_)
   {
      case 1:
         _loc14_ = new dofus.datacenter["\x13\x01"]("recursos",ank.battlefield.mc["\x1e\x0e\x12"],"",_loc3_.num,0,0);
         this.api.datacenter.Sprites.addItemAt("recursos",_loc14_);
         this.api.gfx.addSprite("recursos");
         this.addSpriteOverHeadItem("recursos","text",dofus["\r\x13"].battlefield.TextWithTitleOverHead,["",undefined,undefined,undefined,_loc13_,dofus["\x12\x03"].OVERHEAD_TEXT_TITLE,_loc5_.estrellas]);
         break;
      case 5:
         _loc11_ = this.api.lang.getHousesDoorText(this.api.datacenter.Map.id,_loc3_.num);
         _loc7_ = this.api.datacenter.Houses.getItemAt(_loc11_);
         if(_loc7_.guildName.length > 0)
         {
            _loc16_ = new dofus.datacenter["\x13\x01"]("porte",ank.battlefield.mc["\x1e\x0e\x12"],"",_loc3_.num,0,0);
            this.api.datacenter.Sprites.addItemAt("porte",_loc16_);
            this.api.gfx.addSprite("porte");
            this.addSpriteOverHeadItem("porte","text",dofus["\r\x13"].battlefield.GuildOverHead,[this.api.lang.getText("GUILD_HOUSE"),_loc7_.guildName,_loc7_.guildEmblem,undefined,undefined,undefined,undefined,undefined,undefined,undefined,dofus["\x12\x03"].OVERHEAD_TEXT_CHARACTER]);
         }
         break;
      case 13:
         _loc2_ = this.api.datacenter.Map.mountPark;
         _loc17_ = new dofus.datacenter["\x13\x01"]("enclos",ank.battlefield.mc["\x1e\x0e\x12"],"",_loc3_.num,0,0);
         this.api.datacenter.Sprites.addItemAt("enclos",_loc17_);
         this.api.gfx.addSprite("enclos");
         if(_loc2_.isPublic)
         {
            this.addSpriteOverHeadItem("enclos","text",dofus["\r\x13"].battlefield.TextOverHead,[this.api.lang.getText("MOUNTPARK_PUBLIC"),"",dofus["\x12\x03"].OVERHEAD_TEXT_CHARACTER]);
            break;
         }
         if(_loc2_.hasNoOwner)
         {
            this.addSpriteOverHeadItem("enclos","text",dofus["\r\x13"].battlefield.TextOverHead,[this.api.lang.getText("MOUNTPARK_TO_BUY",[_loc2_.price,_loc2_.size,_loc2_.items]),"",dofus["\x12\x03"].OVERHEAD_TEXT_CHARACTER]);
            break;
         }
         if(_loc2_.price > 0)
         {
            _loc9_ = this.api.lang.getText("MOUNTPARK_PRIVATE_TO_BUY",[_loc2_.price]);
         }
         else
         {
            _loc9_ = this.api.lang.getText("MOUNTPARK_PRIVATE");
         }
         this.addSpriteOverHeadItem("enclos","text",dofus["\r\x13"].battlefield.GuildOverHead,[_loc2_.guildName,_loc9_,_loc2_.guildEmblem,undefined,undefined,undefined,undefined,undefined,undefined,undefined,dofus["\x12\x03"].OVERHEAD_TEXT_CHARACTER]);
         break;
   }
};
_loc1.onObjectRollOut = function(mcObject)
{
   this.api.ui.hideTooltip();
   var _loc2_;
   if(this.api.datacenter.Game.interactionType == 5)
   {
      _loc2_ = mcObject.cellData.mc;
      this.onCellRollOut(_loc2_);
   }
   mcObject.select(false);
   this.removeSpriteOverHeadLayer("recursos","text");
   this.removeSprite("recursos",false);
   this.removeSpriteOverHeadLayer("enclos","text");
   this.removeSprite("enclos",false);
   this.removeSpriteOverHeadLayer("porte","text");
   this.removeSprite("porte",false);
   this.removeSpriteOverHeadLayer("itemOnCell","text");
   this.removeSprite("itemOnCell",false);
};
_loc1.onObjectRollOver = function(mcObject)
{
   if(this.api.ui.getUIComponent("Zoom") != undefined || this.api.datacenter.Game.interactionType == 7 || this.api.datacenter.Game.interactionType == 8)
   {
      return undefined;
   }
   var _loc6_ = mcObject.cellData;
   var _loc4_ = _loc6_.mc;
   var _loc18_ = _loc6_.layerObject2Num;
   if(this.api.datacenter.Game.interactionType == 5)
   {
      this.onCellRollOver(_loc4_);
   }
   mcObject.select(true);
   var _loc5_ = _loc6_.layerObjectExternalData;
   var _loc7_;
   var _loc11_;
   if(_loc5_ != undefined)
   {
      _loc7_ = _loc5_.name;
      if(_loc5_.durability != undefined)
      {
         if(this.api.datacenter.Map.mountPark.isMine(this.api))
         {
            _loc7_ += "\n" + this.api.lang.getText("DURABILITY") + " : " + _loc5_.durability + "/" + _loc5_.durabilityMax;
         }
      }
      _loc11_ = new _global.palmad.dofus.datacenter.Character("itemOnCell",_global.palmad.ank.battlefield.mc.Sprite,"",_loc4_.num,0,0);
      this.api.datacenter.Sprites.addItemAt("itemOnCell",_loc11_);
      this.api.gfx.addSprite("itemOnCell");
      this.addSpriteOverHeadItem("itemOnCell","text",_global.palmad.dofus.graphics.battlefield.TextOverHead,[_loc7_,"",_global.palmad.dofus.Constants.OVERHEAD_TEXT_CHARACTER]);
   }
   var _loc8_ = this.api.lang.getInteractiveObjectDataByGfxText(_loc18_);
   var _loc12_ = _loc8_.n;
   var _loc20_ = _loc8_.sk;
   var _loc13_ = _loc8_.t;
   var _loc17_;
   var _loc14_;
   var _loc9_;
   var _loc15_;
   var _loc3_;
   var _loc16_;
   var _loc10_;
   switch(_loc13_)
   {
      case 1:
         _loc17_ = new _global.palmad.dofus.datacenter.Character("recursos",_global.palmad.ank.battlefield.mc.Sprite,"",_loc4_.num,0,0);
         this.api.datacenter.Sprites.addItemAt("recursos",_loc17_);
         this.api.gfx.addSprite("recursos");
         this.addSpriteOverHeadItem("recursos","text",_global.palmad.dofus.graphics.battlefield.TextWithTitleOverHead,["",undefined,undefined,undefined,_loc12_,_global.palmad.dofus.Constants.OVERHEAD_TEXT_TITLE,_loc6_.estrellas]);
         break;
      case 5:
         _loc14_ = this.api.lang.getHousesDoorText(this.api.datacenter.Map.id,_loc4_.num);
         _loc9_ = this.api.datacenter.Houses.getItemAt(_loc14_);
         if(_loc9_.guildName.length > 0)
         {
            _loc15_ = new _global.palmad.dofus.datacenter.Character("porte",_global.palmad.ank.battlefield.mc.Sprite,"",_loc4_.num,0,0);
            this.api.datacenter.Sprites.addItemAt("porte",_loc15_);
            this.api.gfx.addSprite("porte");
            this.addSpriteOverHeadItem("porte","text",_global.palmad.dofus.graphics.battlefield.GuildOverHead,[this.api.lang.getText("GUILD_HOUSE"),_loc9_.guildName,_loc9_.guildEmblem,undefined,undefined,undefined,undefined,undefined,undefined,undefined,_global.palmad.dofus.Constants.OVERHEAD_TEXT_CHARACTER]);
         }
         break;
      case 13:
         _loc3_ = this.api.datacenter.Map.mountPark;
         _loc16_ = new _global.palmad.dofus.datacenter.Character("enclos",_global.palmad.ank.battlefield.mc.Sprite,"",_loc4_.num,0,0);
         this.api.datacenter.Sprites.addItemAt("enclos",_loc16_);
         this.api.gfx.addSprite("enclos");
         if(_loc3_.isPublic)
         {
            this.addSpriteOverHeadItem("enclos","text",_global.palmad.dofus.graphics.battlefield.TextOverHead,[this.api.lang.getText("MOUNTPARK_PUBLIC"),"",_global.palmad.dofus.Constants.OVERHEAD_TEXT_CHARACTER]);
            break;
         }
         if(_loc3_.hasNoOwner)
         {
            this.addSpriteOverHeadItem("enclos","text",_global.palmad.dofus.graphics.battlefield.TextOverHead,[this.api.lang.getText("MOUNTPARK_TO_BUY",[_loc3_.price,_loc3_.size,_loc3_.items]),"",_global.palmad.dofus.Constants.OVERHEAD_TEXT_CHARACTER]);
            break;
         }
         if(_loc3_.price > 0)
         {
            _loc10_ = this.api.lang.getText("MOUNTPARK_PRIVATE_TO_BUY",[_loc3_.price]);
         }
         else
         {
            _loc10_ = this.api.lang.getText("MOUNTPARK_PRIVATE");
         }
         this.addSpriteOverHeadItem("enclos","text",_global.palmad.dofus.graphics.battlefield.GuildOverHead,[_loc3_.guildName,_loc10_,_loc3_.guildEmblem,undefined,undefined,undefined,undefined,undefined,undefined,undefined,_global.palmad.dofus.Constants.OVERHEAD_TEXT_CHARACTER]);
         break;
   }
};
_loc1.onObjectRollOut = function(mcObject)
{
   this.api.ui.hideTooltip();
   var _loc2_;
   if(this.api.datacenter.Game.interactionType == 5)
   {
      _loc2_ = mcObject.cellData.mc;
      this.onCellRollOut(_loc2_);
   }
   mcObject.select(false);
   this.removeSpriteOverHeadLayer("recursos","text");
   this.removeSprite("recursos",false);
   this.removeSpriteOverHeadLayer("enclos","text");
   this.removeSprite("enclos",false);
   this.removeSpriteOverHeadLayer("porte","text");
   this.removeSprite("porte",false);
   this.removeSpriteOverHeadLayer("itemOnCell","text");
   this.removeSprite("itemOnCell",false);
};
