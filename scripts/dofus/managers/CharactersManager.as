var _loc1 = _global.dofus["\x0b\x07"].CharactersManager.prototype;
_loc1.createCharacter = function(sID, sName, oData)
{
   var _loc4_ = this.api.datacenter.Sprites.getItemAt(sID);
   if(_loc4_ == undefined)
   {
      _loc4_ = new dofus.datacenter["\x13\x01"](sID,ank.battlefield.mc["\x1e\x0e\x12"],dofus["\x12\x03"].CLIPS_PERSOS_PATH + oData.gfxID + ".swf",oData.cell,oData.dir,oData.gfxID,oData.title,oData.title2,oData.ornamento);
      this.api.datacenter.Sprites.addItemAt(sID,_loc4_);
   }
   _loc4_.GameActionsManager.init();
   _loc4_.cellNum = Number(oData.cell);
   _loc4_.scaleX = oData.scaleX;
   _loc4_.scaleY = oData.scaleY;
   _loc4_.name = sName;
   _loc4_.Guild = Number(oData.spriteType);
   _loc4_.Level = Number(oData.level);
   _loc4_.esOmega = Number(oData.esomega);
   _loc4_.Sex = oData.sex == undefined ? 1 : oData.sex;
   _loc4_.color1 = oData.color1 != -1 ? Number("0x" + oData.color1) : oData.color1;
   _loc4_.color2 = oData.color2 != -1 ? Number("0x" + oData.color2) : oData.color2;
   _loc4_.color3 = oData.color3 != -1 ? Number("0x" + oData.color3) : oData.color3;
   _loc4_.Aura = oData.aura == undefined ? 0 : oData.aura;
   _loc4_.Merchant = oData.merchant != "1" ? false : true;
   _loc4_.serverID = Number(oData.serverID);
   _loc4_.alignment = oData.alignment;
   _loc4_.rank = oData.rank;
   _loc4_.mount = oData.mount;
   _loc4_.isDead = oData.isDead == 1;
   _loc4_.deathState = Number(oData.isDead);
   _loc4_.deathCount = Number(oData.deathCount);
   _loc4_.lvlMax = Number(oData.lvlMax);
   _loc4_.pvpGain = Number(oData.pvpGain);
   _loc4_.colorNombre = Number(oData.colorNombre);
   _loc4_.esAbonado = oData.esAbonado;
   this.setSpriteAccessories(_loc4_,oData.accessories);
   if(oData.LP != undefined)
   {
      _loc4_.LP = oData.LP;
   }
   if(oData.LP != undefined)
   {
      _loc4_.LP = oData.LP;
   }
   if(oData.LP != undefined)
   {
      _loc4_.LPmax = oData.LP;
   }
   if(oData.AP != undefined)
   {
      _loc4_.AP = oData.AP;
   }
   if(oData.AP != undefined)
   {
      _loc4_.APinit = oData.AP;
   }
   if(oData.MP != undefined)
   {
      _loc4_.MP = oData.MP;
   }
   if(oData.MP != undefined)
   {
      _loc4_.MPinit = oData.MP;
   }
   if(oData.resistances != undefined)
   {
      _loc4_.resistances = oData.resistances;
   }
   _loc4_.Team = oData.team != undefined ? oData.team : null;
   if(oData.emote != undefined && oData.emote.length != 0)
   {
      _loc4_.direction = ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].convertHeightToFourDirection(oData.dir);
      if(oData.emoteTimer != undefined && oData.emote.length != 0)
      {
         _loc4_.startAnimationTimer = oData.emoteTimer;
      }
      _loc4_.startAnimation = "EmoteStatic" + oData.emote;
   }
   if(oData.guildName != undefined)
   {
      _loc4_.guildName = oData.guildName;
   }
   _loc4_.emblem = this.createGuildEmblem(oData.emblem);
   if(oData.restrictions != undefined)
   {
      _loc4_.restrictions = _global.parseInt(oData.restrictions,36);
   }
   if(sID == this.api.datacenter.Player.ID)
   {
      if(!this.api.datacenter.Player.haveFakeAlignment)
      {
         this.api.datacenter.Player.alignment = _loc4_.alignment.clone();
      }
   }
   _loc4_.agilidad = oData.agilidad;
   _loc4_.resets = oData.resets;
   _loc4_.Omega = oData.omega;
   _loc4_.subclase = oData.subclase;
   return _loc4_;
};
_loc1.createMonster = function(sID, _loc3_, _loc4_)
{
   var _loc3_ = this.api.datacenter.Sprites.getItemAt(sID);
   if(_loc3_ == undefined)
   {
      _loc3_ = new dofus.datacenter["\n\x01"](sID,ank.battlefield.mc["\x1e\x0e\x12"],dofus["\x12\x03"].CLIPS_PERSOS_PATH + _loc4_.gfxID + ".swf",_loc4_.cell,_loc4_.dir,_loc4_.gfxID);
      this.api.datacenter.Sprites.addItemAt(sID,_loc3_);
   }
   _loc3_.GameActionsManager.init();
   _loc3_.cellNum = _loc4_.cell;
   _loc3_.name = _loc3_;
   _loc3_.scaleX = _loc4_.scaleX;
   _loc3_.scaleY = _loc4_.scaleY;
   _loc3_.noFlip = _loc4_.noFlip;
   _loc3_.powerLevel = _loc4_.powerLevel;
   _loc3_.color1 = _loc4_.color1 == -1 ? _loc4_.color1 : Number("0x" + _loc4_.color1);
   _loc3_.color2 = _loc4_.color2 == -1 ? _loc4_.color2 : Number("0x" + _loc4_.color2);
   _loc3_.color3 = _loc4_.color3 == -1 ? _loc4_.color3 : Number("0x" + _loc4_.color3);
   this.setSpriteAccessories(_loc3_,_loc4_.accessories);
   if(_loc4_.LP != undefined)
   {
      _loc3_.LP = _loc4_.LP;
   }
   if(_loc4_.LP != undefined)
   {
      _loc3_.LPmax = _loc4_.LP;
   }
   if(_loc4_.AP != undefined)
   {
      _loc3_.AP = _loc4_.AP;
   }
   if(_loc4_.AP != undefined)
   {
      _loc3_.APinit = _loc4_.AP;
   }
   if(_loc4_.MP != undefined)
   {
      _loc3_.MP = _loc4_.MP;
   }
   if(_loc4_.MP != undefined)
   {
      _loc3_.MPinit = _loc4_.MP;
   }
   if(_loc4_.resistances != undefined)
   {
      _loc3_.resistances = _loc4_.resistances;
   }
   if(_loc4_.summoned != undefined)
   {
      _loc3_.isSummoned = _loc4_.summoned;
   }
   _loc3_.Team = _loc4_.team == undefined ? null : _loc4_.team;
   return _loc3_;
};
_loc1.setLocalPlayerDataLeader = function(_loc2_, _loc3_, _loc4_)
{
   var _loc5_ = this.api.datacenter.Player;
   _loc5_.Inventory.removeAll(true);
   _loc5_.ID = _loc2_;
   _loc5_.Name = _loc3_;
   _loc5_.Guild = _loc4_.guild;
   _loc5_.Level = _loc4_.level;
   _loc5_.Sex = _loc4_.sex;
   _loc5_.color1 = _loc4_.color1 == -1 ? _loc4_.color1 : Number("0x" + _loc4_.color1);
   _loc5_.color2 = _loc4_.color2 == -1 ? _loc4_.color2 : Number("0x" + _loc4_.color2);
   _loc5_.color3 = _loc4_.color3 == -1 ? _loc4_.color3 : Number("0x" + _loc4_.color3);
   var _loc6_ = _loc4_.items.split(";");
   var _loc2_ = 0;
   var _loc4_;
   var _loc3_;
   while(_loc2_ < _loc6_.length)
   {
      _loc4_ = _loc6_[_loc2_];
      if(_loc4_.length != 0)
      {
         _loc3_ = this.getItemObjectFromData(_loc4_);
         if(_loc3_ != undefined)
         {
            _loc5_.addItem(_loc3_);
         }
      }
      _loc2_ += 1;
   }
   _loc5_.updateCloseCombat();
   _loc5_.Inventory.doDispatchEvent({type:"modelChanged",eventName:"updateAll"});
};
_loc1.createMonsterGroup = function(sID, sName, oData)
{
   var _loc3_ = this.api.datacenter.Sprites.getItemAt(sID);
   if(_loc3_ == undefined)
   {
      _loc3_ = new dofus.datacenter["\t\x1d"](sID,ank.battlefield.mc["\x1e\x0e\x12"],dofus["\x12\x03"].CLIPS_PERSOS_PATH + oData.gfxID + ".swf",oData.cell,oData.dir,oData.bonusValue);
      this.api.datacenter.Sprites.addItemAt(sID,_loc3_);
   }
   _loc3_.GameActionsManager.init();
   _loc3_.cellNum = oData.cell;
   _loc3_.name = sName;
   _loc3_.Level = oData.level;
   _loc3_.scaleX = oData.scaleX;
   _loc3_.scaleY = oData.scaleY;
   _loc3_.noFlip = oData.noFlip;
   _loc3_.color1 = oData.color1 != -1 ? Number("0x" + oData.color1) : oData.color1;
   _loc3_.color2 = oData.color2 != -1 ? Number("0x" + oData.color2) : oData.color2;
   _loc3_.color3 = oData.color3 != -1 ? Number("0x" + oData.color3) : oData.color3;
   _loc3_.totalExp = oData.totalExp;
   this.setSpriteAccessories(_loc3_,oData.accessories);
   return _loc3_;
};
_loc1.getItemObjectFromData = function(sData)
{
   if(sData.length == 0)
   {
      return null;
   }
   var _loc3_ = sData.split("~");
   var _loc7_ = _global.parseInt(_loc3_[0],16);
   var _loc6_ = _global.parseInt(_loc3_[1],16);
   var _loc9_ = _global.parseInt(_loc3_[2],16);
   var _loc8_ = _loc3_[3].length == 0 ? -1 : _global.parseInt(_loc3_[3],16);
   var _loc5_ = _loc3_[4];
   var _loc10_ = _global.parseInt(_loc3_[5],16);
   var _loc4_ = new dofus.datacenter["\f\x0b"](_loc7_,_loc6_,_loc9_,_loc8_,_loc5_,undefined,undefined,undefined,_loc10_);
   _loc4_.priceMultiplicator = this.api.lang.getConfigText("SELL_PRICE_MULTIPLICATOR");
   return _loc4_;
};
