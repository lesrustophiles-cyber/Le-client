var _loc1 = _global.dofus.aks.Game.prototype;
_loc1.sendPacketCFP = function()
{
   this.aks.send("CFP");
};
_loc1.onTurnLider = function(_loc2_)
{
   var _loc2_;
   if(this.api.datacenter.Game.isFirstTurn)
   {
      this.api.datacenter.Game.isFirstTurn = false;
      _loc2_ = this.api.gfx.spriteHandler.getSprites().getItems();
      for(var _loc3_ in _loc2_)
      {
         this.api.gfx.removeSpriteExtraClip(_loc3_,true);
      }
   }
   var _loc5_ = _loc2_.split("|");
   var _loc4_ = _loc5_[0];
   var _loc6_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
   _loc6_.GameActionsManager.clear();
   this.api.gfx.unSelect(true);
   this.api.datacenter.Game.currentPlayerID = _loc4_;
   this.api.kernel.GameManager.cleanPlayer(this.api.datacenter.Game.lastPlayerID);
   this.api.ui.getUIComponent("Banner").shortcuts.setCurrentTab("Spells");
   this.api.gfx.mapHandler.resetEmptyCells();
   this.api.ui.getUIComponent("Banner").shortcuts.updateCurrentTabInformations();
   this.api.kernel.GameManager.cleanUpGameArea(true);
};
_loc1.triggerCellFightPos = function(CFP)
{
   if(CFP.length < 2)
   {
      this.api.kernel.showMessage(undefined,"Pas de cellules de combat sur cette carte.","INFO_CHAT");
      return undefined;
   }
   var _loc8_ = CFP.split("|");
   var _loc7_ = _loc8_[0];
   var _loc6_ = _loc8_[1];
   this.api.datacenter.Basics.aks_team1_starts = new Array();
   this.api.datacenter.Basics.aks_team2_starts = new Array();
   var _loc5_ = -2;
   var _loc3_;
   while(true)
   {
      _loc5_ += 2;
      if(_loc5_ >= _loc7_.length)
      {
         break;
      }
      _loc3_ = ank["\x1e\n\t"]["\x12\r"].decode64(_loc7_.charAt(_loc5_)) << 6;
      _loc3_ += ank["\x1e\n\t"]["\x12\r"].decode64(_loc7_.charAt(_loc5_ + 1));
      this.api.datacenter.Basics.aks_team1_starts.push(_loc3_);
      this.api.gfx.select(_loc3_,dofus["\x12\x03"].TEAMS_COLOR[0],"startPosition");
   }
   var _loc4_ = -2;
   var _loc2_;
   while(true)
   {
      _loc4_ += 2;
      if(_loc4_ >= _loc6_.length)
      {
         break;
      }
      _loc2_ = ank["\x1e\n\t"]["\x12\r"].decode64(_loc6_.charAt(_loc4_)) << 6;
      _loc2_ += ank["\x1e\n\t"]["\x12\r"].decode64(_loc6_.charAt(_loc4_ + 1));
      this.api.datacenter.Basics.aks_team2_starts.push(_loc2_);
      this.api.gfx.select(_loc2_,dofus["\x12\x03"].TEAMS_COLOR[1],"startPosition");
   }
};
_loc1.cambiarPos = function(nID)
{
   this.api.network.send("GM" + nID);
};
_loc1.cambiarPosN = function(nID)
{
   this.api.network.send("Gm" + nID);
};
_loc1.onTurnUpdate = function(sExtraData)
{
   var _loc14_ = sExtraData.split("|");
   var _loc17_ = new Object();
   var _loc4_ = 0;
   var _loc2_;
   var _loc5_;
   var _loc9_;
   var _loc13_;
   var _loc10_;
   var _loc6_;
   var _loc15_;
   var _loc16_;
   var _loc7_;
   var _loc11_;
   var _loc12_;
   var _loc8_;
   var _loc3_;
   while(_loc4_ < _loc14_.length)
   {
      _loc2_ = _loc14_[_loc4_].split(";");
      if(_loc2_.length != 0)
      {
         _loc5_ = _loc2_[0];
         _loc9_ = _loc2_[1] == "1" ? true : false;
         _loc13_ = Number(_loc2_[2]);
         _loc10_ = Number(_loc2_[3]);
         _loc6_ = Number(_loc2_[4]);
         _loc15_ = Number(_loc2_[5]);
         _loc16_ = Number(_loc2_[6]);
         _loc7_ = Number(_loc2_[7]);
         _loc11_ = Number(_loc2_[8]);
         _loc12_ = Number(_loc2_[9]);
         _loc8_ = _loc2_[10].split(",");
         _loc17_[_loc5_] = true;
         _loc3_ = this.api.datacenter.Sprites.getItemAt(_loc5_);
         if(_loc3_ != undefined)
         {
            if(_loc9_)
            {
               _loc3_.mc.clear();
               this.api.gfx.removeSpriteOverHeadLayer(_loc5_,"text");
            }
            else
            {
               _loc3_.LP = _loc13_;
               _loc3_.LPmax = _loc7_;
               _loc3_.AP = _loc10_;
               _loc3_.MP = _loc6_;
               _loc3_.Huida = _loc11_;
               _loc3_.Placaje = _loc12_;
               _loc3_.Resistencias = _loc8_;
            }
         }
      }
      _loc4_ += 1;
   }
};
_loc1.parsePlayerData = function(oResults, nStartIndex, nSenderID, aTmp, nFightType, nKamaDrop, eaFightDrop)
{
   var _loc11_ = nStartIndex;
   var _loc4_ = aTmp[_loc11_].split(";");
   var _loc3_ = new Object();
   var _loc13_;
   var _loc10_;
   if(Number(_loc4_[0]) != 6)
   {
      _loc3_.id = Number(_loc4_[1]);
      if(_loc3_.id == this.api.datacenter.Player.ID)
      {
         if(Number(_loc4_[0]) == 0)
         {
            this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_FIGHT_LOST);
         }
         else
         {
            this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_FIGHT_WON);
         }
      }
      _loc13_ = this.api.kernel.CharactersManager.getNameFromData(_loc4_[2]);
      _loc3_.name = _loc13_.name;
      _loc3_.type = _loc13_.type;
      _loc3_.level = Number(_loc4_[3]);
      _loc3_.bonus = Number(_loc4_[4]);
      _loc3_.bDead = _loc4_[5] == "1" ? true : false;
      switch(nFightType)
      {
         case 0:
            _loc3_.minxp = _loc4_[6];
            _loc3_.xp = _loc4_[7];
            _loc3_.maxxp = _loc4_[8];
            _loc3_.winxp = _loc4_[9];
            _loc3_.guildxp = Number(_loc4_[10]);
            _loc3_.mountxp = Number(_loc4_[11]);
            _loc10_ = _loc4_[12].split(",");
            if(_loc3_.id == this.api.datacenter.Player.ID && _loc10_.length > 10)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_GREAT_DROP);
            }
            _loc3_.kama = _loc4_[13];
            break;
         case 1:
            _loc3_.minhonour = Number(_loc4_[6]);
            _loc3_.honour = Number(_loc4_[7]);
            _loc3_.maxhonour = Number(_loc4_[8]);
            _loc3_.winhonour = Number(_loc4_[9]);
            _loc3_.rank = Number(_loc4_[10]);
            _loc3_.disgrace = Number(_loc4_[11]);
            _loc3_.windisgrace = Number(_loc4_[12]);
            _loc3_.maxdisgrace = this.api.lang.getMaxDisgracePoints();
            _loc3_.mindisgrace = 0;
            _loc10_ = _loc4_[13].split(",");
            if(_loc3_.id == this.api.datacenter.Player.ID && _loc10_.length > 10)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_GREAT_DROP);
            }
            _loc3_.kama = _loc4_[14];
            _loc3_.minxp = _loc4_[15];
            _loc3_.xp = _loc4_[16];
            _loc3_.maxxp = _loc4_[17];
            _loc3_.winxp = _loc4_[18];
      }
   }
   else
   {
      _loc10_ = _loc4_[1].split(",");
      _loc3_.kama = _loc4_[2];
      nKamaDrop += Number(_loc3_.kama);
   }
   _loc3_.items = new Array();
   var _loc6_ = _loc10_.length;
   var _loc7_;
   var _loc5_;
   var _loc8_;
   var _loc9_;
   while(true)
   {
      _loc6_ -= 1;
      if(_loc6_ < 0)
      {
         break;
      }
      _loc7_ = _loc10_[_loc6_].split("~");
      _loc5_ = Number(_loc7_[0]);
      _loc8_ = Number(_loc7_[1]);
      if(_global.isNaN(_loc5_))
      {
         break;
      }
      if(_loc5_ != 0)
      {
         _loc9_ = new dofus.datacenter["\f\x0b"](0,_loc5_,_loc8_);
         _loc3_.items.push(_loc9_);
      }
   }
   switch(Number(_loc4_[0]))
   {
      case 0:
         oResults.loosers.push(_loc3_);
         break;
      case 2:
         oResults.winners.push(_loc3_);
         break;
      case 5:
         oResults.collectors.push(_loc3_);
         break;
      case 6:
         eaFightDrop = eaFightDrop.concat(_loc3_.items);
   }
   _loc11_ += 1;
   if(_loc11_ < aTmp.length)
   {
      this.addToQueue({object:this,method:this.parsePlayerData,params:[oResults,_loc11_,nSenderID,aTmp,nFightType,nKamaDrop,eaFightDrop]});
   }
   else
   {
      this.onParseItemEnd(nSenderID,oResults,eaFightDrop,nKamaDrop);
   }
};
_loc1.changeCellFightState = function(sExtraData)
{
   this._btnShowFightPos = !this._btnShowFightPos;
   var _loc9_ = sExtraData.split("|");
   var _loc8_ = _loc9_[0];
   var _loc7_ = _loc9_[1];
   var _loc3_;
   var _loc6_;
   var _loc4_;
   var _loc5_;
   if(!this._btnShowFightPos)
   {
      _global.API.gfx.unSelect(true);
   }
   else
   {
      _loc3_ = 0;
      while(_loc3_ < _loc8_.length)
      {
         _loc6_ = ank["\x1e\n\t"]["\x12\r"].decode64(_loc8_.charAt(_loc3_)) << 6;
         _loc6_ += ank["\x1e\n\t"]["\x12\r"].decode64(_loc8_.charAt(_loc3_ + 1));
         this.api.gfx.select(_loc6_,dofus["\x12\x03"].TEAMS_COLOR[0],"startPosition");
         _loc3_ += 2;
      }
      _loc4_ = 0;
      while(_loc4_ < _loc7_.length)
      {
         _loc5_ = ank["\x1e\n\t"]["\x12\r"].decode64(_loc7_.charAt(_loc4_)) << 6;
         _loc5_ += ank["\x1e\n\t"]["\x12\r"].decode64(_loc7_.charAt(_loc4_ + 1));
         this.api.gfx.select(_loc5_,dofus["\x12\x03"].TEAMS_COLOR[1],"startPosition");
         _loc4_ += 2;
      }
   }
};
_loc1.onMapData = function(sExtraData)
{
   if(_global.mapaDta != undefined)
   {
      sExtraData = _global.mapaDta;
      _global.mapaDta = undefined;
   }
   var _loc3_ = sExtraData.split("|");
   var _loc5_ = _loc3_[0];
   var _loc6_ = _loc3_[1];
   var _loc7_ = _loc3_[2];
   if(Number(_loc5_) == this.api.datacenter.Map.id)
   {
      if(!this.api.datacenter.Map.bOutdoor)
      {
         this.api.kernel.NightManager.noEffects();
      }
      this.api.gfx.onMapLoaded();
      return undefined;
   }
   this.api.gfx.showContainer(false);
   this.nLastMapIdReceived = _global.parseInt(_loc5_,10);
   var _loc4_;
   if(_loc3_.length > 3)
   {
      _loc4_ = new Object();
      _loc4_.id = _loc5_;
      _loc4_.date = _loc6_;
      _loc4_.width = Number(_loc3_[3]);
      _loc4_.height = Number(_loc3_[4]);
      _loc4_.backgroundNum = Number(_loc3_[5]);
      _loc4_.musicId = Number(_loc3_[6]);
      _loc4_.ambianceId = Number(_loc3_[7]);
      _loc4_.bOutdoor = _loc3_[8];
      _loc4_.capabilities = Number(_loc3_[9]);
      _loc4_.mapData = _loc3_[10];
      if(_loc3_[11] == undefined || _loc3_[11] != "1")
      {
         _loc4_;
      }
   }
   this.api.kernel.MapsServersManager.parseMap2(_loc5_,_loc6_,_loc4_);
};
_loc1.onMapLoaded = function()
{
   this.api.gfx.showContainer(true);
   this.api.kernel.GameManager.applyCreatureMode();
   if(dofus["\x12\x03"].SAVING_THE_WORLD)
   {
      dofus["\x1e\x14\x10"].getInstance().nextAction();
   }
   if(_global.COLOR_TRIGGER != undefined)
   {
      this.api.ui.getUIComponent("Triggers").activar();
   }
   else if(_global.COLOR_POS_PELEA != undefined)
   {
      this.api.ui.getUIComponent("PosPelea").activar();
   }
};
_loc1.onMovement = function(sExtraData, bIsSummoned)
{
   var _loc87_ = sExtraData.split("|");
   var _loc55_ = 0;
   var _loc46_;
   var _loc56_;
   var _loc37_;
   var _loc57_;
   var _loc3_;
   var _loc24_;
   var _loc27_;
   var _loc66_;
   var _loc72_;
   var _loc85_;
   var _loc7_;
   var _loc76_;
   var _loc15_;
   var _loc68_;
   var _loc80_;
   var _loc17_;
   var _loc61_;
   var _loc70_;
   var _loc42_;
   var _loc23_;
   var _loc71_;
   var _loc19_;
   var _loc64_;
   var _loc79_;
   var _loc83_;
   var _loc48_;
   var _loc59_;
   var _loc62_;
   var _loc21_;
   var _loc22_;
   var _loc43_;
   var _loc50_;
   var _loc12_;
   var _loc9_;
   var _loc5_;
   var _loc20_;
   var _loc60_;
   var _loc33_;
   var _loc73_;
   var _loc8_;
   var _loc30_;
   var _loc13_;
   var _loc31_;
   var _loc32_;
   var _loc14_;
   var _loc11_;
   var _loc10_;
   var _loc6_;
   var _loc69_;
   var _loc25_;
   var _loc26_;
   var _loc4_;
   var _loc74_;
   var _loc38_;
   var _loc65_;
   var _loc41_;
   var _loc49_;
   var _loc52_;
   var _loc54_;
   var _loc63_;
   var _loc44_;
   var _loc75_;
   var _loc51_;
   var _loc39_;
   var _loc40_;
   var _loc47_;
   var _loc67_;
   var _loc86_;
   var _loc36_;
   var _loc77_;
   var _loc78_;
   var _loc84_;
   var _loc58_;
   var _loc45_;
   var _loc34_;
   var _loc53_;
   var _loc35_;
   var _loc16_;
   var _loc28_;
   var _loc18_;
   var _loc29_;
   var _loc81_;
   var _loc82_;
   for(; _loc55_ < _loc87_.length; _loc55_ = _loc55_ + 1)
   {
      _loc46_ = _loc87_[_loc55_];
      if(_loc46_.length != 0)
      {
         _loc56_ = false;
         _loc37_ = false;
         _loc57_ = _loc46_.charAt(0);
         if(_loc57_ == "+")
         {
            _loc37_ = true;
         }
         else if(_loc57_ == "~")
         {
            _loc37_ = true;
            _loc56_ = true;
         }
         else if(_loc57_ != "-")
         {
            continue;
         }
         if(_loc37_)
         {
            _loc3_ = _loc46_.substr(1).split(";");
            _loc24_ = _loc3_[0];
            _loc27_ = _loc3_[1];
            _loc66_ = _loc3_[2].split("^");
            _loc72_ = Number(_loc66_[0]);
            _loc85_ = _loc66_[1] == "1";
            _loc7_ = _loc3_[3];
            _loc76_ = _loc3_[4].split("^");
            _loc15_ = _loc76_[0];
            _loc68_ = _loc76_[1];
            _loc80_ = _loc3_[5];
            _loc17_ = _loc3_[6];
            _loc61_ = false;
            _loc70_ = true;
            if(_loc17_.charAt(_loc17_.length - 1) == "*")
            {
               _loc17_ = _loc17_.substr(0,_loc17_.length - 1);
               _loc61_ = true;
            }
            if(_loc17_.charAt(0) == "*")
            {
               _loc70_ = false;
               _loc17_ = _loc17_.substr(1);
            }
            _loc42_ = _loc17_.split("^");
            _loc23_ = _loc42_.length != 2 ? _loc17_ : _loc42_[0];
            _loc71_ = _loc80_.split(",");
            _loc19_ = _loc71_[0];
            _loc64_ = _loc71_[1];
            if(_loc64_.length)
            {
               _loc48_ = _loc64_.split("~");
               if(_loc48_[0].length > 0)
               {
                  _loc59_ = _loc48_[0].split("*");
                  _loc79_ = new dofus.datacenter["\x1e\x0b\x03"](_global.parseInt(_loc59_[0]),_loc59_[1],_loc59_[2]);
               }
               if(_loc48_[1].length > 0)
               {
                  _loc62_ = _loc48_[1].split("*");
                  _loc83_ = new dofus.datacenter["\x1e\x0b\x03"](-1,_loc62_[0],_loc62_[1]);
               }
            }
            _loc21_ = 100;
            _loc22_ = 100;
            if(_loc42_.length == 2)
            {
               _loc43_ = _loc42_[1];
               if(_global.isNaN(Number(_loc43_)))
               {
                  _loc50_ = _loc43_.split("x");
                  _loc21_ = _loc50_.length != 2 ? 100 : Number(_loc50_[0]);
                  _loc22_ = _loc50_.length != 2 ? 100 : Number(_loc50_[1]);
               }
               else
               {
                  _loc22_ = Number(_loc43_);
                  _loc21_ = Number(_loc43_);
               }
            }
            if(_loc56_)
            {
               _loc12_ = this.api.datacenter.Sprites.getItemAt(_loc7_);
               this.onSpriteMovement(false,_loc12_);
            }
            loop3:
            switch(_loc19_)
            {
               case "-1":
               case "-2":
                  _loc9_ = new Object();
                  _loc9_.spriteType = _loc19_;
                  _loc9_.gfxID = _loc23_;
                  _loc9_.scaleX = _loc21_;
                  _loc9_.scaleY = _loc22_;
                  _loc9_.noFlip = _loc61_;
                  _loc9_.cell = _loc24_;
                  _loc9_.dir = _loc27_;
                  _loc9_.powerLevel = _loc3_[7];
                  _loc9_.color1 = _loc3_[8];
                  _loc9_.color2 = _loc3_[9];
                  _loc9_.color3 = _loc3_[10];
                  _loc9_.accessories = _loc3_[11];
                  if(this.api.datacenter.Game.isFight)
                  {
                     _loc9_.LP = _loc3_[12];
                     _loc9_.AP = _loc3_[13];
                     _loc9_.MP = _loc3_[14];
                     if(_loc3_.length > 18)
                     {
                        _loc9_.resistances = new Array(Number(_loc3_[15]),Number(_loc3_[16]),Number(_loc3_[17]),Number(_loc3_[18]),Number(_loc3_[19]),Number(_loc3_[20]),Number(_loc3_[21]));
                        _loc9_.team = _loc3_[22];
                     }
                     else
                     {
                        _loc9_.team = _loc3_[15];
                     }
                     _loc9_.summoned = bIsSummoned;
                  }
                  if(_loc19_ == -1)
                  {
                     _loc12_ = this.api.kernel.CharactersManager.createCreature(_loc7_,_loc15_,_loc9_);
                  }
                  else
                  {
                     _loc12_ = this.api.kernel.CharactersManager.createMonster(_loc7_,_loc15_,_loc9_);
                  }
                  break;
               case "-3":
                  _loc5_ = new Object();
                  _loc5_.spriteType = _loc19_;
                  _loc5_.level = _loc3_[7];
                  _loc5_.scaleX = _loc21_;
                  _loc5_.scaleY = _loc22_;
                  _loc5_.noFlip = _loc61_;
                  _loc5_.cell = Number(_loc24_);
                  _loc5_.dir = _loc27_;
                  _loc5_.totalExp = _loc3_[8];
                  _loc20_ = _loc3_[9].split(",");
                  _loc5_.color1 = _loc20_[0];
                  _loc5_.color2 = _loc20_[1];
                  _loc5_.color3 = _loc20_[2];
                  _loc5_.accessories = _loc3_[10];
                  _loc5_.bonusValue = _loc72_;
                  _loc60_ = this.sliptGfxData(_loc17_);
                  _loc33_ = _loc60_.gfx;
                  this.splitGfxForScale(_loc33_[0],_loc5_);
                  _loc12_ = this.api.kernel.CharactersManager.createMonsterGroup(_loc7_,_loc15_,_loc5_);
                  _loc12_.isClear = false;
                  if(this.api.kernel.OptionsManager.getOption("ViewAllMonsterInGroup") == true)
                  {
                     _loc73_ = _loc7_;
                     _loc8_ = 1;
                     while(_loc8_ < _loc33_.length)
                     {
                        if(_loc33_[_loc8_] != "")
                        {
                           this.splitGfxForScale(_loc33_[_loc8_],_loc5_);
                           _loc20_ = _loc3_[9 + 2 * _loc8_].split(",");
                           _loc5_.color1 = _loc20_[0];
                           _loc5_.color2 = _loc20_[1];
                           _loc5_.color3 = _loc20_[2];
                           _loc5_.dir = random(4) * 2 + 1;
                           _loc5_.accessories = _loc3_[10 + 2 * _loc8_];
                           _loc30_ = _loc7_ + "_" + _loc8_;
                           _loc13_ = this.api.kernel.CharactersManager.createMonsterGroup(_loc30_,undefined,_loc5_);
                           _loc13_.isClear = false;
                           _loc31_ = _loc73_;
                           if(random(3) != 0 && _loc8_ != 1)
                           {
                              _loc31_ = _loc7_ + "_" + (random(_loc8_ - 1) + 1);
                           }
                           _loc32_ = random(8);
                           this.api.gfx.addLinkedSprite(_loc30_,_loc31_,_loc32_,_loc13_);
                           if(!_global.isNaN(_loc13_.scaleX))
                           {
                              this.api.gfx.setSpriteScale(_loc13_.id,_loc13_.scaleX,_loc13_.scaleY);
                           }
                           switch(_loc60_.shape)
                           {
                              case "circle":
                                 _loc32_ = _loc8_;
                                 break;
                              case "line":
                                 _loc31_ = _loc30_;
                                 _loc32_ = 2;
                           }
                        }
                        _loc8_ = _loc8_ + 1;
                     }
                  }
                  break;
               case "-4":
                  _loc14_ = new Object();
                  _loc14_.spriteType = _loc19_;
                  _loc14_.gfxID = _loc23_;
                  _loc14_.scaleX = _loc21_;
                  _loc14_.scaleY = _loc22_;
                  _loc14_.cell = _loc24_;
                  _loc14_.dir = _loc27_;
                  _loc14_.sex = _loc3_[7];
                  _loc14_.color1 = _loc3_[8];
                  _loc14_.color2 = _loc3_[9];
                  _loc14_.color3 = _loc3_[10];
                  _loc14_.accessories = _loc3_[11];
                  _loc14_.extraClipID = !(_loc3_[12] != undefined && !_global.isNaN(Number(_loc3_[12]))) ? -1 : Number(_loc3_[12]);
                  _loc14_.customArtwork = Number(_loc3_[13]);
                  _loc12_ = this.api.kernel.CharactersManager.createNonPlayableCharacter(_loc7_,Number(_loc15_),_loc14_);
                  break;
               case "-5":
                  _loc11_ = new Object();
                  _loc11_.spriteType = _loc19_;
                  _loc11_.gfxID = _loc23_;
                  _loc11_.scaleX = _loc21_;
                  _loc11_.scaleY = _loc22_;
                  _loc11_.cell = _loc24_;
                  _loc11_.dir = _loc27_;
                  _loc11_.color1 = _loc3_[7];
                  _loc11_.color2 = _loc3_[8];
                  _loc11_.color3 = _loc3_[9];
                  _loc11_.accessories = _loc3_[10];
                  _loc11_.guildName = _loc3_[11];
                  _loc11_.emblem = _loc3_[12];
                  _loc11_.offlineType = _loc3_[13];
                  _loc11_.colorNombre = _loc68_;
                  _loc12_ = this.api.kernel.CharactersManager.createOfflineCharacter(_loc7_,_loc15_,_loc11_);
                  break;
               case "-6":
                  _loc10_ = new Object();
                  _loc10_.spriteType = _loc19_;
                  _loc10_.gfxID = _loc23_;
                  _loc10_.scaleX = _loc21_;
                  _loc10_.scaleY = _loc22_;
                  _loc10_.cell = _loc24_;
                  _loc10_.dir = _loc27_;
                  _loc10_.level = _loc3_[7];
                  if(this.api.datacenter.Game.isFight)
                  {
                     _loc10_.LP = _loc3_[8];
                     _loc10_.AP = _loc3_[9];
                     _loc10_.MP = _loc3_[10];
                     _loc10_.resistances = new Array(Number(_loc3_[11]),Number(_loc3_[12]),Number(_loc3_[13]),Number(_loc3_[14]),Number(_loc3_[15]),Number(_loc3_[16]),Number(_loc3_[17]));
                     _loc10_.team = _loc3_[18];
                     _loc10_.Huida = _loc3_[19];
                     _loc10_.Placaje = _loc3_[20];
                  }
                  else
                  {
                     _loc10_.guildName = _loc3_[8];
                     _loc10_.emblem = _loc3_[9];
                  }
                  _loc12_ = this.api.kernel.CharactersManager.createTaxCollector(_loc7_,_loc15_,_loc10_);
                  break;
               case "-7":
               case "-8":
                  _loc6_ = new Object();
                  _loc6_.spriteType = _loc19_;
                  _loc6_.gfxID = _loc23_;
                  _loc6_.scaleX = _loc21_;
                  _loc6_.scaleY = _loc22_;
                  _loc6_.cell = _loc24_;
                  _loc6_.dir = _loc27_;
                  _loc6_.sex = _loc3_[7];
                  _loc6_.powerLevel = _loc3_[8];
                  _loc6_.accessories = _loc3_[9];
                  if(this.api.datacenter.Game.isFight)
                  {
                     _loc6_.LP = _loc3_[10];
                     _loc6_.AP = _loc3_[11];
                     _loc6_.MP = _loc3_[12];
                     _loc6_.team = _loc3_[20];
                     _loc6_.Huida = _loc3_[21];
                     _loc6_.Placaje = _loc3_[22];
                  }
                  else
                  {
                     _loc6_.emote = _loc3_[10];
                     _loc6_.emoteTimer = _loc3_[11];
                     _loc6_.restrictions = Number(_loc3_[12]);
                  }
                  if(_loc19_ == "-8")
                  {
                     _loc6_.showIsPlayer = true;
                     _loc69_ = _loc15_.split("~");
                     _loc6_.monsterID = _loc69_[0];
                     _loc6_.playerName = _loc69_[1];
                  }
                  else
                  {
                     _loc6_.showIsPlayer = false;
                     _loc6_.monsterID = _loc15_;
                  }
                  _loc12_ = this.api.kernel.CharactersManager.createMutant(_loc7_,_loc6_);
                  break;
               case "-9":
                  _loc25_ = new Object();
                  _loc25_.spriteType = _loc19_;
                  _loc25_.gfxID = _loc23_;
                  _loc25_.scaleX = _loc21_;
                  _loc25_.scaleY = _loc22_;
                  _loc25_.cell = _loc24_;
                  _loc25_.dir = _loc27_;
                  _loc25_.ownerName = _loc3_[7];
                  _loc25_.level = _loc3_[8];
                  _loc25_.modelID = _loc3_[9];
                  _loc12_ = this.api.kernel.CharactersManager.createParkMount(_loc7_,_loc15_ == "" ? this.api.lang.getText("NO_NAME") : _loc15_,_loc25_);
                  break;
               case "-10":
                  _loc26_ = new Object();
                  _loc26_.spriteType = _loc19_;
                  _loc26_.gfxID = _loc23_;
                  _loc26_.scaleX = _loc21_;
                  _loc26_.scaleY = _loc22_;
                  _loc26_.cell = _loc24_;
                  _loc26_.dir = _loc27_;
                  _loc26_.level = _loc3_[7];
                  _loc26_.alignment = new dofus.datacenter["\x1e\f"](Number(_loc3_[9]),Number(_loc3_[8]));
                  _loc12_ = this.api.kernel.CharactersManager.createPrism(_loc7_,_loc15_,_loc26_);
                  break;
               default:
                  _loc4_ = new Object();
                  _loc4_.spriteType = _loc19_;
                  _loc4_.cell = _loc24_;
                  _loc4_.scaleX = _loc21_;
                  _loc4_.scaleY = _loc22_;
                  _loc4_.dir = _loc27_;
                  _loc4_.sex = _loc3_[7];
                  _loc4_.colorNombre = _loc68_;
                  _loc4_.esAbonado = _loc85_;
                  if(this.api.datacenter.Game.isFight)
                  {
                     _loc4_.level = _loc3_[8];
                     _loc74_ = _loc3_[9];
                     _loc4_.color1 = _loc3_[10];
                     _loc4_.color2 = _loc3_[11];
                     _loc4_.color3 = _loc3_[12];
                     _loc4_.accessories = _loc3_[13];
                     _loc4_.LP = _loc3_[14];
                     _loc4_.AP = _loc3_[15];
                     _loc4_.MP = _loc3_[16];
                     _loc4_.resistances = new Array(Number(_loc3_[17]),Number(_loc3_[18]),Number(_loc3_[19]),Number(_loc3_[20]),Number(_loc3_[21]),Number(_loc3_[22]),Number(_loc3_[23]));
                     _loc4_.team = _loc3_[24];
                     if(_loc3_[25].indexOf(",") != -1)
                     {
                        _loc38_ = _loc3_[25].split(",");
                        _loc65_ = Number(_loc38_[0]);
                        _loc41_ = _global.parseInt(_loc38_[1],16);
                        _loc49_ = _global.parseInt(_loc38_[2],16);
                        _loc52_ = _global.parseInt(_loc38_[3],16);
                        if(_loc41_ == -1 || _global.isNaN(_loc41_))
                        {
                           _loc41_ = this.api.datacenter.Player.color1;
                        }
                        if(_loc49_ == -1 || _global.isNaN(_loc49_))
                        {
                           _loc49_ = this.api.datacenter.Player.color2;
                        }
                        if(_loc52_ == -1 || _global.isNaN(_loc52_))
                        {
                           _loc52_ = this.api.datacenter.Player.color3;
                        }
                        if(!_global.isNaN(_loc65_))
                        {
                           _loc54_ = new dofus.datacenter.Mount(_loc65_,Number(_loc23_));
                           _loc54_.customColor1 = _loc41_;
                           _loc54_.customColor2 = _loc49_;
                           _loc54_.customColor3 = _loc52_;
                           _loc4_.mount = _loc54_;
                        }
                     }
                     else
                     {
                        _loc63_ = Number(_loc3_[25]);
                        if(!_global.isNaN(_loc63_))
                        {
                           _loc4_.mount = new dofus.datacenter.Mount(_loc63_,Number(_loc23_));
                        }
                     }
                     _loc4_.agilidad = Number(0);
                     _loc4_.Huida = _loc3_[26];
                     _loc4_.Placaje = _loc3_[27];
                     _loc4_.resets = !_global.isNaN(Number(_loc3_[28])) ? Number(_loc3_[28]) : 0;
                     _loc4_.omega = Number(_loc3_[30]);
                     _loc4_.subclase = Number(_loc3_[31]);
                  }
                  else
                  {
                     _loc74_ = _loc3_[8];
                     _loc4_.ornamento = _loc72_;
                     _loc4_.color1 = _loc3_[9];
                     _loc4_.color2 = _loc3_[10];
                     _loc4_.color3 = _loc3_[11];
                     _loc4_.accessories = _loc3_[12];
                     _loc4_.aura = _loc3_[13];
                     _loc4_.emote = _loc3_[14];
                     _loc4_.emoteTimer = _loc3_[15];
                     _loc4_.guildName = _loc3_[16];
                     _loc4_.emblem = _loc3_[17];
                     _loc4_.restrictions = _loc3_[18];
                     if(_loc3_[19].indexOf(",") != -1)
                     {
                        _loc44_ = _loc3_[19].split(",");
                        _loc75_ = Number(_loc44_[0]);
                        _loc51_ = _global.parseInt(_loc44_[1],16);
                        _loc39_ = _global.parseInt(_loc44_[2],16);
                        _loc40_ = _global.parseInt(_loc44_[3],16);
                        if(_loc51_ == -1 || _global.isNaN(_loc51_))
                        {
                           _loc51_ = this.api.datacenter.Player.color1;
                        }
                        if(_loc39_ == -1 || _global.isNaN(_loc39_))
                        {
                           _loc39_ = this.api.datacenter.Player.color2;
                        }
                        if(_loc40_ == -1 || _global.isNaN(_loc40_))
                        {
                           _loc40_ = this.api.datacenter.Player.color3;
                        }
                        if(!_global.isNaN(_loc75_))
                        {
                           _loc47_ = new dofus.datacenter.Mount(_loc75_,Number(_loc23_));
                           _loc47_.customColor1 = _loc51_;
                           _loc47_.customColor2 = _loc39_;
                           _loc47_.customColor3 = _loc40_;
                           _loc4_.mount = _loc47_;
                        }
                     }
                     else
                     {
                        _loc67_ = Number(_loc3_[19]);
                        if(!_global.isNaN(_loc67_))
                        {
                           _loc4_.mount = new dofus.datacenter.Mount(_loc67_,Number(_loc23_));
                        }
                     }
                     _loc4_.agilidad = !_global.isNaN(Number(_loc3_[20])) ? Number(_loc3_[20]) : 0;
                     _loc4_.resets = !_global.isNaN(Number(_loc3_[21])) ? Number(_loc3_[21]) : 0;
                     _loc4_.omega = Number(_loc3_[23]);
                     _loc4_.subclase = Number(_loc3_[24]);
                  }
                  if(_loc56_)
                  {
                     _loc86_ = [_loc7_,this.createTransitionEffect(),_loc24_,10];
                  }
                  _loc36_ = _loc74_.split(",");
                  _loc4_.alignment = new dofus.datacenter["\x1e\f"](Number(_loc36_[0]),Number(_loc36_[1]));
                  _loc4_.rank = new dofus.datacenter.Rank(Number(_loc36_[2]));
                  _loc4_.alignment.fallenAngelDemon = _loc36_[4] == 1;
                  if(_loc36_.length > 3 && _loc7_ != this.api.datacenter.Player.ID)
                  {
                     if(this.api.lang.getAlignmentCanViewPvpGain(this.api.datacenter.Player.alignment.index,Number(_loc4_.alignment.index)))
                     {
                        _loc77_ = Number(_loc36_[3]) - _global.parseInt(_loc7_);
                        _loc78_ = Number(_global.RANGO_NIVEL_PVP);
                        _loc84_ = Number(- _global.RANGO_NIVEL_PVP);
                        _loc58_ = 0;
                        if(this.api.datacenter.Player.Level - _loc77_ > _loc78_)
                        {
                           _loc58_ = -1;
                        }
                        if(this.api.datacenter.Player.Level - _loc77_ < _loc84_)
                        {
                           _loc58_ = 1;
                        }
                        _loc4_.pvpGain = _loc58_;
                     }
                  }
                  if(!this.api.datacenter.Game.isFight && (_global.parseInt(_loc7_,10) != this.api.datacenter.Player.ID && ((this.api.datacenter.Player.alignment.index == 1 || this.api.datacenter.Player.alignment.index == 2) && ((_loc4_.alignment.index == 1 || _loc4_.alignment.index == 2) && (_loc4_.alignment.index != this.api.datacenter.Player.alignment.index && (_loc4_.rank.value && this.api.datacenter.Map.bCanAttack))))))
                  {
                     if(this.api.datacenter.Player.rank.value > _loc4_.rank.value)
                     {
                        this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_NEW_ENEMY_WEAK);
                     }
                     if(this.api.datacenter.Player.rank.value < _loc4_.rank.value)
                     {
                        this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\x07"].SpeakingItemsManager.SPEAK_TRIGGER_NEW_ENEMY_STRONG);
                     }
                  }
                  _loc45_ = this.sliptGfxData(_loc17_);
                  _loc34_ = _loc45_.gfx;
                  this.splitGfxForScale(_loc34_[0],_loc4_);
                  _loc4_.title = _loc79_;
                  _loc4_.title2 = _loc83_;
                  _loc12_ = this.api.kernel.CharactersManager.createCharacter(_loc7_,_loc15_,_loc4_);
                  _loc12_.isClear = false;
                  _loc12_.allowGhostMode = _loc70_;
                  _loc53_ = _loc7_;
                  _loc35_ = _loc45_.shape != "circle" ? 2 : 0;
                  _loc16_ = 0;
                  while(true)
                  {
                     _loc16_ = _loc16_ + 1;
                     if(_loc16_ >= _loc34_.length)
                     {
                        break loop3;
                     }
                     if(_loc34_[_loc16_] != "")
                     {
                        _loc28_ = _loc7_ + "_" + _loc16_;
                        _loc18_ = new Object();
                        this.splitGfxForScale(_loc34_[_loc16_],_loc18_);
                        _loc29_ = new ank.battlefield.datacenter["\x1e\x0e\x12"](_loc28_,ank.battlefield.mc["\x1e\x0e\x12"],dofus["\x12\x03"].CLIPS_PERSOS_PATH + _loc18_.gfxID + ".swf");
                        _loc29_.allDirections = false;
                        this.api.gfx.addLinkedSprite(_loc28_,_loc53_,_loc35_,_loc29_);
                        if(!_global.isNaN(_loc18_.scaleX))
                        {
                           this.api.gfx.setSpriteScale(_loc29_.id,_loc18_.scaleX,_loc18_.scaleY);
                        }
                        switch(_loc45_.shape)
                        {
                           case "circle":
                              _loc35_ = _loc16_;
                              break;
                           case "line":
                              _loc53_ = _loc28_;
                              _loc35_ = 2;
                        }
                     }
                  }
            }
            this.onSpriteMovement(_loc37_,_loc12_,_loc86_);
         }
         else
         {
            _loc81_ = _loc46_.substr(1);
            _loc82_ = this.api.datacenter.Sprites.getItemAt(_loc81_);
            this.onSpriteMovement(_loc37_,_loc82_);
         }
      }
   }
};
_loc1.onFrameObject2 = function(sExtraData)
{
   var _loc9_ = sExtraData.split("|");
   var _loc3_ = 0;
   var _loc2_;
   var _loc4_;
   var _loc8_;
   var _loc6_;
   var _loc7_;
   var _loc5_;
   while(_loc3_ < _loc9_.length)
   {
      _loc2_ = _loc9_[_loc3_].split(";");
      _loc4_ = Number(_loc2_[0]);
      _loc8_ = _loc2_[1];
      _loc6_ = _loc2_[2] != undefined;
      _loc7_ = _loc2_[2] == "1" ? true : false;
      _loc5_ = _loc2_[3];
      if(_loc6_)
      {
         this.api.gfx.setObject2Interactive(_loc4_,_loc7_,2,_loc5_);
      }
      this.api.gfx.setObject2Frame(_loc4_,_loc8_);
      _loc3_ += 1;
   }
};
