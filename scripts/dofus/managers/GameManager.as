var _loc1 = dofus["\x0b\x07"].GameManager.prototype;
dofus["\x0b\x07"].GameManager.MINIMAL_SPELL_LAUNCH_DELAY = 20;
_loc1.showPlayerPopupMenu = function(_loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_, _loc8_, _loc9_, _loc10_)
{
   if(!_loc10_)
   {
      this._sLastClickedMessage = undefined;
   }
   if(_loc9_ == undefined)
   {
      _loc9_ = false;
   }
   var _loc5_ = null;
   var _loc4_;
   var _loc3_;
   if(_loc2_ != undefined)
   {
      _loc5_ = _loc2_;
   }
   else
   {
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      _loc4_ = this.api.datacenter.Sprites.getItems();
      for(var _loc9_ in _loc4_)
      {
         _loc3_ = _loc4_[_loc9_];
         if(_loc3_.name.toUpperCase() == _loc3_.toUpperCase())
         {
            _loc5_ = _loc3_;
            break;
         }
      }
   }
   var _loc10_ = this.api.datacenter.Game.isFight;
   var _loc12_ = _loc5_.id;
   var _loc8_ = _loc3_ == undefined ? _loc5_.name : _loc3_;
   var _loc11_;
   var _loc7_;
   if(Key.isDown(16) && _loc8_ != this.api.datacenter.Player.Name && !_loc10_ && !this.api.datacenter.Game.isRunning)
   {
      _loc11_ = this.api.ui.getUIComponent("Banner");
      _loc11_.txtConsole = "/w " + _loc8_ + " ";
      _loc11_.placeCursorAtTheEnd();
   }
   else if(Key.isDown(16) && _loc8_ != this.api.datacenter.Player.Name && _loc10_ && !this.api.datacenter.Game.isRunning)
   {
      this.api.network.Game.cambiarPosN(_loc12_);
   }
   else
   {
      if(this.api.datacenter.Player.isAuthorized && !_loc9_)
      {
         _loc7_ = this.api.kernel.AdminManager.getAdminPopupMenu(_loc8_,false);
         _loc7_.addItem(_loc8_ + " >>",this,this.showPlayerPopupMenu,[_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,true],true);
         _loc7_.items.unshift(_loc7_.items.pop());
      }
      else
      {
         _loc7_ = this.getPlayerPopupMenu(_loc5_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      if(_loc7_.items.length > 0)
      {
         _loc7_.show(_root._xmouse,_root._ymouse,true);
      }
   }
};
_loc1.getPlayerPopupMenu = function(_loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_, _loc8_)
{
   var _loc13_ = this.api.datacenter.Game.isFight;
   var _loc11_ = _loc2_.id;
   var _loc10_ = _loc3_ == undefined ? _loc2_.name : _loc3_;
   var _loc2_ = this.api.ui.createPopupMenu();
   _loc2_.addStaticItem(_loc10_);
   var _loc14_ = this.api.kernel.ChatManager.isBlacklisted(_loc10_);
   if(_loc14_)
   {
      _loc2_.addStaticItem("(" + this.api.lang.getText("IGNORED_WORD") + ")");
   }
   if(_loc13_)
   {
      if(!this.api.datacenter.Game.isRunning && (!this.api.datacenter.Player.isMutant || this.api.datacenter.Player.canAttackDungeonMonstersWhenMutant))
      {
         if(_loc2_ != null && _loc11_ != this.api.datacenter.Player.ID)
         {
            if(Key.isDown(16))
            {
               this.api.network.Game.cambiarPosN(_loc11_);
            }
            else
            {
               _loc2_.addItem(this.api.lang.getText("KICK"),this.api.network.Game,this.api.network.Game.leave,[_loc11_]);
               _loc2_.addItem(this.api.lang.getText("SWITCH"),this.api.network.Game,this.api.network.Game.cambiarPosN,[_loc11_]);
            }
         }
      }
   }
   var _loc20_;
   var _loc12_;
   var _loc6_;
   var _loc19_;
   var _loc7_;
   var _loc5_;
   var _loc8_;
   var _loc4_;
   var _loc9_;
   if(_loc11_ == this.api.datacenter.Player.ID)
   {
      _loc2_.addItem(this.api.lang.getText("CHANGE_NAME"),this.api.ui,this.api.ui.loadUIComponent,["Edit","Edit"]);
      _loc2_.addItem(this.api.lang.getText("SELECT_TITLE"),this.api.network,this.api.network.send,["Zt"]);
      _loc2_.addItem(this.api.lang.getText("CHANGE_CLASS"),this.api.network,this.api.network.send,["wl"]);
      _loc2_.addItem(this.api.lang.getText("HIT_HIMSELF"),this.api.network.Chat,this.api.network.Chat.send,[this.api.lang.getText("SLAP_SENTENCE"),"*"]);
      if(!_loc13_ && this.api.datacenter.Player.canBeMerchant)
      {
         _loc2_.addItem(this.api.lang.getText("ORGANIZE_SHOP"),this.api.kernel.GameManager,this.api.kernel.GameManager.startExchange,[6]);
         _loc2_.addItem(this.api.lang.getText("MERCHANT_MODE"),this.api.kernel.GameManager,this.api.kernel.GameManager.offlineExchange);
      }
      if(this.api.datacenter.Player.data.isTomb)
      {
         _loc2_.addItem(this.api.lang.getText("FREE_MY_SOUL"),this.api.network.Game,this.api.network.Game.freeMySoul);
      }
      else if(!_loc13_)
      {
         _loc20_ = _loc2_.animation == "static";
         _loc2_.addItem(this.api.lang.getText("CHANGE_DIRECTION"),this.api.ui,this.api.ui.loadUIComponent,["DirectionChooser","DirectionChooser",{allDirections:this.api.datacenter.Player.canMoveInAllDirections,target:this.api.datacenter.Player.data.mc}]);
      }
   }
   else
   {
      if(_loc7_ != undefined && (_loc7_.length > 0 && (_loc7_ != "" && !_loc14_)))
      {
         _loc12_ = false;
         _loc6_ = 0;
         while(_loc6_ < this.api.lang.getConfigText("ENABLED_SERVER_REPORT_LIST").length)
         {
            if(this.api.lang.getConfigText("ENABLED_SERVER_REPORT_LIST")[_loc6_] == this.api.datacenter.Basics.aks_current_server.id)
            {
               _loc12_ = true;
               break;
            }
            _loc6_ += 1;
         }
         if(_loc12_)
         {
            _loc2_.addItem(this.api.lang.getText("REPORT_SENTANCE"),this.api.kernel.GameManager,this.api.kernel.GameManager.reportSentance,[_loc10_,_loc11_,_loc7_,_loc2_]);
         }
      }
      if(!this.api.kernel.ChatManager.isBlacklisted(_loc10_))
      {
         _loc2_.addItem(this.api.lang.getText("BLACKLIST_TEMPORARLY"),this.api.kernel.GameManager,this.api.kernel.GameManager.reportSentance,[_loc10_,_loc11_,undefined,_loc2_]);
      }
      else
      {
         _loc2_.addItem(this.api.lang.getText("BLACKLIST_REMOVE"),this.api.kernel.ChatManager,this.api.kernel.ChatManager.removeToBlacklist,[_loc10_]);
      }
      if(!_loc13_ || _loc13_ && _loc3_ != undefined)
      {
         _loc2_.addItem(this.api.lang.getText("WHOIS"),this.api.network.Basics,this.api.network.Basics.whoIs,[_loc10_]);
         if(_loc5_ != true)
         {
            _loc2_.addItem(this.api.lang.getText("ADD_TO_FRIENDS"),this.api.network.Friends,this.api.network.Friends.addFriend,[_loc10_]);
         }
         if(_loc5_ != true)
         {
            _loc2_.addItem(this.api.lang.getText("ADD_TO_ENEMY"),this.api.network.Enemies,this.api.network.Enemies.addEnemy,[_loc10_]);
         }
         _loc2_.addItem(this.api.lang.getText("WISPER_MESSAGE"),this.api.kernel.GameManager,this.api.kernel.GameManager.askPrivateMessage,[_loc10_]);
         if(_loc4_ == undefined)
         {
            _loc2_.addItem(this.api.lang.getText("ADD_TO_PARTY"),this.api.network.Party,this.api.network.Party.invite,[_loc10_]);
         }
         if(this.api.datacenter.Player.guildInfos != undefined)
         {
            if(_loc6_ != true)
            {
               if(_loc2_ == null || (_loc2_ != null && _loc2_.guildName == undefined || _loc2_.guildName.length == 0))
               {
                  if(this.api.datacenter.Player.guildInfos.playerRights.canInvite)
                  {
                     _loc2_.addItem(this.api.lang.getText("INVITE_IN_GUILD"),this.api.network.Guild,this.api.network.Guild.invite,[_loc10_]);
                  }
               }
            }
         }
         if(_loc8_)
         {
            if(this.api.datacenter.Player.isAuthorized)
            {
               _loc2_.addItem(this.api.lang.getText("JOIN_SMALL"),this.api.kernel.AdminManager,this.api.kernel.AdminManager.sendCommand,["join " + _loc10_]);
            }
            else if(this.api.datacenter.Map.superarea == 3)
            {
               _loc2_.addItem(this.api.lang.getText("JOIN_SMALL"),this.api.network.Friends,this.api.network.Friends.joinFriend,[_loc10_]);
            }
         }
      }
      if(!_loc13_ && (_loc2_ != null && (_loc2_.gfxID != "999" && !_loc5_)))
      {
         if(this.api.datacenter.Player.isAtHome(this.api.datacenter.Map.id))
         {
            _loc2_.addItem(this.api.lang.getText("KICKOFF"),this.api.network.Houses,this.api.network.Houses.kick,[_loc11_]);
         }
         if(this.api.datacenter.Player.canExchange && _loc2_.canExchange)
         {
            _loc2_.addItem(this.api.lang.getText("EXCHANGE"),this.api.kernel.GameManager,this.api.kernel.GameManager.startExchange,[1,_loc11_]);
         }
         if(this.api.datacenter.Player.canChallenge && _loc2_.canBeChallenge)
         {
            _loc2_.addItem(this.api.lang.getText("CHALLENGE"),this.api.network.GameActions,this.api.network.GameActions.challenge,[_loc11_],this.api.datacenter.Map.bCanChallenge);
         }
         if(this.api.datacenter.Player.canAssault && !_loc2_.showIsPlayer)
         {
            _loc19_ = this.api.datacenter.Player.data.alignment.index;
            if(this.api.lang.getAlignmentCanAttack(_loc19_,_loc2_.alignment.index))
            {
               _loc2_.addItem(this.api.lang.getText("ASSAULT"),this.api.kernel.GameManager,this.api.kernel.GameManager.askAttack,[[_loc11_]],this.api.datacenter.Map.bCanAttack);
            }
         }
         if(this.api.datacenter.Player.canAttack && (_loc2_.canBeAttack && !_loc2_.showIsPlayer))
         {
            _loc2_.addItem(this.api.lang.getText("ATTACK"),this.api.network.GameActions,this.api.network.GameActions.mutantAttack,[_loc2_.id]);
            _loc2_.addItem("Difficile",this.api.network.GameActions,this.api.network.GameActions.mutantAttack1,[_loc2_.id]);
            _loc2_.addItem("Monstreux",this.api.network.GameActions,this.api.network.GameActions.mutantAttack2,[_loc2_.id]);
         }
         _loc7_ = _loc2_.multiCraftSkillsID;
         if(_loc7_ != undefined && _loc7_.length > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc7_.length)
            {
               _loc8_ = Number(_loc7_[_loc5_]);
               _loc2_.addItem(this.api.lang.getText("ASK_TO") + " " + this.api.lang.getSkillText(_loc8_).d,this.api.network.Exchange,this.api.network.Exchange.request,[13,_loc2_.id,_loc8_]);
               _loc5_ += 1;
            }
         }
         else
         {
            _loc7_ = this.api.datacenter.Player.data.multiCraftSkillsID;
            if(_loc7_ != undefined && _loc7_.length > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc7_.length)
               {
                  _loc9_ = Number(_loc7_[_loc4_]);
                  _loc2_.addItem(this.api.lang.getText("INVITE_TO") + " " + this.api.lang.getSkillText(_loc9_).d,this.api.network.Exchange,this.api.network.Exchange.request,[12,_loc2_.id,_loc9_]);
                  _loc4_ += 1;
               }
            }
         }
      }
   }
   if(_loc4_ != undefined)
   {
      _loc4_.addPartyMenuItems(_loc2_);
   }
   if(_loc2_ != null && (_loc2_.gfxID != "999" && (_loc2_.isVisible && (this.api.ui.getUIComponent("Zoom") == undefined && !_loc13_))))
   {
      _loc2_.addItem(this.api.lang.getText("ZOOM"),this.api.ui,this.api.ui.loadUIAutoHideComponent,["Zoom","Zoom",{sprite:_loc2_}]);
   }
   return _loc2_;
};
