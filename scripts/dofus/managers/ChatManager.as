var _loc1 = dofus["\x0b\x07"].ChatManager.prototype;
_loc1.addToBlacklist = function(sName, nClass)
{
   if(sName != this.api.datacenter.Player.Name && !this.isBlacklisted(sName))
   {
      this._aBlacklist.push({sName:sName,nClass:nClass});
      this.api.network.send("BYO+" + sName);
   }
};
_loc1.removeToBlacklist = function(sName)
{
   for(var _loc3_ in this._aBlacklist)
   {
      if(sName == this._aBlacklist[_loc3_].sName || sName == "*" + this._aBlacklist[_loc3_].sName)
      {
         this._aBlacklist[_loc3_] = undefined;
         this.api.ui.getUIComponent("Friends").updateIgnoreList();
         this.api.kernel.showMessage(undefined,this.api.lang.getText("TEMPORARY_NOMORE_BLACKLISTED",[sName]),"INFO_CHAT");
         this.api.network.send("BYO-" + sName);
         return undefined;
      }
   }
};
loc1.isTypeVisible = function(nType)
{
   return this._aVisibleTypes[nType];
};
_loc1.setTypeVisible = function(nType, bVisible)
{
   if(nType == dofus["\x0b\x07"].ChatManager.TYPE_ABO)
   {
      bVisible = true;
   }
   this._aVisibleTypes[nType] = bVisible;
   this.refresh(true);
};
_loc1.parseInlineItems = function(sMessage, aItems)
{
   var _loc2_ = -2;
   var _loc3_;
   var _loc8_;
   var _loc10_;
   var _loc9_;
   var _loc11_;
   var _loc4_;
   var _loc12_;
   var _loc5_;
   var _loc6_;
   while(true)
   {
      _loc2_ += 2;
      if(_loc2_ >= aItems.length)
      {
         break;
      }
      _loc3_ = aItems[_loc2_].split(";");
      _loc8_ = Number(_loc3_[0]);
      _loc10_ = Number(_loc3_[1]);
      _loc9_ = aItems[_loc2_ + 1];
      _loc11_ = new dofus.datacenter["\f\x0b"](_loc10_,_loc8_,1,1,_loc9_,-1);
      _loc4_ = "°" + _loc2_ / 2;
      _loc12_ = this.getLinkItem(_loc11_);
      _loc5_ = sMessage.indexOf(_loc4_);
      if(_loc5_ != -1)
      {
         _loc6_ = sMessage.split("");
         _loc6_.splice(_loc5_,_loc4_.length,_loc12_);
         sMessage = _loc6_.join("");
      }
   }
   return sMessage;
};
_loc1.refresh = function(bForceRefresh)
{
   var _loc7_ = this._aMessages.length;
   var _loc3_ = new String();
   var _loc6_ = 0;
   if(_loc7_ == 0 && !bForceRefresh)
   {
      return undefined;
   }
   var _loc5_ = _loc7_;
   var _loc2_;
   var _loc4_;
   while(true)
   {
      _loc5_ = _loc5_ - 1;
      if(!(_loc6_ < dofus["\x0b\x07"].ChatManager.MAX_VISIBLE && _loc5_ >= 0))
      {
         break;
      }
      _loc2_ = this._aMessages[_loc5_];
      if(this._aVisibleTypes[_loc2_.type] == true)
      {
         _loc6_ = _loc6_ + 1;
         if(!_loc2_.htmlSyntaxChecked)
         {
            _loc4_ = dofus["\x0b\x07"].ChatManager.safeHtml(_loc2_.text);
            _loc2_.lf = !_loc4_.v || _loc2_.lf;
            _loc2_.text = _loc4_.t;
            _loc2_.htmlSyntaxChecked = true;
         }
         if(this.api.kernel.OptionsManager.getOption("TimestampInChat"))
         {
            _loc3_ = (!_loc2_.lf ? "" : "<br/>") + _loc2_.textStyleLeft + _loc2_.timestamp + _loc2_.text + _loc2_.textStyleRight + _loc3_;
            continue;
         }
         _loc3_ = (!_loc2_.lf ? "" : "<br/>") + _loc2_.textStyleLeft + _loc2_.text + _loc2_.textStyleRight + _loc3_;
      }
   }
   this.api.ui.getUIComponent("Banner").setChatText(_loc3_);
};
_global.dofus["\x0b\x07"].ChatManager.safeHtml = function(s)
{
   var _loc16_ = true;
   var _loc17_ = new Array();
   var _loc9_ = new Array();
   var _loc1_ = s;
   var _loc13_ = 0;
   var _loc10_ = 0;
   var _loc8_ = "";
   var _loc5_;
   var _loc4_;
   var _loc2_;
   var _loc6_;
   var _loc7_;
   var _loc3_;
   while(_loc1_.indexOf("<") > -1)
   {
      _loc5_ = _loc1_.indexOf("<");
      if(_loc1_.indexOf(">",_loc5_) == -1)
      {
         _loc1_ = _loc1_.split("<").join("&lt;").split(">").join("&gt;");
         break;
      }
      _loc4_ = _loc1_.indexOf(">",_loc5_) + 1;
      _loc2_ = _loc1_.substring(_loc5_,_loc4_);
      _loc6_ = _loc2_.indexOf("/") == 1;
      _loc7_ = _loc2_.indexOf("/") == _loc2_.length - 2;
      _loc3_ = !_loc6_ ? _loc2_.substring(1,_loc2_.length - 1) : _loc2_.substring(2,_loc2_.length - 1);
      _loc3_ = _loc3_.substring(0,_loc3_.indexOf(" ") <= -1 ? _loc3_.length : _loc3_.indexOf(" "));
      _loc9_[_loc10_++] = {c:_loc6_,b:_loc3_};
      if(_loc7_)
      {
         _loc9_[_loc10_++] = {c:!_loc6_,b:_loc3_};
      }
      _loc8_ += _loc1_.substring(0,_loc4_);
      _loc1_ = _loc1_.substring(_loc4_);
      _loc13_ = _loc13_ + 1;
   }
   _loc8_ += _loc1_;
   return {v:true,t:_loc8_};
};
_loc1.addText = function(sText, sColor, bSound, sUniqId)
{
   if(bSound == undefined)
   {
      bSound = true;
   }
   var _loc7_ = "";
   var _loc4_ = false;
   var _loc2_;
   var _loc3_;
   switch(sColor)
   {
      case dofus["\x12\x03"].MSG_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_MESSAGES;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus["\x12\x03"].EMOTE_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_MESSAGES;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus["\x12\x03"].THINK_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_MESSAGES;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus["\x12\x03"].KOLISEO_CHAT_COLOR:
      case dofus["\x12\x03"].GROUP_CHAT_COLOR:
      case dofus["\x12\x03"].MSGCHUCHOTE_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_WISP;
         _loc4_ = true;
         _loc3_ = true;
         if(bSound)
         {
            this.api.sounds.events.onChatWisper();
         }
         break;
      case dofus["\x12\x03"].ABO_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_ABO;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus["\x12\x03"].INFO_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_INFOS;
         this._nMessageCounterInfo++;
         _loc3_ = false;
         break;
      case dofus["\x12\x03"].ERROR_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_ERRORS;
         _loc3_ = true;
         if(bSound)
         {
            if(this._bFirstErrorCatched)
            {
               this.api.sounds.events.onError();
            }
            else
            {
               this._bFirstErrorCatched = true;
            }
         }
         break;
      case dofus["\x12\x03"].GUILD_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_GUILD;
         _loc4_ = true;
         _loc3_ = true;
         if(bSound && this.api.kernel.OptionsManager.getOption("GuildMessageSound"))
         {
            this.api.sounds.events.onChatWisper();
         }
         break;
      case dofus["\x12\x03"].PVP_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_PVP;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus["\x12\x03"].TRADE_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_TRADE;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus["\x12\x03"].RECRUITMENT_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_RECRUITMENT;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus["\x12\x03"].MEETIC_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_MEETIC;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus["\x12\x03"].ADMIN_CHAT_COLOR:
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_ADMIN;
         _loc3_ = true;
         break;
      case dofus["\x12\x03"].ALL_CHAT_COLOR:
         bSound = false;
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_ALL;
         _loc3_ = true;
         break;
      default:
         bSound = false;
         _loc2_ = dofus["\x0b\x07"].ChatManager.TYPE_UNKNOWN;
         _loc4_ = true;
         _loc3_ = true;
   }
   if(_loc4_)
   {
      sText = this.addLinkWarning(sText);
      sText = this.applyInputCensorship(sText);
   }
   if(_loc3_ && this.api.kernel.NightManager.time.length)
   {
      _loc7_ = "[" + this.api.kernel.NightManager.time + "] ";
   }
   this._aMessages.push({textStyleLeft:"<font color=\"#" + sColor + "\"><br/>",text:sText,textStyleRight:"</font>",type:_loc2_,uniqId:sUniqId,timestamp:_loc7_,lf:false});
   if(this._aMessages.length > dofus["\x0b\x07"].ChatManager.MAX_ALL_LENGTH)
   {
      this._aMessages.shift();
   }
   this.refresh();
};
_global.dofus["\x0b\x07"].ChatManager.TYPE_ABO = 10;
_global.dofus["\x0b\x07"].ChatManager.TYPE_ALL = 11;
_global.dofus["\x0b\x07"].ChatManager.TYPE_UNKNOWN = 12;
_loc1._aVisibleTypes = [true,true,true,true,true,true,true,true,true,true,true,true,true];
