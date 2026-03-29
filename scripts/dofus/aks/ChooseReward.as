if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.aks)
{
   _global.dofus.aks = new Object();
}
_global.dofus.aks.ChooseReward = function(oAKS, oAPI)
{
   super.initialize(oAKS,oAPI);
};
_global.dofus.aks.ChooseReward.prototype = new dofus.aks.Handler();
var _loc1_ = _global.dofus.aks.ChooseReward.prototype;
_loc1_.ChooseReward = function(_loc3_, oAPI)
{
   super.initialize(_loc3_,oAPI);
};
_loc1_.getReward = function(_loc2_)
{
   this.api.network.Items.selectRouletteItem(_loc2_);
};
_loc1_.onData = function(_loc2_)
{
   var _loc11_;
   var _loc12_;
   var _loc13_;
   var _loc3_;
   var _loc5_;
   var _loc6_;
   var _loc10_;
   var _loc8_;
   var _loc9_;
   var _loc7_;
   var _loc2_;
   var _loc4_;
   if(_loc2_.length != 0)
   {
      _loc11_ = new Array();
      _loc12_ = _loc2_.split("|");
      _loc13_ = _loc12_[3];
      _loc3_ = 0;
      while(_loc3_ < 3)
      {
         _loc5_ = new Array();
         _loc6_ = _loc12_[_loc3_].split(";");
         _loc10_ = new dofus.datacenter["\f\x0b"](undefined,_loc6_[0]);
         _loc8_ = _loc6_[2].slice(16);
         _loc9_ = new dofus.datacenter["\f\x0b"](undefined,undefined,1,0,String(_loc8_));
         _loc7_ = _loc6_[1].split(",");
         _loc2_ = 0;
         while(_loc2_ < dofus.aks.ChooseReward.ICONS_NEEDED)
         {
            _loc5_.push(new dofus.datacenter["\f\x0b"](undefined,_loc7_[_loc2_]));
            _loc2_ += 1;
         }
         _loc4_ = new Object();
         _loc4_.fakeItems = _loc5_;
         _loc4_.realItem = _loc10_;
         _loc4_.bonusEffects = _loc9_;
         _loc11_.push(_loc4_);
         _loc3_ += 1;
      }
      if(this.api.ui.getUIComponent("ChooseReward") == undefined)
      {
         this.api.ui.loadUIComponent("ChooseReward","ChooseReward",{items:_loc11_,currentRoom:_loc13_},{bAlwaysOnTop:true});
      }
   }
};
_global.dofus.aks.ChooseReward.ICONS_NEEDED = 6;
