if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus["\r\x13"])
{
   _global.dofus["\r\x13"] = new Object();
}
if(!dofus["\r\x13"].gapi)
{
   _global.dofus["\r\x13"].gapi = new Object();
}
if(!dofus["\r\x13"].gapi.controls)
{
   _global.dofus["\r\x13"].gapi.controls = new Object();
}
_global.dofus["\r\x13"].gapi.controls["\r\r"].GuildMembersViewerMember = function()
{
   super();
};
_global.dofus["\r\x13"].gapi.controls["\r\r"].GuildMembersViewerMember.prototype = new ank.gapi.core["\x1e\n\x0e"]();
var _loc1 = dofus["\r\x13"].gapi.controls["\r\r"].GuildMembersViewerMember.prototype;
_loc1.__set__list = function(_loc2_)
{
   this._mcList = _loc2_;
   return this.list;
};
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   var _loc3_;
   if(_loc2_)
   {
      this._oItem = _loc4_;
      _loc3_ = this._mcList.gapi.api.datacenter.Player.guildInfos.playerRights;
      this._lblName.text = _loc4_.name;
      this._lblRank.text = this._mcList.gapi.api.lang.getRankInfos(_loc4_.rank).n;
      this._lblLevel.text = _loc4_.level;
      this._lblPercentXP.text = _loc4_.percentxp + "%";
      this._lblWinXP.text = new ank["\x1e\n\t"]["\x0e\x1b"](_loc4_.winxp).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._btnBann._visible = _loc4_.isLocalPlayer || _loc3_.canBann;
      this._btnProfil._visible = _loc4_.isLocalPlayer || (_loc3_.canManageRights || (_loc3_.canManageXPContitribution || _loc3_.canManageRanks));
      this._ldrGuild.contentPath = dofus["\x12\x03"].GUILDS_MINI_PATH + _loc4_.gfx + ".swf";
      this._mcFight._visible = _loc4_.state == 2;
      this._mcOffline._visible = _loc4_.state == 0;
      this._mcOver.hint = _loc4_.lastConnection;
      this._ldrAlignement.contentPath = dofus["\x12\x03"].ALIGNMENTS_MINI_PATH + _loc4_.alignement + ".swf";
   }
   else if(this._lblName.text != undefined)
   {
      this._lblName.text = "";
      this._lblRank.text = "";
      this._lblLevel.text = "";
      this._lblPercentXP.text = "";
      this._lblWinXP.text = "";
      this._btnBann._visible = false;
      this._btnProfil._visible = false;
      this._ldrGuild.contentPath = "";
      this._ldrAlignement.contentPath = "";
      this._mcFight._visible = false;
      this._mcOffline._visible = false;
      delete this._mcOver.onRollOver;
      delete this._mcOver.onRollOut;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._btnBann._visible = false;
   this._btnProfil._visible = false;
   this._mcFight._visible = false;
   this._mcOffline._visible = false;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   this._btnBann.addEventListener("click",this);
   this._btnProfil.addEventListener("click",this);
};
_loc1.click = function(_loc2_)
{
   var _loc2_;
   var _loc3_;
   switch(_loc2_.target._name)
   {
      case "_btnBann":
         _loc2_ = this._mcList.gapi.api;
         _loc3_ = _loc2_.datacenter.Player.guildInfos.members.length;
         if(this._oItem.rights.isBoss && _loc3_ > 1)
         {
            this._mcList.gapi.api.kernel.showMessage(undefined,_loc2_.lang.getText("GUILD_BOSS_CANT_BE_BANN"),"ERROR_BOX");
         }
         else if(this._oItem.isLocalPlayer)
         {
            this._mcList.gapi.api.kernel.showMessage(undefined,_loc2_.lang.getText("DO_U_DELETE_YOU") + (_loc3_ > 1 ? "" : "\n" + _loc2_.lang.getText("DELETE_GUILD_CAUTION")),"CAUTION_YESNO",{name:"DeleteMember",listener:this,params:{name:this._oItem.name}});
         }
         else
         {
            this._mcList.gapi.api.kernel.showMessage(undefined,_loc2_.lang.getText("DO_U_DELETE_MEMBER",[this._oItem.name]),"CAUTION_YESNO",{name:"DeleteMember",listener:this,params:{name:this._oItem.name}});
         }
         break;
      case "_btnProfil":
         this._mcList.gapi.loadUIComponent("GuildMemberInfos","GuildMemberInfos",{member:this._oItem});
   }
};
_loc1.yes = function(_loc2_)
{
   this._mcList.gapi.api.network.Guild.bann(_loc2_.params.name);
};
_loc1.over = function(_loc2_)
{
   if(this._oItem.state != 0)
   {
      return undefined;
   }
   var _loc3_ = this._mcList.gapi.api;
   var _loc5_ = this._oItem.lastConnection;
   var _loc4_ = Math.floor(_loc5_ / 744);
   _loc5_ -= _loc4_ * 24 * 31;
   var _loc2_ = Math.floor(_loc5_ / 24);
   _loc5_ -= _loc2_ * 24;
   var _loc11_ = _loc5_;
   if(_loc4_ < 0)
   {
      _loc4_ = 0;
      _loc2_ = 0;
      _loc11_ = 0;
   }
   var _loc7_ = " " + _loc3_.lang.getText("AND") + " ";
   var _loc6_ = "";
   var _loc9_;
   var _loc8_;
   var _loc10_;
   if(_loc4_ > 0 && _loc2_ != 0)
   {
      _loc9_ = ank["\x1e\n\t"]["\x1e\x16\x1a"].combine(_loc3_.lang.getText("MONTHS"),"m",_loc4_ == 1);
      _loc8_ = ank["\x1e\n\t"]["\x1e\x16\x1a"].combine(_loc3_.lang.getText("DAYS"),"m",_loc2_ == 1);
      _loc6_ += _loc4_ + " " + _loc9_ + _loc7_ + _loc2_ + " " + _loc8_;
   }
   else if(_loc2_ != 0)
   {
      _loc10_ = ank["\x1e\n\t"]["\x1e\x16\x1a"].combine(_loc3_.lang.getText("DAYS"),"m",_loc2_ == 1);
      _loc6_ += _loc2_ + " " + _loc10_;
   }
   else
   {
      _loc6_ += _loc3_.lang.getText("A_CONNECTED_TODAY");
   }
   _loc3_.ui.showTooltip(_loc3_.lang.getText("GUILD_LAST_CONNECTION",[_loc6_]),this._mcOver,-20);
};
_loc1.out = function(_loc2_)
{
   this._mcList.gapi.api.ui.hideTooltip();
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.controls["\r\r"].GuildMembersViewerMember.ftgt = 150;
