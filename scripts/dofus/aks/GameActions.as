var _loc1 = _global.dofus.aks.GameActions.prototype;
_loc1.onCleanGameActions = function()
{
   var _loc2_ = this.api.datacenter.Player.data;
   _loc2_.GameActionsManager.m_bNextAction = false;
   _loc2_.GameActionsManager.clear();
   this.api.gfx.mapHandler.resetEmptyCells();
   this.api.gfx.clearZoneLayer("spell");
   this.api.gfx.clearPointer();
   this.api.gfx.unSelect(true);
};
_loc1.attack = function(sSpriteID)
{
   this.sendActions(906,[sSpriteID]);
};
_loc1.attackTaxCollector = function(sSpriteID)
{
   this.sendActions(909,[sSpriteID]);
};
_loc1.mutantAttack = function(sSpriteID)
{
   this.sendActions(910,[sSpriteID]);
};
_loc1.mutantAttack2 = function(sSpriteID)
{
   this.sendActions(9101,[sSpriteID]);
};
_loc1.mutantAttack3 = function(sSpriteID)
{
   this.sendActions(9102,[sSpriteID]);
};
_loc1.attackPrism = function(sSpriteID)
{
   this.sendActions(912,[sSpriteID]);
};
_loc1.usePrism = function(sSpriteID)
{
   this.sendActions(512,[sSpriteID]);
};
_loc1.acceptMarriage = function(sSpriteID)
{
   this.sendActions(618,[sSpriteID]);
};
_loc1.refuseMarriage = function(sSpriteID)
{
   this.sendActions(619,[sSpriteID]);
};
_loc1.onActionsStart = function(sExtraData)
{
   var _loc3_ = sExtraData;
   if(_loc3_ != this.api.datacenter.Player.ID)
   {
      return undefined;
   }
   var _loc2_ = this.api.datacenter.Player.data;
   _loc2_.GameActionsManager.m_bNextAction = true;
   var _loc4_;
   if(this.api.datacenter.Game.isFight)
   {
      _loc4_ = _loc2_.sequencer;
      _loc4_.execute();
   }
};
_loc1.onActionsFinish = function(sExtraData)
{
   var _loc4_ = sExtraData.split("|");
   var _loc6_ = Number(_loc4_[0]);
   var _loc3_ = _loc4_[1];
   var _loc5_ = this.api.datacenter.Player.data;
   var _loc2_ = _loc5_.sequencer;
   _loc5_.GameActionsManager.m_bNextAction = false;
   if(this.api.datacenter.Game.isFight)
   {
      _loc2_.addAction(32,false,this.api.kernel.GameManager,this.api.kernel.GameManager.setEnabledInteractionIfICan,[ank.battlefield["\x12\x03"].INTERACTION_CELL_RELEASE_OVER_OUT]);
      if(_loc3_ != undefined)
      {
         _loc2_.addAction(33,false,this,this.actionAck,[_loc3_]);
      }
      _loc2_.addAction(34,false,this.api.kernel.GameManager,this.api.kernel.GameManager.cleanPlayer,[_loc6_]);
      this.api.gfx.mapHandler.resetEmptyCells();
      this.api.gfx.clearZoneLayer("spell");
      this.api.gfx.clearPointer();
      _loc2_.execute();
      if(_loc3_ == 2)
      {
         this.api.kernel.TipsManager.showNewTip(dofus["\x0b\x07"].TipsManager.TIP_FIGHT_ENDMOVE);
      }
   }
};
_loc1.onActions = function(_loc2_)
{
   var _loc12_ = _loc2_.indexOf(";");
   var _loc51_ = Number(_loc2_.substring(0,_loc12_));
   if(dofus["\x12\x03"].SAVING_THE_WORLD)
   {
      if(_loc2_ == ";0")
      {
         dofus["\x1e\x14\x10"].getInstance().nextActionIfOnSafe();
      }
   }
   _loc2_ = _loc2_.substring(_loc12_ + 1);
   _loc12_ = _loc2_.indexOf(";");
   var _loc6_ = Number(_loc2_.substring(0,_loc12_));
   _loc2_ = _loc2_.substring(_loc12_ + 1);
   _loc12_ = _loc2_.indexOf(";");
   var _loc4_ = _loc2_.substring(0,_loc12_);
   var _loc5_ = _loc2_.substring(_loc12_ + 1);
   if(_loc4_.length == 0)
   {
      _loc4_ = this.api.datacenter.Player.ID;
   }
   var _loc104_ = this.api.datacenter.Game.currentPlayerID;
   var _loc45_;
   if(this.api.datacenter.Game.isFight && _loc104_ != undefined)
   {
      _loc45_ = _loc104_;
   }
   else
   {
      _loc45_ = _loc4_;
   }
   var _loc62_ = this.api.datacenter.Sprites.getItemAt(_loc45_);
   var _loc3_ = _loc62_.sequencer;
   var _loc35_ = _loc62_.GameActionsManager;
   var _loc16_ = true;
   _loc35_.onServerResponse(_loc51_);
   var _loc14_;
   var _loc41_;
   var _loc105_;
   var _loc96_;
   var _loc79_;
   var _loc77_;
   var _loc133_;
   var _loc125_;
   var _loc145_;
   var _loc69_;
   var _loc97_;
   var _loc210_;
   var _loc109_;
   var _loc106_;
   var _loc177_;
   var _loc171_;
   var _loc70_;
   var _loc134_;
   var _loc149_;
   var _loc71_;
   var _loc31_;
   var _loc98_;
   var _loc46_;
   var _loc33_;
   var _loc183_;
   var _loc53_;
   var _loc201_;
   var _loc28_;
   var _loc29_;
   var _loc211_;
   var _loc80_;
   var _loc78_;
   var _loc85_;
   var _loc83_;
   var _loc50_;
   var _loc36_;
   var _loc212_;
   var _loc89_;
   var _loc225_;
   var _loc44_;
   var _loc54_;
   var _loc172_;
   var _loc20_;
   var _loc10_;
   var _loc23_;
   var _loc146_;
   var _loc99_;
   var _loc213_;
   var _loc110_;
   var _loc226_;
   var _loc184_;
   var _loc178_;
   var _loc90_;
   var _loc57_;
   var _loc153_;
   var _loc150_;
   var _loc227_;
   var _loc100_;
   var _loc126_;
   var _loc111_;
   var _loc87_;
   var _loc185_;
   var _loc93_;
   var _loc202_;
   var _loc159_;
   var _loc154_;
   var _loc81_;
   var _loc165_;
   var _loc186_;
   var _loc24_;
   var _loc242_;
   var _loc239_;
   var _loc160_;
   var _loc74_;
   var _loc112_;
   var _loc228_;
   var _loc84_;
   var _loc249_;
   var _loc194_;
   var _loc187_;
   var _loc75_;
   var _loc243_;
   var _loc166_;
   var _loc161_;
   var _loc127_;
   var _loc113_;
   var _loc63_;
   var _loc114_;
   var _loc49_;
   var _loc135_;
   var _loc94_;
   var _loc203_;
   var _loc229_;
   var _loc101_;
   var _loc82_;
   var _loc39_;
   var _loc136_;
   var _loc64_;
   var _loc147_;
   var _loc140_;
   var _loc220_;
   var _loc95_;
   var _loc115_;
   var _loc107_;
   var _loc25_;
   var _loc17_;
   var _loc141_;
   var _loc34_;
   var _loc244_;
   var _loc240_;
   var _loc65_;
   var _loc116_;
   var _loc188_;
   var _loc13_;
   var _loc241_;
   var _loc142_;
   var _loc155_;
   var _loc151_;
   var _loc117_;
   var _loc230_;
   var _loc22_;
   var _loc11_;
   var _loc251_;
   var _loc189_;
   var _loc214_;
   var _loc204_;
   var _loc231_;
   var _loc221_;
   var _loc26_;
   var _loc7_;
   var _loc195_;
   var _loc56_;
   var _loc73_;
   var _loc148_;
   var _loc102_;
   var _loc215_;
   var _loc61_;
   var _loc108_;
   var _loc190_;
   var _loc27_;
   var _loc205_;
   var _loc196_;
   var _loc156_;
   var _loc245_;
   var _loc232_;
   var _loc222_;
   var _loc128_;
   var _loc118_;
   var _loc197_;
   var _loc191_;
   var _loc42_;
   var _loc91_;
   var _loc76_;
   var _loc157_;
   var _loc119_;
   var _loc32_;
   var _loc237_;
   var _loc66_;
   var _loc206_;
   var _loc198_;
   var _loc30_;
   var _loc216_;
   var _loc248_;
   var _loc162_;
   var _loc179_;
   var _loc173_;
   var _loc199_;
   var _loc192_;
   var _loc19_;
   var _loc152_;
   var _loc167_;
   var _loc163_;
   var _loc129_;
   var _loc120_;
   var _loc86_;
   var _loc180_;
   var _loc207_;
   var _loc21_;
   var _loc38_;
   var _loc158_;
   var _loc250_;
   var _loc168_;
   var _loc137_;
   var _loc130_;
   var _loc121_;
   var _loc233_;
   var _loc68_;
   var _loc131_;
   var _loc208_;
   var _loc88_;
   var _loc223_;
   var _loc217_;
   var _loc40_;
   var _loc164_;
   var _loc67_;
   var _loc122_;
   var _loc143_;
   var _loc48_;
   var _loc43_;
   var _loc92_;
   var _loc234_;
   var _loc58_;
   var _loc174_;
   var _loc169_;
   var _loc138_;
   var _loc132_;
   var _loc8_;
   var _loc37_;
   var _loc103_;
   var _loc218_;
   var _loc123_;
   var _loc60_;
   var _loc55_;
   var _loc175_;
   var _loc144_;
   var _loc139_;
   var _loc52_;
   var _loc72_;
   var _loc15_;
   var _loc59_;
   var _loc47_;
   var _loc124_;
   var _loc18_;
   var _loc181_;
   var _loc209_;
   var _loc200_;
   var _loc224_;
   var _loc219_;
   var _loc176_;
   var _loc170_;
   var _loc193_;
   var _loc182_;
   switch(_loc6_)
   {
      case 0:
         return undefined;
      case 1:
         _loc14_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         if(!this.api.gfx.isMapBuild)
         {
            return undefined;
         }
         if(dofus["\x12\x03"].USE_JS_LOG && (_global.CONFIG.isNewAccount && !this.api.datacenter.Basics.first_movement))
         {
            getUrl("JavaScript:WriteLog(\'Mouvement\')", "_self");
            this.api.datacenter.Basics.first_movement = true;
         }
         if(_loc4_ == this.api.datacenter.Player.ID && (this.api.datacenter.Game.isFight && this.api.datacenter.Game.isRunning))
         {
            _loc3_.addAction(35,false,this.api.gfx,this.api.gfx.setInteraction,[ank.battlefield["\x12\x03"].INTERACTION_CELL_NONE]);
         }
         _loc41_ = ank.battlefield["\x1e\n\t"]["\x12\r"].extractFullPath(this.api.gfx.mapHandler,_loc5_);
         if(_loc14_.hasCarriedParent() && !_loc14_.uncarryingSprite)
         {
            _loc14_.uncarryingSprite = true;
            _loc41_.shift();
            _loc3_.addAction(174,false,this.api.gfx,this.api.gfx.uncarriedSprite,[_loc4_,_loc41_[0],true,_loc3_]);
            _loc3_.addAction(36,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc4_,dofus["\x12\x03"].CIRCLE_FILE,dofus["\x12\x03"].TEAMS_COLOR[_loc14_.Team]]);
         }
         _loc105_ = _loc14_.forceRun;
         _loc96_ = _loc14_.forceWalk;
         _loc79_ = this.api.datacenter.Game.isFight ? (_loc14_ instanceof dofus.datacenter["\x13\x01"] ? 3 : 4) : (_loc14_ instanceof dofus.datacenter["\x13\x01"] ? 3 : 6);
         if(this.api.datacenter.Game.isRunning)
         {
            _loc3_.addAction(37,false,this.api.gfx,this.api.gfx.unSelect,[true]);
            _loc3_.addAction(175,false,this.api.gfx,this.api.gfx.moveSpriteWithUncompressedPath,[_loc4_,_loc41_,_loc3_,false,_loc105_,_loc96_,_loc79_]);
         }
         else
         {
            this.api.gfx.moveSpriteWithUncompressedPath(_loc4_,_loc41_,_loc3_,true,_loc105_,_loc96_,_loc79_);
         }
         break;
      case 2:
         if(_loc3_ == undefined)
         {
            this.api.gfx.clear();
            this.api.datacenter.clearGame();
            if(!this.api.kernel.TutorialManager.isTutorialMode)
            {
               this.api.ui.loadUIComponent("CenterText","CenterTextMap",{text:this.api.lang.getText("LOADING_MAP"),timer:40000},{bForceLoad:true});
            }
         }
         else
         {
            _loc3_.addAction(38,false,this.api.gfx,this.api.gfx.clear);
            _loc3_.addAction(39,false,this.api.datacenter,this.api.datacenter.clearGame);
            if(_loc5_.length == 0)
            {
               _loc3_.addAction(40,true,this.api.ui,this.api.ui.loadUIComponent,["CenterText","CenterTextMap",{text:this.api.lang.getText("LOADING_MAP"),timer:40000},{bForceLoad:true}]);
            }
            else
            {
               _loc3_.addAction(41,true,this.api.ui,this.api.ui.loadUIComponent,["Cinematic","Cinematic",{file:dofus["\x12\x03"].CINEMATICS_PATH + _loc5_ + ".swf",sequencer:_loc3_}]);
            }
         }
         break;
      case 4:
         _loc77_ = _loc5_.split(",");
         _loc133_ = _loc77_[0];
         _loc125_ = Number(_loc77_[1]);
         _loc145_ = this.api.datacenter.Sprites.getItemAt(_loc133_);
         _loc69_ = _loc145_.mc;
         _loc3_.addAction(42,false,_loc69_,_loc69_.setPosition,[_loc125_]);
         break;
      case 5:
         _loc97_ = _loc5_.split(",");
         _loc210_ = _loc97_[0];
         _loc109_ = Number(_loc97_[1]);
         this.api.gfx.slideSprite(_loc210_,_loc109_,_loc3_);
         break;
      case 11:
         _loc106_ = _loc5_.split(",");
         _loc177_ = _loc106_[0];
         _loc171_ = Number(_loc106_[1]);
         _loc3_.addAction(43,false,this.api.gfx,this.api.gfx.setSpriteDirection,[_loc177_,_loc171_]);
         break;
      case 50:
         _loc70_ = _loc5_;
         _loc3_.addAction(44,false,this.api.gfx,this.api.gfx.carriedSprite,[_loc70_,_loc4_]);
         _loc3_.addAction(45,false,this.api.gfx,this.api.gfx.removeSpriteExtraClip,[_loc70_]);
         break;
      case 51:
         _loc134_ = Number(_loc5_);
         _loc149_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc71_ = _loc149_.carriedChild;
         _loc31_ = new ank.battlefield.datacenter["\x1e\n\x03"]();
         _loc31_.file = dofus["\x12\x03"].SPELLS_PATH + "1200.swf";
         _loc31_.level = 1;
         _loc31_.bInFrontOfSprite = true;
         _loc31_.bTryToBypassContainerColor = false;
         this.api.gfx.spriteLaunchCarriedSprite(_loc4_,_loc31_,_loc134_,31,10);
         _loc3_.addAction(46,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc71_.id,dofus["\x12\x03"].CIRCLE_FILE,dofus["\x12\x03"].TEAMS_COLOR[_loc71_.Team]]);
         break;
      case 52:
         _loc98_ = _loc5_.split(",");
         _loc46_ = _loc98_[0];
         _loc33_ = this.api.datacenter.Sprites.getItemAt(_loc46_);
         _loc183_ = Number(_loc98_[1]);
         if(_loc33_.hasCarriedParent() && !_loc33_.uncarryingSprite)
         {
            _loc33_.uncarryingSprite = true;
            _loc3_.addAction(47,false,this.api.gfx,this.api.gfx.uncarriedSprite,[_loc46_,_loc183_,true,_loc3_]);
            _loc3_.addAction(48,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc46_,dofus["\x12\x03"].CIRCLE_FILE,dofus["\x12\x03"].TEAMS_COLOR[_loc33_.Team]]);
         }
         break;
      case 100:
      case 108:
      case 110:
         _loc53_ = _loc5_.split(",");
         _loc201_ = _loc53_[0];
         _loc28_ = this.api.datacenter.Sprites.getItemAt(_loc201_);
         _loc29_ = Number(_loc53_[1]);
         if(_loc29_ != 0)
         {
            _loc211_ = Number(_loc53_[2]);
            _loc80_ = dofus["\x12\x03"].getElementColorById(_loc211_);
            _loc78_ = _loc29_ < 0 ? "LOST_LP" : "WIN_LP";
            if(_loc80_ != undefined && this.api.kernel.OptionsManager.getOption("SeeDamagesColor"))
            {
               _loc85_ = this.api.lang.getText(_loc78_,[_loc28_.name,"<font color=\"#" + _loc80_ + "\">" + Math.abs(_loc29_) + "</font>"]);
            }
            else
            {
               _loc85_ = this.api.lang.getText(_loc78_,[_loc28_.name,Math.abs(_loc29_)]);
            }
            _loc3_.addAction(49,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc85_,"INFO_FIGHT_CHAT"]);
            _loc3_.addAction(50,false,_loc28_,_loc28_.updateLP,[_loc29_]);
            _loc3_.addAction(51,false,this.api.ui.getUIComponent("Timeline").timelineControl,this.api.ui.getUIComponent("Timeline").timelineControl.updateCharacters);
         }
         else
         {
            _loc3_.addAction(52,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("NOCHANGE_LP",[_loc28_.name]),"INFO_FIGHT_CHAT"]);
         }
         break;
      case 101:
      case 102:
      case 111:
      case 120:
      case 168:
         _loc83_ = _loc5_.split(",");
         _loc50_ = this.api.datacenter.Sprites.getItemAt(_loc83_[0]);
         _loc36_ = Number(_loc83_[1]);
         if(_loc36_ != 0)
         {
            if(_loc6_ == 101 || (_loc6_ == 111 || (_loc6_ == 120 || _loc6_ == 168)))
            {
               _loc212_ = _loc36_ < 0 ? "LOST_AP" : "WIN_AP";
               _loc3_.addAction(53,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText(_loc212_,[_loc50_.name,Math.abs(_loc36_)]),"INFO_FIGHT_CHAT"]);
            }
            _loc3_.addAction(54,false,_loc50_,_loc50_.updateAP,[_loc36_,_loc6_ == 102]);
         }
         break;
      case 127:
      case 129:
      case 128:
      case 78:
      case 169:
         _loc89_ = _loc5_.split(",");
         _loc225_ = _loc89_[0];
         _loc44_ = Number(_loc89_[1]);
         _loc54_ = this.api.datacenter.Sprites.getItemAt(_loc225_);
         if(_loc44_ != 0)
         {
            if(_loc6_ == 127 || (_loc6_ == 128 || (_loc6_ == 169 || _loc6_ == 78)))
            {
               _loc172_ = _loc44_ < 0 ? "LOST_MP" : "WIN_MP";
               _loc3_.addAction(55,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText(_loc172_,[_loc54_.name,Math.abs(_loc44_)]),"INFO_FIGHT_CHAT"]);
            }
            _loc3_.addAction(56,false,_loc54_,_loc54_.updateMP,[_loc44_,_loc6_ == 129]);
         }
         break;
      case 103:
         _loc20_ = _loc5_;
         _loc10_ = this.api.datacenter.Sprites.getItemAt(_loc20_);
         _loc23_ = _loc10_.mc;
         if(_loc23_ == undefined)
         {
            return undefined;
         }
         _loc10_.isPendingClearing = true;
         _loc146_ = _loc10_.sex == 1 ? "f" : "m";
         _loc3_.addAction(57,false,this.api.kernel,this.api.kernel.showMessage,[undefined,ank["\x1e\n\t"]["\x1e\x16\x1a"].combine(this.api.lang.getText("DIE",[_loc10_.name]),_loc146_,true),"INFO_FIGHT_CHAT"]);
         _loc99_ = this.api.ui.getUIComponent("Timeline");
         _loc3_.addAction(58,false,_loc99_,_loc99_.hideItem,[_loc20_]);
         this.warning("You\'re not allowed to change the behaviour of the game animations. Please play legit !");
         this.warning("Toute modification du comportement des animations est détectée et sanctionnée car c\'est considéré comme de la triche, merci de jouer legit !");
         if(!this.api.datacenter.Player.isSkippingFightAnimations)
         {
            _loc3_.addAction(59,true,_loc23_,_loc23_.setAnim,["Die"],1500,true);
         }
         this.warning("Vous n\'êtes même pas sensé pouvoir lire ce message, mais un rappel de plus n\'est pas de trop pour certains : modification du client = ban ;)");
         _loc3_.addAction(61,false,_loc23_,_loc23_.clear);
         if(_loc10_.hasCarriedChild() && !_loc10_.uncarryingSprite)
         {
            _loc10_.uncarryingSprite = true;
            _loc3_.addAction(172,false,this.api.gfx,this.api.gfx.uncarriedSprite,[_loc10_.carriedSprite.id,_loc10_.cellNum,false,_loc3_]);
            _loc3_.addAction(60,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc10_.carriedChild.id,dofus["\x12\x03"].CIRCLE_FILE,dofus["\x12\x03"].TEAMS_COLOR[_loc10_.carriedChild.Team]]);
         }
         if(this.api.datacenter.Player.summonedCreaturesID[_loc20_])
         {
            this.api.datacenter.Player.SummonedCreatures--;
            delete this.api.datacenter.Player.summonedCreaturesID[_loc20_];
            this.api.ui.getUIComponent("Banner").shortcuts.setSpellStateOnAllContainers();
         }
         if(_loc20_ == this.api.datacenter.Player.ID)
         {
            if(_loc4_ == this.api.datacenter.Player.ID)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_KILLED_HIMSELF);
            }
            else
            {
               _loc213_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
               _loc110_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc4_)).Team;
               if(_loc213_ == _loc110_)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_KILLED_BY_ALLY);
               }
               else
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_KILLED_BY_ENEMY);
               }
            }
         }
         else if(_loc4_ == this.api.datacenter.Player.ID)
         {
            _loc226_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
            _loc184_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc20_)).Team;
            if(_loc226_ == _loc184_)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_KILL_ALLY);
            }
            else
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_KILL_ENEMY);
            }
         }
         break;
      case 104:
         _loc178_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc90_ = _loc178_.mc;
         _loc3_.addAction(62,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("CANT_MOVEOUT"),"INFO_FIGHT_CHAT"]);
         if(!this.api.datacenter.Player.isSkippingFightAnimations && this.api.electron.isWindowFocused)
         {
            _loc3_.addAction(63,false,_loc90_,_loc90_.setAnim,["Hit"]);
         }
         break;
      case 105:
      case 164:
         _loc57_ = _loc5_.split(",");
         _loc153_ = _loc57_[0];
         _loc150_ = _loc6_ == 164 ? _loc57_[1] + "%" : _loc57_[1];
         _loc227_ = this.api.datacenter.Sprites.getItemAt(_loc153_);
         _loc3_.addAction(64,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("REDUCE_DAMAGES",[_loc227_.name,_loc150_]),"INFO_FIGHT_CHAT"]);
         break;
      case 106:
         _loc100_ = _loc5_.split(",");
         _loc126_ = _loc100_[0];
         _loc111_ = _loc100_[1] == "1";
         _loc87_ = this.api.datacenter.Sprites.getItemAt(_loc126_);
         _loc185_ = _loc111_ ? this.api.lang.getText("RETURN_SPELL_OK",[_loc87_.name]) : this.api.lang.getText("RETURN_SPELL_NO",[_loc87_.name]);
         _loc3_.addAction(65,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc185_,"INFO_FIGHT_CHAT"]);
         break;
      case 107:
         _loc93_ = _loc5_.split(",");
         _loc202_ = _loc93_[0];
         _loc159_ = _loc93_[1];
         _loc154_ = this.api.datacenter.Sprites.getItemAt(_loc202_);
         _loc3_.addAction(66,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("RETURN_DAMAGES",[_loc154_.name,_loc159_]),"INFO_FIGHT_CHAT"]);
         break;
      case 130:
         _loc81_ = Number(_loc5_);
         _loc165_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc3_.addAction(67,false,this.api.kernel,this.api.kernel.showMessage,[undefined,ank["\x1e\n\t"]["\x1e\x16\x1a"].combine(this.api.lang.getText("STEAL_GOLD",[_loc165_.name,_loc81_]),"m",_loc81_ < 2),"INFO_FIGHT_CHAT"]);
         break;
      case 132:
         _loc186_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc24_ = this.api.datacenter.Sprites.getItemAt(_loc5_);
         _loc3_.addAction(68,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("REMOVE_ALL_EFFECTS",[_loc186_.name,_loc24_.name]),"INFO_FIGHT_CHAT"]);
         _loc3_.addAction(69,false,_loc24_.CharacteristicsManager,_loc24_.CharacteristicsManager.terminateAllEffects);
         _loc3_.addAction(70,false,_loc24_.EffectsManager,_loc24_.EffectsManager.terminateAllEffects);
         break;
      case 140:
         _loc242_ = Number(_loc5_);
         _loc239_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc160_ = this.api.datacenter.Sprites.getItemAt(_loc5_);
         _loc3_.addAction(71,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("A_PASS_NEXT_TURN",[_loc160_.name]),"INFO_FIGHT_CHAT"]);
         break;
      case 151:
         _loc74_ = Number(_loc5_);
         _loc112_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc228_ = _loc74_ == -1 ? this.api.lang.getText("CANT_DO_INVISIBLE_OBSTACLE") : this.api.lang.getText("INVISIBLE_OBSTACLE",[_loc112_.name,this.api.lang.getSpellText(_loc74_).n]);
         _loc3_.addAction(72,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc228_,"ERROR_CHAT"]);
         break;
      case 166:
         _loc84_ = _loc5_.split(",");
         _loc249_ = Number(_loc84_[0]);
         _loc194_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc187_ = Number(_loc84_[1]);
         _loc3_.addAction(73,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("RETURN_AP",[_loc194_.name,_loc187_]),"INFO_FIGHT_CHAT"]);
         break;
      case 164:
         _loc75_ = _loc5_.split(",");
         _loc243_ = Number(_loc75_[0]);
         _loc166_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc161_ = Number(_loc75_[1]);
         _loc3_.addAction(74,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("REDUCE_LP_DAMAGES",[_loc166_.name,_loc161_]),"INFO_FIGHT_CHAT"]);
         break;
      case 780:
         if(_loc4_ == this.api.datacenter.Player.ID)
         {
            this.api.datacenter.Player.SummonedCreatures++;
            _loc127_ = _global.parseInt(_loc5_.split(";")[3]);
            this.api.datacenter.Player.summonedCreaturesID[_loc127_] = true;
         }
      case 147:
         _loc113_ = _loc5_.split(";")[3];
         _loc63_ = this.api.ui.getUIComponent("Timeline");
         _loc3_.addAction(75,false,_loc63_,_loc63_.showItem,[_loc113_]);
         _loc3_.addAction(76,false,this.aks.Game,this.aks.Game.onMovement,[_loc5_,true]);
         break;
      case 180:
      case 181:
         _loc114_ = _loc5_.split(";")[3];
         if(_loc4_ == this.api.datacenter.Player.ID)
         {
            this.api.datacenter.Player.SummonedCreatures++;
            this.api.datacenter.Player.summonedCreaturesID[_loc114_] = true;
         }
         _loc3_.addAction(77,false,this.aks.Game,this.aks.Game.onMovement,[_loc5_,true]);
         break;
      case 185:
         _loc3_.addAction(78,false,this.aks.Game,this.aks.Game.onMovement,[_loc5_]);
         break;
      case 117:
      case 116:
      case 115:
      case 122:
      case 112:
      case 142:
      case 145:
      case 138:
      case 160:
      case 161:
      case 114:
      case 182:
      case 118:
      case 157:
      case 123:
      case 152:
      case 126:
      case 155:
      case 119:
      case 154:
      case 124:
      case 156:
      case 125:
      case 153:
      case 160:
      case 161:
      case 162:
      case 163:
      case 606:
      case 607:
      case 608:
      case 609:
      case 610:
      case 611:
      case 186:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 178:
      case 179:
      case 2008:
      case 2009:
      case 2010:
         _loc49_ = _loc5_.split(",");
         _loc135_ = _loc49_[0];
         _loc94_ = this.api.datacenter.Sprites.getItemAt(_loc135_);
         _loc203_ = Number(_loc49_[1]);
         _loc229_ = Number(_loc49_[2]);
         _loc101_ = _loc94_.CharacteristicsManager;
         _loc82_ = new dofus.datacenter["\x0f\f"](_loc6_,_loc203_,undefined,undefined,undefined,_loc229_);
         _loc3_.addAction(79,false,_loc101_,_loc101_.addEffect,[_loc82_]);
         _loc3_.addAction(80,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"<b>" + _loc94_.name + "</b> : " + _loc82_.description,"INFO_FIGHT_CHAT"]);
         break;
      case 149:
         _loc39_ = _loc5_.split(",");
         _loc136_ = _loc39_[0];
         _loc64_ = this.api.datacenter.Sprites.getItemAt(_loc136_);
         _loc147_ = Number(_loc39_[1]);
         _loc140_ = Number(_loc39_[2]);
         _loc220_ = Number(_loc39_[3]);
         _loc3_.addAction(81,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("GFX",[_loc64_.name]),"INFO_FIGHT_CHAT"]);
         _loc95_ = _loc64_.CharacteristicsManager;
         _loc115_ = new dofus.datacenter["\x0f\f"](_loc6_,_loc147_,_loc140_,undefined,undefined,_loc220_);
         _loc3_.addAction(82,false,_loc95_,_loc95_.addEffect,[_loc115_]);
         break;
      case 150:
         _loc107_ = _loc5_.split(",");
         _loc25_ = _loc107_[0];
         _loc17_ = this.api.datacenter.Sprites.getItemAt(_loc25_);
         _loc141_ = Number(_loc107_[1]);
         if(_loc141_ > 0)
         {
            _loc3_.addAction(83,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("INVISIBILITY",[_loc17_.name]),"INFO_FIGHT_CHAT"]);
            if(_loc25_ == this.api.datacenter.Player.ID)
            {
               _loc3_.addAction(84,false,_loc17_.mc,_loc17_.mc.setAlpha,[40]);
            }
            else
            {
               _loc3_.addAction(85,false,_loc17_.mc,_loc17_.mc.setVisible,[false]);
            }
         }
         else
         {
            _loc3_.addAction(86,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("VISIBILITY",[_loc17_.name]),"INFO_FIGHT_CHAT"]);
            this.api.gfx.hideSprite(_loc25_,false);
            if(_loc17_.allowGhostMode && this.api.gfx.bGhostView)
            {
               this.api.gfx.setSpriteAlpha(_loc25_,ank.battlefield["\x12\x03"].GHOSTVIEW_SPRITE_ALPHA);
            }
            else
            {
               this.api.gfx.setSpriteAlpha(_loc25_,100);
            }
         }
         break;
      case 165:
         _loc34_ = _loc5_.split(",");
         _loc244_ = _loc34_[0];
         _loc240_ = Number(_loc34_[1]);
         var _loc124_ = Number(_loc34_[2]);
         var _loc125_ = Number(_loc34_[3]);
         break;
      case 200:
         _loc65_ = _loc5_.split(",");
         _loc116_ = Number(_loc65_[0]);
         _loc188_ = Number(_loc65_[1]);
         _loc3_.addAction(87,false,this.api.gfx,this.api.gfx.setObject2Frame,[_loc116_,_loc188_]);
         break;
      case 208:
         _loc13_ = _loc5_.split(",");
         _loc241_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc142_ = Number(_loc13_[0]);
         _loc155_ = _loc13_[1];
         _loc151_ = Number(_loc13_[2]);
         _loc117_ = _global.isNaN(Number(_loc13_[3])) ? String(_loc13_[3]).split("~") : "anim" + _loc13_[3];
         _loc230_ = _loc13_[4] != undefined ? Number(_loc13_[4]) : 1;
         _loc22_ = new ank.battlefield.datacenter["\x1e\n\x03"]();
         _loc22_.file = dofus["\x12\x03"].SPELLS_PATH + _loc155_ + ".swf";
         _loc22_.level = _loc230_;
         _loc22_.bInFrontOfSprite = true;
         _loc22_.bTryToBypassContainerColor = true;
         this.api.gfx.spriteLaunchVisualEffect(_loc4_,_loc22_,_loc142_,_loc151_,_loc117_);
         break;
      case 228:
         _loc11_ = _loc5_.split(",");
         _loc251_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc189_ = Number(_loc11_[0]);
         _loc214_ = _loc11_[1];
         _loc204_ = Number(_loc11_[2]);
         _loc231_ = _global.isNaN(Number(_loc11_[3])) ? String(_loc11_[3]).split("~") : "anim" + _loc11_[3];
         _loc221_ = _loc11_[4] != undefined ? Number(_loc11_[4]) : 1;
         _loc26_ = new ank.battlefield.datacenter["\x1e\n\x03"]();
         _loc26_.file = dofus["\x12\x03"].SPELLS_PATH + _loc214_ + ".swf";
         _loc26_.level = _loc221_;
         _loc26_.bInFrontOfSprite = true;
         _loc26_.bTryToBypassContainerColor = false;
         this.api.gfx.spriteLaunchVisualEffect(_loc4_,_loc26_,_loc189_,_loc204_,_loc231_);
         break;
      case 300:
         _loc7_ = _loc5_.split(",");
         _loc195_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc56_ = Number(_loc7_[0]);
         _loc73_ = Number(_loc7_[1]);
         _loc148_ = _loc7_[2];
         _loc102_ = Number(_loc7_[3]);
         _loc215_ = Number(_loc7_[4]);
         _loc61_ = _global.isNaN(Number(_loc7_[5])) ? String(_loc7_[5]).split("~") : (_loc7_[5] == "-1" || _loc7_[5] == "-2" ? undefined : "anim" + _loc7_[5]);
         _loc108_ = false;
         if(Number(_loc7_[5]) == -2)
         {
            _loc108_ = true;
         }
         _loc190_ = _loc7_[6] == "1" ? true : false;
         _loc27_ = new ank.battlefield.datacenter["\x1e\n\x03"]();
         _loc27_.file = dofus["\x12\x03"].SPELLS_PATH + _loc148_ + ".swf";
         _loc27_.level = _loc102_;
         _loc27_.bInFrontOfSprite = _loc190_;
         _loc27_.params = new dofus.datacenter["\x1e\x0f\x02"](_loc56_,_loc102_).elements;
         _loc3_.addAction(88,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_LAUNCH_SPELL",[_loc195_.name,this.api.lang.getSpellText(_loc56_).n]),"INFO_FIGHT_CHAT"]);
         if(_loc61_ != undefined || _loc108_)
         {
            if(!this.api.datacenter.Player.isSkippingFightAnimations)
            {
               this.api.gfx.spriteLaunchVisualEffect(_loc4_,_loc27_,_loc73_,_loc215_,_loc61_);
            }
         }
         if(_loc4_ == this.api.datacenter.Player.ID)
         {
            _loc205_ = this.api.datacenter.Player.SpellsManager;
            _loc196_ = this.api.gfx.mapHandler.getCellData(_loc73_).spriteOnID;
            _loc156_ = new dofus.datacenter["\x0b\x17"](_loc56_,_loc196_);
            _loc205_.addLaunchedSpell(_loc156_);
         }
         break;
      case 301:
         _loc245_ = Number(_loc5_);
         _loc3_.addAction(89,false,this.api.sounds.events,this.api.sounds.events.onGameCriticalHit,[]);
         _loc3_.addAction(90,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"(" + this.api.lang.getText("CRITICAL_HIT") + ")","INFO_FIGHT_CHAT"]);
         if(!this.api.datacenter.Player.isSkippingFightAnimations && this.api.electron.isWindowFocused)
         {
            _loc3_.addAction(91,false,this.api.gfx,this.api.gfx.addSpriteExtraClipOnTimer,[_loc4_,dofus["\x12\x03"].CRITICAL_HIT_XTRA_FILE,undefined,true,dofus["\x12\x03"].CRITICAL_HIT_DURATION]);
         }
         if(_loc4_ == this.api.datacenter.Player.ID)
         {
            this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_CC_OWNER);
         }
         else
         {
            _loc232_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
            _loc222_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc4_)).Team;
            if(_loc232_ == _loc222_)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_CC_ALLIED);
            }
            else
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_CC_ENEMY);
            }
         }
         break;
      case 302:
         _loc128_ = Number(_loc5_);
         _loc118_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc3_.addAction(92,false,this.api.sounds.events,this.api.sounds.events.onGameCriticalMiss,[]);
         _loc3_.addAction(93,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_LAUNCH_SPELL",[_loc118_.name,this.api.lang.getSpellText(_loc128_).n]),"INFO_FIGHT_CHAT"]);
         _loc3_.addAction(94,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"(" + this.api.lang.getText("CRITICAL_MISS") + ")","INFO_FIGHT_CHAT"]);
         _loc3_.addAction(95,false,this.api.gfx,this.api.gfx.addSpriteBubble,[_loc4_,this.api.lang.getText("CRITICAL_MISS")]);
         if(_loc4_ == this.api.datacenter.Player.ID)
         {
            this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_EC_OWNER);
         }
         else
         {
            _loc197_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
            _loc191_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc4_)).Team;
            if(_loc197_ == _loc191_)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_EC_ALLIED);
            }
            else
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_EC_ENEMY);
            }
         }
         break;
      case 303:
         _loc42_ = _loc5_.split(",");
         _loc91_ = Number(_loc42_[0]);
         _loc76_ = _loc42_[1];
         _loc157_ = Number(_loc42_[2]);
         _loc119_ = _loc42_[3] == "1" ? true : false;
         _loc32_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc237_ = _loc32_.mc;
         _loc66_ = _loc32_.ToolAnimation;
         _loc3_.addAction(96,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_ATTACK_CC",[_loc32_.name]),"INFO_FIGHT_CHAT"]);
         if(_loc76_ == undefined)
         {
            _loc3_.addAction(97,false,this.api.gfx,this.api.gfx.autoCalculateSpriteDirection,[_loc4_,_loc91_]);
            _loc3_.addAction(98,true,this.api.gfx,this.api.gfx.setSpriteAnim,[_loc4_,_loc66_]);
         }
         else
         {
            _loc206_ = _loc32_.accessories[0].unicID;
            _loc198_ = _loc32_.Guild;
            _loc30_ = new ank.battlefield.datacenter["\x1e\n\x03"]();
            _loc30_.file = dofus["\x12\x03"].SPELLS_PATH + _loc76_ + ".swf";
            _loc30_.level = 1;
            _loc30_.bInFrontOfSprite = _loc119_;
            _loc30_.params = new dofus.datacenter["\x12\x18"](new dofus.datacenter["\f\x0b"](undefined,_loc206_),_loc198_).elements;
            this.api.gfx.spriteLaunchVisualEffect(_loc4_,_loc30_,_loc91_,_loc157_,_loc66_);
         }
         break;
      case 304:
         _loc216_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc248_ = _loc216_.mc;
         _loc3_.addAction(99,false,this.api.sounds.events,this.api.sounds.events.onGameCriticalHit,[]);
         _loc3_.addAction(100,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"(" + this.api.lang.getText("CRITICAL_HIT") + ")","INFO_FIGHT_CHAT"]);
         if(!this.api.datacenter.Player.isSkippingFightAnimations && this.api.electron.isWindowFocused)
         {
            _loc3_.addAction(101,false,this.api.gfx,this.api.gfx.addSpriteExtraClipOnTimer,[_loc4_,dofus["\x12\x03"].CRITICAL_HIT_XTRA_FILE,undefined,true,dofus["\x12\x03"].CRITICAL_HIT_DURATION]);
         }
         if(_loc4_ == this.api.datacenter.Player.ID)
         {
            this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_CC_OWNER);
         }
         else
         {
            _loc162_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
            _loc179_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc4_)).Team;
            if(_loc162_ == _loc179_)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_CC_ALLIED);
            }
            else
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_CC_ENEMY);
            }
         }
         break;
      case 305:
         _loc173_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc3_.addAction(102,false,this.api.sounds.events,this.api.sounds.events.onGameCriticalMiss,[]);
         _loc3_.addAction(103,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_ATTACK_CC",[_loc173_.name]),"INFO_FIGHT_CHAT"]);
         _loc3_.addAction(104,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"(" + this.api.lang.getText("CRITICAL_MISS") + ")","INFO_FIGHT_CHAT"]);
         _loc3_.addAction(105,false,this.api.gfx,this.api.gfx.addSpriteBubble,[_loc4_,this.api.lang.getText("CRITICAL_MISS")]);
         if(_loc4_ == this.api.datacenter.Player.ID)
         {
            this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_EC_OWNER);
         }
         else
         {
            _loc199_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
            _loc192_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc4_)).Team;
            if(_loc199_ == _loc192_)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_EC_ALLIED);
            }
            else
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_EC_ENEMY);
            }
         }
         break;
      case 306:
         _loc19_ = _loc5_.split(",");
         _loc152_ = Number(_loc19_[0]);
         _loc167_ = Number(_loc19_[1]);
         _loc163_ = _loc19_[2];
         _loc129_ = Number(_loc19_[3]);
         _loc120_ = _loc19_[4] == "1" ? true : false;
         _loc86_ = Number(_loc19_[5]);
         _loc180_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc207_ = this.api.datacenter.Sprites.getItemAt(_loc86_);
         _loc21_ = new ank.battlefield.datacenter["\x1e\n\x03"]();
         _loc21_.id = _loc152_;
         _loc21_.file = dofus["\x12\x03"].SPELLS_PATH + _loc163_ + ".swf";
         _loc21_.level = _loc129_;
         _loc21_.bInFrontOfSprite = _loc120_;
         _loc3_.addAction(106,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_START_TRAP",[_loc180_.name,this.api.lang.getSpellText(_loc21_.id).n,_loc207_.name]),"INFO_FIGHT_CHAT"]);
         _loc3_.addAction(107,false,this.api.gfx,this.api.gfx.addVisualEffectOnSprite,[_loc86_,_loc21_,_loc167_,11],1000);
         break;
      case 307:
         _loc38_ = _loc5_.split(",");
         _loc158_ = Number(_loc38_[0]);
         _loc250_ = Number(_loc38_[1]);
         _loc168_ = Number(_loc38_[3]);
         _loc137_ = Number(_loc38_[5]);
         _loc130_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc121_ = this.api.datacenter.Sprites.getItemAt(_loc137_);
         _loc233_ = new dofus.datacenter["\x1e\x0f\x02"](_loc158_,_loc168_);
         _loc3_.addAction(108,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_START_GLIPH",[_loc130_.name,_loc233_.name,_loc121_.name]),"INFO_FIGHT_CHAT"]);
         break;
      case 308:
         _loc68_ = _loc5_.split(",");
         _loc131_ = this.api.datacenter.Sprites.getItemAt(Number(_loc68_[0]));
         _loc208_ = Number(_loc68_[1]);
         _loc3_.addAction(109,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_DODGE_AP",[_loc131_.name,_loc208_]),"INFO_FIGHT_CHAT"]);
         break;
      case 309:
         _loc88_ = _loc5_.split(",");
         _loc223_ = this.api.datacenter.Sprites.getItemAt(Number(_loc88_[0]));
         _loc217_ = Number(_loc88_[1]);
         _loc3_.addAction(110,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_DODGE_MP",[_loc223_.name,_loc217_]),"INFO_FIGHT_CHAT"]);
         break;
      case 501:
         _loc40_ = _loc5_.split(",");
         _loc164_ = _loc40_[0];
         _loc67_ = Number(_loc40_[1]);
         _loc122_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc143_ = _loc40_[2] == undefined ? _loc122_.ToolAnimation : "anim" + _loc40_[2];
         _loc3_.addAction(111,false,this.api.gfx,this.api.gfx.autoCalculateSpriteDirection,[_loc4_,_loc164_]);
         _loc3_.addAction(112,_loc4_ == this.api.datacenter.Player.ID,this.api.gfx,this.api.gfx.setSpriteLoopAnim,[_loc4_,_loc143_,_loc67_],_loc67_,true);
         break;
      case 617:
         _loc16_ = false;
         _loc48_ = _loc5_.split(",");
         _loc43_ = this.api.datacenter.Sprites.getItemAt(Number(_loc48_[0]));
         _loc92_ = this.api.datacenter.Sprites.getItemAt(Number(_loc48_[1]));
         _loc234_ = _loc48_[2];
         this.api.gfx.addSpriteBubble(_loc234_,this.api.lang.getText("A_ASK_MARRIAGE_B",[_loc43_.name,_loc92_.name]));
         if(_loc43_.id == this.api.datacenter.Player.ID)
         {
            this.api.kernel.showMessage(this.api.lang.getText("MARRIAGE"),this.api.lang.getText("A_ASK_MARRIAGE_B",[_loc43_.name,_loc92_.name]),"CAUTION_YESNO",{name:"Marriage",listener:this,params:{spriteID:_loc43_.id,refID:_loc4_}});
         }
         break;
      case 618:
      case 619:
         _loc16_ = false;
         _loc58_ = _loc5_.split(",");
         _loc174_ = this.api.datacenter.Sprites.getItemAt(Number(_loc58_[0]));
         _loc169_ = this.api.datacenter.Sprites.getItemAt(Number(_loc58_[1]));
         _loc138_ = _loc58_[2];
         _loc132_ = _loc6_ == 618 ? "A_MARRIED_B" : "A_NOT_MARRIED_B";
         this.api.gfx.addSpriteBubble(_loc138_,this.api.lang.getText(_loc132_,[_loc174_.name,_loc169_.name]));
         break;
      case 900:
         _loc16_ = false;
         _loc8_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc37_ = this.api.datacenter.Sprites.getItemAt(Number(_loc5_));
         if(_loc8_ == undefined || (_loc37_ == undefined || (this.api.ui.getUIComponent("AskCancelChallenge") != undefined || this.api.ui.getUIComponent("AskYesNoIgnoreChallenge") != undefined)))
         {
            this.refuseChallenge(_loc4_);
            return undefined;
         }
         this.api.kernel.showMessage(undefined,this.api.lang.getText("A_CHALENGE_B",[this.api.kernel.ChatManager.getLinkName(_loc8_.name),this.api.kernel.ChatManager.getLinkName(_loc37_.name)]),"INFO_CHAT");
         if(_loc8_.id == this.api.datacenter.Player.ID)
         {
            this.api.kernel.showMessage(this.api.lang.getText("CHALENGE"),this.api.lang.getText("YOU_CHALENGE_B",[_loc37_.name]),"INFO_CANCEL",{name:"Challenge",listener:this,params:{spriteID:_loc8_.id}});
         }
         if(_loc37_.id == this.api.datacenter.Player.ID)
         {
            if(this.api.kernel.ChatManager.isBlacklisted(_loc8_.name))
            {
               this.refuseChallenge(_loc8_.id);
               return undefined;
            }
            this.api.electron.makeNotification(this.api.lang.getText("A_CHALENGE_YOU",[_loc8_.name]));
            this.api.kernel.showMessage(this.api.lang.getText("CHALENGE"),this.api.lang.getText("A_CHALENGE_YOU",[_loc8_.name]),"CAUTION_YESNOIGNORE",{name:"Challenge",player:_loc8_.name,listener:this,params:{spriteID:_loc8_.id,player:_loc8_.name}});
            this.api.sounds.events.onGameInvitation();
         }
         break;
      case 901:
         _loc16_ = false;
         if(_loc4_ == this.api.datacenter.Player.ID || Number(_loc5_) == this.api.datacenter.Player.ID)
         {
            this.api.ui.unloadUIComponent("AskCancelChallenge");
         }
         break;
      case 902:
         _loc16_ = false;
         this.api.ui.unloadUIComponent("AskYesNoIgnoreChallenge");
         this.api.ui.unloadUIComponent("AskCancelChallenge");
         break;
      case 903:
         _loc16_ = false;
         switch(_loc5_)
         {
            case "c":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CHALENGE_FULL"),"ERROR_CHAT");
               break;
            case "t":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("TEAM_FULL"),"ERROR_CHAT");
               break;
            case "a":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("TEAM_DIFFERENT_ALIGNMENT"),"ERROR_CHAT");
               break;
            case "g":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_BECAUSE_GUILD"),"ERROR_CHAT");
               break;
            case "l":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_TOO_LATE"),"ERROR_CHAT");
               break;
            case "m":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
               break;
            case "p":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_BECAUSE_MAP"),"ERROR_CHAT");
               break;
            case "r":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_BECAUSE_ON_RESPAWN"),"ERROR_CHAT");
               break;
            case "o":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_YOU_R_OCCUPED"),"ERROR_CHAT");
               break;
            case "z":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_YOU_OPPONENT_OCCUPED"),"ERROR_CHAT");
               break;
            case "h":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_FIGHT"),"ERROR_CHAT");
               break;
            case "i":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_FIGHT_NO_RIGHTS"),"ERROR_CHAT");
               break;
            case "s":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_21"),"ERROR_CHAT");
               break;
            case "n":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SUBSCRIPTION_OUT"),"ERROR_CHAT");
               break;
            case "b":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("A_NOT_SUBSCRIB"),"ERROR_CHAT");
               break;
            case "f":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("TEAM_CLOSED"),"ERROR_CHAT");
               break;
            case "d":
               this.api.kernel.showMessage(undefined,this.api.lang.getText("NO_ZOMBIE_ALLOWED"),"ERROR_CHAT");
         }
         break;
      case 905:
         this.api.ui.loadUIComponent("CenterText","CenterText",{text:this.api.lang.getText("YOU_ARE_ATTAC"),background:true,timer:2000},{bForceLoad:true});
         break;
      case 906:
         _loc103_ = _loc5_;
         _loc218_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc123_ = this.api.datacenter.Sprites.getItemAt(_loc103_);
         _loc60_ = _loc218_.name;
         _loc55_ = _loc123_.name;
         if(!(_loc60_ == undefined || _loc55_ == undefined))
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("A_ATTACK_B",[this.api.kernel.ChatManager.getLinkName(_loc60_),this.api.kernel.ChatManager.getLinkName(_loc55_)]),"INFO_CHAT");
            if(_loc103_ == this.api.datacenter.Player.ID)
            {
               this.api.electron.makeNotification(this.api.lang.getText("A_ATTACK_B",[_loc60_,_loc55_]));
               this.api.ui.loadUIComponent("CenterText","CenterText",{text:this.api.lang.getText("YOU_ARE_ATTAC"),background:true,timer:2000},{bForceLoad:true});
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_AGRESSED);
            }
            else
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_AGRESS);
            }
         }
         break;
      case 909:
         _loc175_ = _loc5_;
         _loc144_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
         _loc139_ = this.api.datacenter.Sprites.getItemAt(_loc175_);
         this.api.kernel.showMessage(undefined,this.api.lang.getText("A_ATTACK_B",[_loc144_.name,_loc139_.name]),"INFO_CHAT");
         break;
      case 950:
         _loc52_ = _loc5_.split(",");
         _loc72_ = _loc52_[0];
         _loc15_ = this.api.datacenter.Sprites.getItemAt(_loc72_);
         _loc59_ = Number(_loc52_[1]);
         _loc47_ = Number(_loc52_[2]) == 1 ? true : false;
         if(_loc59_ == 8 && (!_loc47_ && (_loc15_.hasCarriedParent() && !_loc15_.uncarryingSprite)))
         {
            _loc15_.uncarryingSprite = true;
            _loc3_.addAction(173,false,this.api.gfx,this.api.gfx.uncarriedSprite,[_loc4_,_loc15_.cellNum,false,_loc3_]);
            _loc3_.addAction(113,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc72_,dofus["\x12\x03"].CIRCLE_FILE,dofus["\x12\x03"].TEAMS_COLOR[_loc15_.Team]]);
         }
         _loc3_.addAction(114,false,_loc15_,_loc15_.setState,[_loc59_,_loc47_]);
         _loc124_ = this.api.lang.getText(_loc47_ ? "ENTER_STATE" : "EXIT_STATE",[_loc15_.name,this.api.lang.getStateText(_loc59_)]);
         _loc3_.addAction(115,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc124_,"INFO_FIGHT_CHAT"]);
         break;
      case 998:
         _loc18_ = _loc2_.split(",");
         _loc181_ = _loc18_[0];
         _loc209_ = _loc18_[1];
         _loc200_ = _loc18_[2];
         _loc224_ = _loc18_[3];
         _loc219_ = _loc18_[4];
         _loc176_ = _loc18_[6];
         _loc170_ = _loc18_[7];
         _loc193_ = new dofus.datacenter["\x0f\f"](Number(_loc209_),Number(_loc200_),Number(_loc224_),Number(_loc219_),"",Number(_loc176_),Number(_loc170_));
         _loc182_ = this.api.datacenter.Sprites.getItemAt(_loc181_);
         _loc182_.EffectsManager.addEffect(_loc193_);
         break;
      case 999:
         _loc3_.addAction(116,false,this.aks,this.aks.processCommand,[_loc5_]);
   }
   if(!_global.isNaN(_loc51_) && _loc4_ == this.api.datacenter.Player.ID)
   {
      _loc3_.addAction(117,false,_loc35_,_loc35_.ack,[_loc51_]);
   }
   else
   {
      _loc35_.end(_loc45_ == this.api.datacenter.Player.ID);
   }
   if(!_loc3_.isPlaying() && _loc16_)
   {
      _loc3_.execute(true);
   }
};
