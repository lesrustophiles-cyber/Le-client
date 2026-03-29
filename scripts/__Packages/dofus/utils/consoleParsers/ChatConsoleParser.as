var _loc1 = _global.dofus["\x1e\n\t"]["\x12\x05"]["\x12\x1c"].prototype;
_loc1.process = function(_loc3_, _loc4_)
{
   super.process(_loc3_,_loc4_);
   _loc3_ = this.parseSpecialDatas(_loc3_);
   var _loc4_;
   var _loc8_;
   var _loc11_;
   var _loc16_;
   var _loc26_;
   var _loc24_;
   var _loc20_;
   var _loc19_;
   var _loc18_;
   var _loc21_;
   var _loc10_;
   var _loc5_;
   var _loc6_;
   var _loc9_;
   var _loc17_;
   var _loc23_;
   var _loc25_;
   var _loc12_;
   var _loc15_;
   var _loc22_;
   if(_loc3_.charAt(0) == "/")
   {
      _loc4_ = _loc3_.split(" ");
      _loc8_ = _loc4_[0].substr(1).toUpperCase();
      _loc4_.splice(0,1);
      while(_loc4_[0].length == 0)
      {
         _loc4_.splice(0,1);
      }
      switch(_loc8_)
      {
         case "HELP":
         case "H":
         case "?":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("COMMANDS_HELP"),"COMMANDS_CHAT");
            break;
         case "VERSION":
         case "VER":
         case "ABOUT":
            _loc11_ = "--------------------------------------------------------------\n";
            _loc11_ += "<b>AEGNOR RETRO Client v" + dofus["\x12\x03"].VERSION + "." + dofus["\x12\x03"].SUBVERSION + "." + dofus["\x12\x03"].SUBSUBVERSION + "</b>";
            if(dofus["\x12\x03"].BETAVERSION > 0)
            {
               _loc11_ += " <b><font color=\"#FF0000\">BETA VERSION " + dofus["\x12\x03"].BETAVERSION + "</font></b>";
            }
            _loc11_ += "\n(c) ANKAMA GAMES (" + dofus["\x12\x03"].VERSIONDATE + ")\n";
            _loc11_ += "Flash player " + System.capabilities.version + "\n";
            _loc11_ += "--------------------------------------------------------------";
            this.api.kernel.showMessage(undefined,_loc11_,"COMMANDS_CHAT");
            break;
         case "T":
            this.api.network.Chat.send(_loc4_.join(" "),"#",_loc4_);
            break;
         case "G":
            if(this.api.datacenter.Player.guildInfos != undefined)
            {
               this.api.network.Chat.send(_loc4_.join(" "),"%",_loc4_);
            }
            break;
         case "P":
            if(this.api.ui.getUIComponent("Party") != undefined)
            {
               this.api.network.Chat.send(_loc4_.join(" "),"$",_loc4_);
            }
            break;
         case "A":
            this.api.network.Chat.send(_loc4_.join(" "),"!",_loc4_);
            break;
         case "R":
            this.api.network.Chat.send(_loc4_.join(" "),"?",_loc4_);
            break;
         case "B":
            this.api.network.Chat.send(_loc4_.join(" "),":",_loc4_);
            break;
         case "I":
            this.api.network.Chat.send(_loc4_.join(" "),"^",_loc4_);
            break;
         case "Q":
            this.api.network.Chat.send(_loc4_.join(" "),"@",_loc4_);
            break;
         case "M":
            this.api.network.Chat.send(_loc4_.join(" "),"¤",_loc4_);
            break;
         case "W":
         case "MSG":
         case "WHISPER":
            if(_loc4_.length < 2)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /w &lt;" + this.api.lang.getText("NAME") + "&gt; &lt;" + this.api.lang.getText("MSG") + "&gt;"]),"ERROR_CHAT");
               break;
            }
            _loc16_ = _loc4_[0];
            if(_loc16_.length < 2)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /w &lt;" + this.api.lang.getText("NAME") + "&gt; &lt;" + this.api.lang.getText("MSG") + "&gt;"]),"ERROR_CHAT");
               break;
            }
            _loc4_.shift();
            _loc26_ = _loc4_.join(" ");
            this.pushWhisper("/w " + _loc16_ + " ");
            this.api.network.Chat.send(_loc26_,_loc16_,_loc4_);
            break;
         case "WHOAMI":
            this.api.network.Basics.whoAmI();
            break;
         case "WHOIS":
            if(_loc4_.length == 0)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /whois &lt;" + this.api.lang.getText("NAME") + "&gt;"]),"ERROR_CHAT");
               break;
            }
            this.api.network.Basics.whoIs(_loc4_[0]);
            break;
         case "F":
         case "FRIEND":
         case "FRIENDS":
            switch(_loc4_[0].toUpperCase())
            {
               case "A":
               case "+":
                  this.api.network.Friends.addFriend(_loc4_[1]);
                  break;
               case "D":
               case "R":
               case "-":
                  this.api.network.Friends.removeFriend(_loc4_[1]);
                  break;
               case "L":
                  this.api.network.Friends.getFriendsList();
                  break;
               default:
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /f &lt;A/D/L&gt; &lt;" + this.api.lang.getText("NAME") + "&gt;"]),"ERROR_CHAT");
            }
            break;
         case "IGNORE":
         case "ENEMY":
            switch(_loc4_[0].toUpperCase())
            {
               case "A":
               case "+":
                  this.api.network.Enemies.addEnemy(_loc4_[1]);
                  break;
               case "D":
               case "R":
               case "-":
                  this.api.network.Enemies.removeEnemy(_loc4_[1]);
                  break;
               case "L":
                  this.api.network.Enemies.getEnemiesList();
                  break;
               default:
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /f &lt;A/D/L&gt; &lt;" + this.api.lang.getText("NAME") + "&gt;"]),"ERROR_CHAT");
            }
            break;
         case "PING":
            this.api.network.ping();
            break;
         case "GOD":
         case "GODMODE":
            _loc24_ = Math.random();
            if(_loc24_ >= 0.5)
            {
               _loc20_ = ["Bill","Tyn","Nyx","Lichen","Simsoft"];
               _loc19_ = _loc20_[Math.floor(Math.random() * _loc20_.length)];
               _loc18_ = "Legacy";
            }
            else
            {
               _loc21_ = ["Kam","ToT","Sispano","LeLag","DUSK","Logan","Lakha","Sannho","Treuff","Artand","Ekyn","Bonzho","Simeth","Asthenis","Oopah"];
               _loc19_ = _loc21_[Math.floor(Math.random() * _loc21_.length)];
               _loc18_ = "1.30+";
            }
            this.api.kernel.showMessage(undefined,"God : <u>" + _loc19_ + "</u> (Retro <b>" + _loc18_ + "</b>)","COMMANDS_CHAT");
            break;
         case "APING":
            this.api.kernel.showMessage(undefined,"Average ping : " + this.api.network.getAveragePing() + "ms (on " + this.api.network.getAveragePingPacketsCount() + " packets)","COMMANDS_CHAT");
            break;
         case "MAPID":
            this.api.kernel.showMessage(undefined,"MAP ID : " + this.api.datacenter.Map.id,"COMMANDS_CHAT");
            if(this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.showMessage(undefined,"Area : " + this.api.datacenter.Map.area,"COMMANDS_CHAT");
               this.api.kernel.showMessage(undefined,"Sub area : " + this.api.datacenter.Map.subarea,"COMMANDS_CHAT");
               this.api.kernel.showMessage(undefined,"Super Area : " + this.api.datacenter.Map.superarea,"COMMANDS_CHAT");
            }
            break;
         case "CELLID":
            this.api.kernel.showMessage(undefined,"CELL ID : " + this.api.datacenter.Player.data.cellNum,"COMMANDS_CHAT");
            break;
         case "TIME":
            this.api.kernel.showMessage(undefined,this.api.kernel.NightManager.date + " - " + this.api.kernel.NightManager.time,"COMMANDS_CHAT");
            break;
         case "LIST":
         case "PLAYERS":
            if(!this.api.datacenter.Game.isFight)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_COMMAND_HERE",[_loc8_]),"ERROR_CHAT");
               return undefined;
            }
            _loc10_ = new Array();
            _loc5_ = this.api.datacenter.Sprites.getItems();
            for(var _loc14_ in _loc5_)
            {
               if(_loc5_[_loc14_] instanceof dofus.datacenter["\x13\x01"])
               {
                  _loc10_.push("- " + _loc5_[_loc14_].name);
               }
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("PLAYERS_LIST") + " :\n" + _loc10_.join("\n"),"COMMANDS_CHAT");
            break;
         case "KICK":
            if(!this.api.datacenter.Game.isFight || this.api.datacenter.Game.isRunning)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_COMMAND_HERE",[_loc8_]),"ERROR_CHAT");
               return undefined;
            }
            _loc6_ = String(_loc4_[0]);
            _loc9_ = this.api.datacenter.Sprites.getItems();
            for(_loc14_ in _loc9_)
            {
               if(_loc9_[_loc14_] instanceof dofus.datacenter["\x13\x01"] && _loc9_[_loc14_].name == _loc6_)
               {
                  _loc9_ = _loc6_[_loc14_].id;
                  break;
               }
            }
            if(_loc19_ != undefined)
            {
               this.api.network.Game.leave(_loc19_);
            }
            else
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_KICK_A",[_loc6_]),"ERROR_CHAT");
            }
            break;
         case "SPECTATOR":
         case "S":
            if(!this.api.datacenter.Game.isRunning || this.api.datacenter.Game.isSpectator)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_COMMAND_HERE",[_loc8_]),"ERROR_CHAT");
               return undefined;
            }
            this.api.network.Fights.blockSpectators();
            break;
         case "AWAY":
            this.api.network.Basics.away();
            break;
         case "INVISIBLE":
            this.api.network.Basics.invisible();
            break;
         case "INVITE":
            _loc17_ = String(_loc4_[0]);
            if(_loc17_.length == 0 || _loc17_ == undefined)
            {
               break;
            }
            this.api.network.Party.invite(_loc17_);
            break;
         case "CONSOLE":
            if(this.api.datacenter.Player.isAuthorized)
            {
               this.api.ui.loadUIComponent("Debug","Debug",undefined,{bAlwaysOnTop:true});
            }
            else
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc8_]),"ERROR_CHAT");
            }
            break;
         case "DEBUG":
            if(this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.DebugManager.toggleDebug();
            }
            break;
         case "CHANGECHARACTER":
            this.api.kernel.changeServer();
            break;
         case "LOGOUT":
            this.api.kernel.disconnect();
            break;
         case "QUIT":
            this.api.kernel.quit();
            break;
         case "THINK":
         case "METHINK":
         case "PENSE":
         case "TH":
            if(_loc4_.length < 1)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /" + _loc8_.toLowerCase() + " &lt;" + this.api.lang.getText("TEXT_WORD") + "&gt;"]),"ERROR_CHAT");
               break;
            }
            _loc23_ = "!THINK!" + _loc4_.join(" ");
            if(this.api.datacenter.Player.canChatToAll)
            {
               this.api.network.Chat.send(_loc23_,"*",_loc4_);
            }
            break;
         case "ME":
         case "EM":
         case "MOI":
         case "EMOTE":
            if(!this.api.lang.getConfigText("EMOTES_ENABLED"))
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc8_]),"ERROR_CHAT");
               break;
            }
            if(_loc4_.length < 1)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /" + _loc8_.toLowerCase() + " &lt;" + this.api.lang.getText("TEXT_WORD") + "&gt;"]),"ERROR_CHAT");
               break;
            }
            _loc25_ = _loc4_.join(" ");
            if(this.api.datacenter.Player.canChatToAll)
            {
               this.api.network.Chat.send(dofus["\x12\x03"].EMOTE_CHAR + _loc25_ + dofus["\x12\x03"].EMOTE_CHAR,"*",_loc4_);
            }
            break;
         case "KB":
            this.api.ui.loadUIComponent("KnownledgeBase","KnownledgeBase");
            break;
         case "RELEASE":
            if(this.api.datacenter.Player.data.isTomb)
            {
               this.api.network.Game.freeMySoul();
            }
            else if(this.api.datacenter.Player.data.isSlow)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ALREADY_A_GHOST"),"ERROR_CHAT");
            }
            else
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_NOT_DEAD_AT_LEAST_FOR_NOW"),"ERROR_CHAT");
            }
            break;
         case "SELECTION":
            if(_loc4_[0] == "enable" || _loc4_[0] == "on")
            {
               dofus["\r\x13"].gapi.ui.Banner(this.api.ui.getUIComponent("Banner")).setSelectable(true);
            }
            else if(_loc4_[0] == "disable" || _loc4_[0] == "off")
            {
               dofus["\r\x13"].gapi.ui.Banner(this.api.ui.getUIComponent("Banner")).setSelectable(false);
            }
            else
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",["/selection [enable|on|disable|off]"]),"ERROR_CHAT");
            }
            break;
         case "WTF":
         case "DOFUS2":
            this.api.kernel.showMessage(undefined,"(°~°)","ERROR_BOX");
            break;
         case "TACTIC":
            this.api.datacenter.Game.isTacticMode = !this.api.datacenter.Game.isTacticMode;
            this.api.ui.getUIComponent("FightOptionButtons")._btnTactic.selected = this.api.datacenter.Game.isTacticMode;
            break;
         case "FILEOUTPUT":
            if(this.api.electron.enabled)
            {
               _loc12_ = Number(_loc4_[0]);
               if(_loc4_[0] == undefined || (_global.isNaN(_loc12_) || (_loc12_ < 0 || _loc12_ > 2)))
               {
                  this.api.kernel.showMessage(undefined,"/fileoutput &lt;0 (disabled) | 1 (enabled) | 2 (full)&gt;","ERROR_CHAT");
                  return undefined;
               }
               _loc15_ = "";
               switch(_loc12_)
               {
                  case 0:
                     _loc15_ = "Disabled";
                     break;
                  case 1:
                     _loc15_ = "Enabled";
                     break;
                  case 2:
                     _loc15_ = "Enabled (full)";
               }
               this.api.kernel.ChatManager.fileOutput = _loc12_;
               this.api.kernel.showMessage(undefined,"File Output (Chat) : " + _loc15_,"COMMANDS_CHAT");
            }
            else
            {
               this.api.kernel.showMessage(undefined,"Does not work on a Flash Projector","COMMANDS_CHAT");
            }
            break;
         case "CLS":
         case "CLEAR":
            this.api.kernel.ChatManager.clear();
            this.api.kernel.ChatManager.refresh(true);
            break;
         case "SPEAKINGITEM":
            if(this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.showMessage(undefined,"Count : " + this.api.kernel.SpeakingItemsManager.nextMsgDelay,"ERROR_CHAT");
               break;
            }
         default:
            _loc22_ = this.api.lang.getEmoteID(_loc8_.toLowerCase());
            if(_loc22_ != undefined)
            {
               this.api.network.Emotes.useEmote(_loc22_);
               break;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc8_]),"ERROR_CHAT");
            break;
      }
   }
   else if(this.api.datacenter.Player.canChatToAll)
   {
      this.api.network.Chat.send(_loc3_,"*",_loc4_);
   }
};
