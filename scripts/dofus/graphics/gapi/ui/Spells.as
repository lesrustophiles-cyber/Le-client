var _loc1 = dofus["\r\x13"].gapi.ui.Spells.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.Spells.CLASS_NAME);
   switch(this.gapi.getUIComponent("Banner").shortcuts.getCurrentTab())
   {
      case "Spells":
      case "Spells2":
         break;
      default:
         this.gapi.getUIComponent("Banner").shortcuts.setCurrentTab("Spells");
   }
};
_loc1.getCostForUnBoost = function(_loc2_)
{
   var _loc2_ = _loc2_.level;
   var _loc1_ = _loc2_ - 1;
   return _loc1_;
};
