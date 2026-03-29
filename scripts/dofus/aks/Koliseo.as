if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.aks)
{
   _global.dofus.aks = new Object();
}
_global.dofus.aks.Koliseo = function(oAKS, oAPI)
{
   super.initialize(oAKS,oAPI);
};
_global.dofus.aks.Koliseo.prototype = new dofus.aks.Handler();
var _loc1 = _global.dofus.aks.Koliseo.prototype;
_loc1.invite = function(sSpriteName)
{
   this.aks.send("kI" + sSpriteName);
};
_loc1.refuseInvitation = function()
{
   this.aks.send("kR",false);
};
_loc1.acceptInvitation = function()
{
   this.aks.send("kA");
};
_loc1.leave = function(sSpriteID)
{
   this.aks.send("kV" + (sSpriteID == undefined ? "" : sSpriteID));
};
_loc1.onInvite = function(bSuccess, sExtraData)
{
   var _loc4_;
   var _loc2_;
   var _loc3_;
   var _loc5_;
   if(bSuccess)
   {
      _loc4_ = sExtraData.split("|");
      _loc2_ = _loc4_[0];
      _loc3_ = _loc4_[1];
      if(_loc2_ == undefined || _loc3_ == undefined)
      {
         this.refuseInvitation();
         return undefined;
      }
      if(_loc2_ == this.api.datacenter.Player.Name)
      {
         this.api.kernel.showMessage(this.api.lang.getText("KOLISEO"),this.api.lang.getText("YOU_INVITE_B_IN_KOLISEO",[_loc3_]),"INFO_CANCEL",{name:"Koliseo",listener:this});
      }
      if(_loc3_ == this.api.datacenter.Player.Name)
      {
         if(this.api.kernel.ChatManager.isBlacklisted(_loc2_))
         {
            this.refuseInvitation();
            return undefined;
         }
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CHAT_A_INVITE_YOU_IN_KOLISEO",[this.api.kernel.ChatManager.getLinkName(_loc2_)]),"INFO_CHAT");
         this.api.kernel.showMessage(this.api.lang.getText("KOLISEO"),this.api.lang.getText("A_INVITE_YOU_IN_KOLISEO",[_loc2_]),"CAUTION_YESNOIGNORE",{name:"Koliseo",player:_loc2_,listener:this,params:{player:_loc2_}});
         this.api.sounds.events.onGameInvitation();
      }
   }
   else
   {
      _loc5_ = sExtraData.charAt(0);
      switch(_loc5_)
      {
         case "a":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("KOLISEO_ALREADY_IN_GROUP"),"ERROR_CHAT",{name:"KoliseoError"});
            break;
         case "f":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("KOLISEO_FULL"),"ERROR_CHAT",{name:"KoliseoError"});
            break;
         case "n":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_FIND_ACCOUNT_OR_CHARACTER",[sExtraData.substr(1)]),"ERROR_CHAT",{name:"KoliseoError"});
      }
   }
};
_loc1.onRefuse = function(sExtraData)
{
   this.api.ui.unloadUIComponent("AskYesNoIgnoreKoliseo");
   this.api.ui.unloadUIComponent("AskCancelKoliseo");
};
_loc1.onAccept = function(sExtraData)
{
   this.api.ui.unloadUIComponent("AskYesNoIgnoreKoliseo");
   this.api.ui.unloadUIComponent("AskCancelKoliseo");
};
_loc1.onCreate = function(bSuccess, sExtraData)
{
   var _loc2_;
   if(bSuccess)
   {
      this.api.ui.loadUIComponent("Koliseo","Koliseo",undefined,{bStrayIfPresent:true});
   }
   else
   {
      _loc2_ = sExtraData.charAt(0);
      switch(_loc2_)
      {
         case "a":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("KOLISEO_ALREADY_IN_GROUP"),"ERROR_CHAT",{name:"KoliseoError"});
            break;
         case "f":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("KOLISEO_FULL"),"ERROR_CHAT",{name:"KoliseoError"});
      }
   }
};
_loc1.onLeave = function(sExtraData)
{
   var _loc2_ = this.api.ui.getUIComponent("Koliseo");
   if(_loc2_.followID != undefined)
   {
      this.api.kernel.GameManager.updateCompass(this.api.datacenter.Basics.banner_targetCoords[0],this.api.datacenter.Basics.banner_targetCoords[1]);
   }
   var _loc3_ = _loc2_.getMember(sExtraData).name;
   if(_loc3_ != undefined)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("A_KICK_FROM_KOLISEO",[_loc3_]),"INFO_CHAT");
   }
   else
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("LEAVE_GROUP"),"INFO_CHAT");
   }
   this.api.ui.unloadUIComponent("Koliseo");
   this.api.ui.unloadUIComponent("AskYesNoIgnoreKoliseo");
   this.api.ui.unloadUIComponent("AskCancelKoliseo");
   this.api.datacenter.Player.inKoliseo = false;
   this.api.datacenter.Basics.aks_infos_highlightCoords_clear(2);
};
_loc1.onMovement = function(sExtraData)
{
   var _loc32_ = sExtraData.charAt(0) == "+";
   var _loc6_ = this.api.ui.getUIComponent("Koliseo");
   var _loc30_ = sExtraData.substr(1).split("|");
   var _loc7_ = -1;
   var _loc2_;
   var _loc5_;
   var _loc24_;
   var _loc22_;
   var _loc26_;
   var _loc10_;
   var _loc16_;
   var _loc18_;
   var _loc20_;
   var _loc25_;
   var _loc28_;
   var _loc11_;
   var _loc14_;
   var _loc3_;
   var _loc8_;
   var _loc15_;
   var _loc17_;
   var _loc19_;
   var _loc23_;
   var _loc27_;
   var _loc9_;
   var _loc12_;
   var _loc21_;
   var _loc29_;
   var _loc13_;
   var _loc4_;
   while(true)
   {
      _loc7_ = _loc7_ + 1;
      if(_loc7_ >= _loc30_.length)
      {
         break;
      }
      _loc2_ = String(_loc30_[_loc7_]).split(";");
      _loc5_ = _loc2_[0];
      switch(sExtraData.charAt(0))
      {
         case "+":
            _loc24_ = _loc2_[1];
            _loc22_ = _loc2_[2];
            _loc26_ = Number(_loc2_[3]);
            _loc10_ = Number(_loc2_[4]);
            _loc16_ = Number(_loc2_[5]);
            _loc18_ = _loc2_[6];
            _loc20_ = _loc2_[7];
            _loc25_ = Number(_loc2_[8]);
            _loc28_ = Number(_loc2_[9]);
            _loc11_ = Number(_loc2_[10]);
            _loc14_ = Number(_loc2_[11]);
            _loc3_ = new Object();
            _loc3_.id = _loc5_;
            _loc3_.name = _loc24_;
            _loc3_.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + _loc22_ + ".swf";
            _loc3_.color1 = _loc26_;
            _loc3_.color2 = _loc10_;
            _loc3_.color3 = _loc16_;
            _loc3_.life = _loc20_;
            _loc3_.level = _loc25_;
            _loc3_.initiative = _loc28_;
            _loc3_.prospection = _loc11_;
            _loc3_.side = _loc14_;
            this.api.kernel.CharactersManager.setSpriteAccessories(_loc3_,_loc18_);
            _loc6_.addMember(_loc3_);
            break;
         case "-":
            _loc6_.removeMember(_loc5_,true);
            break;
         case "~":
            _loc8_ = _loc2_[1];
            _loc15_ = _loc2_[2];
            _loc17_ = Number(_loc2_[3]);
            _loc19_ = Number(_loc2_[4]);
            _loc23_ = Number(_loc2_[5]);
            _loc27_ = _loc2_[6];
            _loc9_ = _loc2_[7];
            _loc12_ = Number(_loc2_[8]);
            _loc21_ = Number(_loc2_[9]);
            _loc29_ = Number(_loc2_[10]);
            _loc13_ = Number(_loc2_[11]);
            _loc4_ = new Object();
            _loc4_.id = _loc5_;
            _loc4_.name = _loc8_;
            _loc4_.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + _loc15_ + ".swf";
            _loc4_.color1 = _loc17_;
            _loc4_.color2 = _loc19_;
            _loc4_.color3 = _loc23_;
            _loc4_.life = _loc9_;
            _loc4_.level = _loc12_;
            _loc4_.initiative = _loc21_;
            _loc4_.prospection = _loc29_;
            _loc4_.side = _loc13_;
            this.api.kernel.CharactersManager.setSpriteAccessories(_loc4_,_loc27_);
            _loc6_.updateData(_loc4_);
      }
   }
   _loc6_.refresh();
};
_loc1.cancel = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target._name) === "AskCancelKoliseo")
   {
      this.refuseInvitation();
   }
};
_loc1.yes = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target._name) === "AskYesNoIgnoreKoliseo")
   {
      this.acceptInvitation();
   }
};
_loc1.no = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target._name) === "AskYesNoIgnoreKoliseo")
   {
      this.refuseInvitation();
   }
};
_loc1.ignore = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target._name) === "AskYesNoIgnoreKoliseo")
   {
      this.api.kernel.ChatManager.addToBlacklist(oEvent.params.player);
      this.api.kernel.showMessage(undefined,this.api.lang.getText("TEMPORARY_BLACKLISTED",[oEvent.params.player]),"INFO_CHAT");
      this.refuseInvitation(oEvent.params.spriteID);
   }
};
ASSetPropFlags(_loc1,null,1);
