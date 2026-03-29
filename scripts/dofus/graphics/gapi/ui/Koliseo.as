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
if(!dofus["\r\x13"].gapi.ui)
{
   _global.dofus["\r\x13"].gapi.ui = new Object();
}
_global.dofus["\r\x13"].gapi.ui.Koliseo = function()
{
   super();
};
_global.dofus["\r\x13"].gapi.ui.Koliseo.prototype = new ank.gapi.core["\x1e\n\x0e"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.Koliseo.prototype;
_loc1.__get__leaderID = function()
{
   return this._sLeaderID;
};
_loc1.__get__followID = function()
{
   return this._sFollowID;
};
_loc1.addMember = function(oMember, bRefresh)
{
   this._aMembers.push(oMember);
   if(bRefresh)
   {
      this.updateData();
   }
};
_loc1.getMember = function(sMemberID)
{
   var _loc2_ = this._aMembers.findFirstItem("id",sMemberID);
   if(_loc2_.index != -1)
   {
      return _loc2_.item;
   }
   return null;
};
_loc1.getMemberById = function(nMemberID)
{
   var _loc2_ = -1;
   while(true)
   {
      _loc2_ = _loc2_ + 1;
      if(_loc2_ >= 3)
      {
         break;
      }
      if(this._aMembers[_loc2_].id == nMemberID)
      {
         return this._aMembers[_loc2_];
      }
   }
   return null;
};
_loc1.removeMember = function(sMemberID, bRefresh)
{
   var _loc2_ = this._aMembers.findFirstItem("id",sMemberID);
   if(_loc2_.index != -1)
   {
      this._aMembers.removeItems(_loc2_.index,1);
   }
   if(bRefresh)
   {
      this.updateData();
   }
};
_loc1.refresh = function()
{
   this.addToQueue({object:this,method:this.updateData});
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.Koliseo.CLASS_NAME);
   this._aMembers = new ank["\x1e\n\t"]["\x0e\x1d"]();
};
_loc1.destroy = function()
{
   this.gapi.hideTooltip();
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.updateData});
   this.addToQueue({object:this,method:this.initOption});
};
_loc1.addListeners = function()
{
   this._mcInfo.gotoAndStop(3);
   this._btnOpenClose.addEventListener("click",this);
   this._btnOpenClose.addEventListener("over",this);
   this._btnOpenClose.addEventListener("out",this);
};
_loc1.updateData = function(oMemberTarget)
{
   var _loc11_ = 0;
   this._nLvlTotal = 0;
   this._nProspectionTotal = 0;
   this._nIniciativaTotal = 0;
   var _loc12_ = false;
   var _loc7_;
   var _loc4_;
   var _loc6_;
   var _loc8_;
   var _loc2_;
   var _loc5_;
   var _loc3_;
   var _loc9_;
   if(this._aMembers.length != 0)
   {
      _loc7_ = -1;
      while(true)
      {
         _loc7_ = _loc7_ + 1;
         if(_loc7_ >= 3)
         {
            break;
         }
         _loc4_ = this._aMembers[_loc7_];
         _loc6_ = this["_piMember" + _loc11_++];
         if(oMemberTarget && oMemberTarget.id == _loc4_.id)
         {
            _loc4_ = oMemberTarget;
            this._aMembers[_loc7_] = oMemberTarget;
         }
         _loc6_.setData(_loc4_);
         _loc6_.isFollowing = _loc4_.id == this._sFollowID;
         if(_loc6_.isInGroup)
         {
            this._nLvlTotal += _loc4_.level;
            this._nProspectionTotal += _loc4_.prospection;
            this._nIniciativaTotal += _loc4_.initiative;
         }
      }
      _loc8_ = true;
      while(_loc8_)
      {
         _loc8_ = false;
         _loc2_ = -1;
         while(true)
         {
            _loc2_ = _loc2_ + 1;
            if(_loc2_ >= 2)
            {
               break;
            }
            if(this._aMembers[_loc2_].initiative < this._aMembers[_loc2_ + 1].initiative)
            {
               _loc5_ = this._aMembers[_loc2_];
               this._aMembers[_loc2_] = this._aMembers[_loc2_ + 1];
               this._aMembers[_loc2_ + 1] = _loc5_;
               _loc8_ = true;
            }
            _loc3_ = this["_piMember" + _loc2_];
            _loc3_._visible = !this._btnOpenClose.selected;
            _loc3_.setData(this._aMembers[_loc2_]);
            _loc3_.isFollowing = this._aMembers[_loc2_].id == this._sFollowID;
            if(_loc3_.isInGroup)
            {
               _loc9_ = _loc3_;
            }
         }
      }
   }
   var ref = this;
   this._mcInfo.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcInfo.onRollOut = function()
   {
      ref.out({target:this});
   };
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOpenClose:
         this.gapi.showTooltip(this.api.lang.getText("PARTY_OPEN_CLOSE"),oEvent.target,20);
         break;
      case this._mcInfo:
         this.gapi.showTooltip(this.api.lang.getText("TOTAL_INITIATIVE") + " : " + this._nIniciativaTotal + "\n" + this.api.lang.getText("TOTAL_LEVEL") + " : " + this._nLvlTotal + "\n" + this.api.lang.getText("TOTAL_DISCERNMENT") + " : " + this._nProspectionTotal,oEvent.target,20);
   }
};
_loc1.click = function(oEvent)
{
   this._piMember0._visible = !this._btnOpenClose.selected;
   this._piMember1._visible = !this._btnOpenClose.selected;
   this._piMember2._visible = !this._btnOpenClose.selected;
   this._mcInfo._visible = !this._btnOpenClose.selected;
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.addProperty("followID",_loc1.__get__followID,function()
{
}
);
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.ui.Koliseo.CLASS_NAME = "Koliseo";
