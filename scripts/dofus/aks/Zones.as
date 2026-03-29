if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.aks)
{
   _global.dofus.aks = new Object();
}
_global.dofus.aks.Zones = function(oAKS, oAPI)
{
   super.initialize(oAKS,oAPI);
};
_global.dofus.aks.Zones.prototype = new dofus.aks.Handler();
var _loc1 = _global.dofus.aks.Zones.prototype;
_loc1.leave = function()
{
   this.aks.send("zV",true);
};
_loc1.use = function(nWaypointID)
{
   this.aks.send("zU" + nWaypointID,true);
};
_loc1.onCreate = function(sExtraData)
{
   var _loc5_ = sExtraData.split("|");
   var _loc7_ = Number(_loc5_[0]);
   var _loc6_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc4_ = 0;
   var _loc3_;
   var _loc2_;
   while(true)
   {
      _loc4_ = _loc4_ + 1;
      if(_loc4_ >= _loc5_.length)
      {
         break;
      }
      _loc3_ = _loc5_[_loc4_].split(";");
      _loc2_ = new Object();
      _loc2_.name = _loc3_[0];
      _loc2_.id = _loc3_[1];
      _loc6_.push(_loc2_);
   }
   this.api.ui.loadUIComponent("Zones","Zones",{data:_loc6_});
};
_loc1.onLeave = function()
{
   this.api.ui.unloadUIComponent("Zones");
};
_loc1.onUseError = function()
{
   this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_USE_WAYPOINT"),"ERROR_CHAT");
};
ASSetPropFlags(_loc1,null,1);
