var _loc1 = dofus["\r\x13"].gapi.ui.Banner.prototype;
_loc1.createChildren = function()
{
   this._btnFights._visible = false;
   this.addToQueue({object:this,method:this.hideEpisodicContent});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.showPoints(false);
   this.showNextTurnButton(false);
   this.showGiveUpButton(false);
   this._mcRightPanelPlacer._visible = false;
   this._mcCircleXtraPlacer._visible = false;
   this.api.ui.unloadUIComponent("FightOptionButtons");
   this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   this.api.kernel.KeyManager.addKeysListener("onKeys",this);
   this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_ON_CONNECT);
   this.api.network.Game.nLastMapIdReceived = -1;
   this._txtConsole.text = "";
   this._txtConsole.onSetFocus = function()
   {
      this._parent.onSetFocus();
   };
   this._txtConsole.onKillFocus = function()
   {
      this._parent.onKillFocus();
   };
   this._txtConsole.maxChars = dofus["\x12\x03"].MAX_MESSAGE_LENGTH + dofus["\x12\x03"].MAX_MESSAGE_LENGTH_MARGIN;
   ank.battlefield["\x1c\n"].useCacheAsBitmapOnStaticAnim = this.api.lang.getConfigText("USE_CACHEASBITMAP_ON_STATICANIM");
   k = 0;
   while(k < 10)
   {
      duplicateMovieClip(this.snow,"snow" + k,16384 + k);
      k++;
   }
};
_loc1.removerData = function()
{
   this._oData.data.removeEventListener("lpChanged",this);
   this._oData.data.removeEventListener("apChanged",this);
   this._oData.data.removeEventListener("mpChanged",this);
};
_loc1.actualizarData = function()
{
   this._oData.data.addEventListener("lpChanged",this);
   this._oData.data.addEventListener("apChanged",this);
   this._oData.data.addEventListener("mpChanged",this);
   this.apChanged({value:Math.max(0,this._oData.data.AP)});
   this.mpChanged({value:Math.max(0,this._oData.data.MP)});
};
_loc1.click = function(oEvent)
{
   this.api.kernel.GameManager.signalFightActivity();
   var _loc8_;
   var _loc4_;
   var _loc6_;
   var _loc9_;
   switch(oEvent.target._name)
   {
      case "_btnMore":
         this.gapi.loadUIAutoHideComponent("BannerMenuIco","BannerMenuIco");
         break;
      case "_btnCriatura":
         if(!_global.AUTORIZADO)
         {
            return undefined;
         }
         this.modoCriatura();
         break;
      case "_btnAntiLag":
         if(!_global.AUTORIZADO)
         {
            return undefined;
         }
         this.modoAntiLag();
         break;
      case "_btnPvP":
         this.api.sounds.events.onBannerRoundButtonClick();
         if(this.api.datacenter.Player.data.alignment.index == 0)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("NEED_ALIGNMENT"),"ERROR_CHAT");
         }
         else
         {
            this.showSmileysEmotesPanel(false);
            this.gapi.loadUIAutoHideComponent("Conquest","Conquest",{currentTab:"Stats"});
         }
         break;
      case "_btnMount":
         this.api.sounds.events.onBannerRoundButtonClick();
         if(this._oData.isMutant)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
            return undefined;
         }
         if(this._oData.mount != undefined)
         {
            this.showSmileysEmotesPanel(false);
            if(this.gapi.getUIComponent("MountAncestorsViewer") != undefined)
            {
               this.gapi.unloadUIComponent("MountAncestorsViewer");
               this.gapi.unloadUIComponent("Mount");
            }
            else
            {
               this.gapi.loadUIAutoHideComponent("Mount","Mount");
            }
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("UI_ONLY_FOR_MOUNT"),"ERROR_CHAT");
         }
         break;
      case "cerrar":
         this.objetivodesc._visible = false;
         break;
      case "_btnShow":
         if(this.SubCerrado == false)
         {
            this.SubMenu._visible = true;
            this._btnObje._visible = true;
            this._btnKolo._visible = true;
            this.SubCerrado = true;
            this._btnShow.icon = "buttonObjetivosDer";
         }
         else
         {
            this.SubMenu._visible = false;
            this._btnObje._visible = false;
            this._btnKolo._visible = false;
            this.SubCerrado = false;
            this._btnShow.icon = "buttonObjetivosIzq";
         }
         break;
      case "_btnObje":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         if(this.Objetivos == false)
         {
            this.api.network.send("wr");
         }
         else
         {
            this.panelobjev.gotoAndPlay(19);
            this.Objetivos = false;
            this.CompruebaCerro();
         }
         break;
      case "btnCompletarObj":
         this.api.network.send("wX");
         if(this.Objetivos == true)
         {
            this.panelobjev.gotoAndPlay(19);
            this.Objetivos = false;
            this.objetivodesc._visible = false;
         }
         break;
      case "btnentregar":
         this.api.network.send("wR" + this.Posicion);
         if(this.Objetivos == true)
         {
            this.panelobjev.gotoAndPlay(19);
            this.Objetivos = false;
            this.objetivodesc._visible = false;
         }
         break;
      case "_btnGuild":
         this.api.network.send("wg");
         break;
      case "_btnStatsJob":
         this.api.sounds.events.onBannerRoundButtonClick();
         if(this._oData.isMutant)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
            return undefined;
         }
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("StatsJob","StatsJob");
         break;
      case "_btnSpells":
         this.api.sounds.events.onBannerRoundButtonClick();
         if(this._oData.isMutant)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
            return undefined;
         }
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("Spells","Spells");
         break;
      case "_btnInventory":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("Inventory","Inventory");
         break;
      case "_btnQuests":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("Quests","Quests");
         break;
      case "_btnMap":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("MapExplorer","MapExplorer");
         break;
      case "_btnFriends":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("Friends","Friends");
         break;
      case "_btnFights":
         if(!this.api.datacenter.Game.isFight)
         {
            this.gapi.loadUIComponent("FightsInfos","FightsInfos");
         }
         break;
      case "_btnHelp":
         _loc8_ = this.api.lang.getConfigText("CHAT_FILTERS");
         _loc4_ = this.api.ui.createPopupMenu();
         _loc4_.addStaticItem(this.api.lang.getText("CHAT_PREFIX"));
         _loc4_.addItem(this.api.lang.getText("DEFAUT"),this,this.setChatPrefix,[""]);
         _loc4_.addItem(this.api.lang.getText("TEAM") + " (/t)",this,this.setChatPrefix,["/t"],this.api.datacenter.Game.isFight);
         _loc4_.addItem(this.api.lang.getText("PARTY") + " (/p)",this,this.setChatPrefix,["/p"],this.api.ui.getUIComponent("Party") != undefined);
         _loc4_.addItem(this.api.lang.getText("GUILD") + " (/g)",this,this.setChatPrefix,["/g"],this.api.datacenter.Player.guildInfos != undefined);
         if(_loc8_[4])
         {
            _loc4_.addItem(this.api.lang.getText("ALIGNMENT") + " (/a)",this,this.setChatPrefix,["/a"],this.api.datacenter.Player.alignment.index != 0);
         }
         if(_loc8_[5])
         {
            _loc4_.addItem(this.api.lang.getText("RECRUITMENT") + " (/r)",this,this.setChatPrefix,["/r"]);
         }
         if(_loc8_[6])
         {
            _loc4_.addItem(this.api.lang.getText("TRADE") + " (/b)",this,this.setChatPrefix,["/b"]);
         }
         if(_loc8_[7])
         {
            _loc4_.addItem(this.api.lang.getText("MEETIC") + " (/i)",this,this.setChatPrefix,["/i"]);
         }
         if(this.api.datacenter.Player.isAuthorized)
         {
            _loc4_.addItem(this.api.lang.getText("PRIVATE_CHANNEL") + " (/q)",this,this.setChatPrefix,["/q"]);
         }
         _loc4_.addItem(this.api.lang.getText("HELP"),this,this.displayChatHelp,[]);
         _loc4_.show(this._btnHelp._x,this._btnHelp._y,true);
         break;
      case "_btnNextTurn":
         if(this.api.datacenter.Game.isFight)
         {
            this.api.network.Game.prepareTurnEnd();
         }
         break;
      case "_btnGiveUp":
         if(this.api.datacenter.Game.isFight)
         {
            if(this.api.datacenter.Game.isSpectator)
            {
               this.api.network.Game.leave();
            }
            else
            {
               this.api.kernel.GameManager.giveUpGame();
            }
         }
         break;
      case "_mcXtra":
         if(!this.api.datacenter.Game.isFight)
         {
            if(!Key.isDown(16))
            {
               if(this._sCurrentCircleXtra == "helper" && dofus["\x0b\x07"].TipsManager.getInstance().hasNewTips())
               {
                  dofus["\x0b\x07"].TipsManager.getInstance().displayNextTips();
                  break;
               }
               _loc6_ = this.api.ui.createPopupMenu();
               if(this._sCurrentCircleXtra == "helper")
               {
                  _loc6_.addStaticItem(this.api.lang.getText("HELP_ME"));
                  _loc6_.addItem(this.api.lang.getText("KB_TITLE"),this.api.ui,this.api.ui.loadUIComponent,["KnownledgeBase","KnownledgeBase"],true);
                  _loc6_.addStaticItem(this.api.lang.getText("OTHER_DISPLAY_OPTIONS"));
               }
               _loc6_.addItem(this.api.lang.getText("BANNER_ARTWORK"),this,this.showCircleXtra,["artwork",true,{bMask:true}],this._sCurrentCircleXtra != "artwork");
               _loc6_.addItem(this.api.lang.getText("BANNER_CLOCK"),this,this.showCircleXtra,["clock",true,{bMask:true}],this._sCurrentCircleXtra != "clock");
               _loc6_.addItem(this.api.lang.getText("BANNER_COMPASS"),this,this.showCircleXtra,["compass",true],this._sCurrentCircleXtra != "compass");
               _loc6_.addItem(this.api.lang.getText("BANNER_HELPER"),this,this.showCircleXtra,["helper",true],this._sCurrentCircleXtra != "helper");
               _loc6_.addItem(this.api.lang.getText("BANNER_MAP"),this,this.showCircleXtra,["map",true,{bMask:true,sMaskSize:"big"}],this._sCurrentCircleXtra != "map");
               _loc6_.show(_root._xmouse,_root._ymouse,true);
            }
         }
         break;
      default:
         if(this._msShortcuts.currentTab !== "Spells")
         {
            break;
         }
         this.api.sounds.events.onBannerSpellSelect();
         if(this.api.kernel.TutorialManager.isTutorialMode)
         {
            this.api.kernel.TutorialManager.onWaitingCase({code:"SPELL_CONTAINER_SELECT",params:[Number(oEvent.target._name.substr(4))]});
            break;
         }
         if(this.gapi.getUIComponent("Spells") != undefined)
         {
            return undefined;
         }
         _loc9_ = oEvent.target.contentData;
         if(_loc9_ == undefined)
         {
            return undefined;
         }
         this.api.kernel.GameManager.switchToSpellLaunch(_loc9_,true);
         break;
   }
};
