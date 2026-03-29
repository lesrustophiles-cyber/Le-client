var _loc1 = dofus["\r\x13"].gapi.ui.StatsJob.prototype;
_loc1.initData = function()
{
   var _loc8_ = this.api.datacenter.Player;
   this._ctrJob0._visible = false;
   this._ctrJob1._visible = false;
   this._ctrJob2._visible = false;
   this._ctrJob3._visible = false;
   this._ctrJob4._visible = false;
   this._ctrJob5._visible = false;
   this._ctrJob6._visible = false;
   this._ctrJob7._visible = false;
   this._ctrJob8._visible = false;
   this._ctrJob9._visible = false;
   this._ctrJob10._visible = false;
   this._ctrJob11._visible = false;
   this._ctrJob12._visible = false;
   this._ctrJob13._visible = false;
   this._ctrJob14._visible = false;
   this._ctrJob15._visible = false;
   this._ctrJob16._visible = false;
   this._ctrJob17._visible = false;
   this._ctrJob18._visible = false;
   this._ctrJob19._visible = false;
   this._ctrJob20._visible = false;
   this._ctrJob21._visible = false;
   this._ctrSpe0._visible = false;
   this._ctrSpe1._visible = false;
   this._ctrSpe2._visible = false;
   this._ctrSpe3._visible = false;
   this._ctrSpe4._visible = false;
   this._ctrSpe5._visible = false;
   this._ctrSpe6._visible = false;
   this._ctrSpe7._visible = false;
   this._ctrSpe8._visible = false;
   this._ctrSpe9._visible = false;
   this._ctrSpe10._visible = false;
   this._ctrSpe11._visible = false;
   this._ctrSpe12._visible = false;
   this._btnCloseJobs._visible = false;
   this._mcViewersPlacer2._visible = false;
   this.levelChanged({value:_loc8_.Level});
   this.xpChanged({value:_loc8_.XP});
   this.lpChanged({value:_loc8_.LP});
   this.lpMaxChanged({value:_loc8_.LPmax});
   this.apChanged({value:_loc8_.AP});
   this.mpChanged({value:_loc8_.MP});
   this.initiativeChanged({value:_loc8_.Initiative});
   this.discernmentChanged({value:_loc8_.Discernment});
   this.forceXtraChanged({value:_loc8_.ForceXtra});
   this.vitalityXtraChanged({value:_loc8_.VitalityXtra});
   this.wisdomXtraChanged({value:_loc8_.WisdomXtra});
   this.chanceXtraChanged({value:_loc8_.ChanceXtra});
   this.agilityXtraChanged({value:_loc8_.AgilityXtra});
   this.intelligenceXtraChanged({value:_loc8_.IntelligenceXtra});
   this.bonusPointsChanged({value:_loc8_.BonusPoints});
   this.energyChanged({value:_loc8_.Energy});
   this.alignmentChanged({alignment:_loc8_.alignment});
   var _loc10_ = this.api.datacenter.Player.Jobs;
   var _loc7_ = 0;
   var _loc6_;
   var _loc9_;
   var _loc2_;
   var _loc4_;
   var _loc3_;
   var _loc5_;
   while(_loc7_ < _loc10_.length)
   {
      _loc6_ = _loc10_[_loc7_];
      _loc9_ = _loc6_.specializationOf;
      if(_loc9_ != 0)
      {
         _loc2_ = 0;
         while(_loc2_ < 12)
         {
            _loc4_ = this["_ctrSpe" + _loc2_];
            if(_loc4_.contentData == undefined)
            {
               _loc4_.contentData = _loc6_;
               break;
            }
            _loc2_ += 1;
         }
      }
      else
      {
         _loc3_ = 0;
         while(_loc3_ < 23)
         {
            _loc5_ = this["_ctrJob" + _loc3_];
            if(_loc5_.contentData == undefined)
            {
               _loc5_.contentData = _loc6_;
               break;
            }
            _loc3_ += 1;
         }
      }
      _loc7_ += 1;
   }
   this._lblName.text = this.api.datacenter.Player.Name;
   this._btnJobOpen.label = "Mes métiers";
   this._mcViewersPlacer2.title = "Mes métiers";
   this.activateBoostButtons(!this.api.datacenter.Game.isFight);
};
_loc1.showJobsPanel = function(booljob)
{
   this._ctrJob0._visible = booljob;
   this._ctrJob1._visible = booljob;
   this._ctrJob2._visible = booljob;
   this._ctrJob3._visible = booljob;
   this._ctrJob4._visible = booljob;
   this._ctrJob5._visible = booljob;
   this._ctrJob6._visible = booljob;
   this._ctrJob7._visible = booljob;
   this._ctrJob8._visible = booljob;
   this._ctrJob9._visible = booljob;
   this._ctrJob10._visible = booljob;
   this._ctrJob11._visible = booljob;
   this._ctrJob12._visible = booljob;
   this._ctrJob13._visible = booljob;
   this._ctrJob14._visible = booljob;
   this._ctrJob15._visible = booljob;
   this._ctrJob16._visible = booljob;
   this._ctrJob17._visible = booljob;
   this._ctrJob18._visible = booljob;
   this._ctrJob19._visible = booljob;
   this._ctrJob20._visible = booljob;
   this._ctrJob21._visible = booljob;
   this._ctrJob22._visible = booljob;
   this._ctrJob23._visible = booljob;
   this._ctrSpe0._visible = booljob;
   this._ctrSpe1._visible = booljob;
   this._ctrSpe2._visible = booljob;
   this._ctrSpe3._visible = booljob;
   this._ctrSpe4._visible = booljob;
   this._ctrSpe5._visible = booljob;
   this._ctrSpe6._visible = booljob;
   this._ctrSpe7._visible = booljob;
   this._ctrSpe8._visible = booljob;
   this._ctrSpe9._visible = booljob;
   this._ctrSpe10._visible = booljob;
   this._ctrSpe11._visible = booljob;
   this._ctrSpe12._visible = booljob;
   this._btnCloseJobs._visible = booljob;
   this._mcViewersPlacer2._visible = booljob;
};
_loc1.addListeners = function()
{
   this._ctrAlignment.addEventListener("click",this);
   this._ctrJob0.addEventListener("click",this);
   this._ctrJob1.addEventListener("click",this);
   this._ctrJob2.addEventListener("click",this);
   this._ctrJob3.addEventListener("click",this);
   this._ctrJob4.addEventListener("click",this);
   this._ctrJob5.addEventListener("click",this);
   this._ctrJob6.addEventListener("click",this);
   this._ctrJob7.addEventListener("click",this);
   this._ctrJob8.addEventListener("click",this);
   this._ctrJob9.addEventListener("click",this);
   this._ctrJob10.addEventListener("click",this);
   this._ctrJob11.addEventListener("click",this);
   this._ctrJob12.addEventListener("click",this);
   this._ctrJob13.addEventListener("click",this);
   this._ctrJob14.addEventListener("click",this);
   this._ctrJob15.addEventListener("click",this);
   this._ctrJob16.addEventListener("click",this);
   this._ctrJob17.addEventListener("click",this);
   this._ctrJob18.addEventListener("click",this);
   this._ctrJob19.addEventListener("click",this);
   this._ctrJob20.addEventListener("click",this);
   this._ctrJob21.addEventListener("click",this);
   this._ctrJob22.addEventListener("click",this);
   this._ctrJob23.addEventListener("click",this);
   this._ctrSpe0.addEventListener("click",this);
   this._ctrSpe1.addEventListener("click",this);
   this._ctrSpe2.addEventListener("click",this);
   this._ctrSpe3.addEventListener("click",this);
   this._ctrSpe4.addEventListener("click",this);
   this._ctrSpe5.addEventListener("click",this);
   this._ctrSpe6.addEventListener("click",this);
   this._ctrSpe7.addEventListener("click",this);
   this._ctrSpe8.addEventListener("click",this);
   this._ctrSpe9.addEventListener("click",this);
   this._ctrSpe10.addEventListener("click",this);
   this._ctrSpe11.addEventListener("click",this);
   this._ctrSpe12.addEventListener("click",this);
   this._ctrAlignment.addEventListener("over",this);
   this._ctrJob0.addEventListener("over",this);
   this._ctrJob1.addEventListener("over",this);
   this._ctrJob2.addEventListener("over",this);
   this._ctrJob3.addEventListener("over",this);
   this._ctrJob4.addEventListener("over",this);
   this._ctrJob5.addEventListener("over",this);
   this._ctrJob6.addEventListener("over",this);
   this._ctrJob7.addEventListener("over",this);
   this._ctrJob8.addEventListener("over",this);
   this._ctrJob9.addEventListener("over",this);
   this._ctrJob10.addEventListener("over",this);
   this._ctrJob11.addEventListener("over",this);
   this._ctrJob12.addEventListener("over",this);
   this._ctrJob13.addEventListener("over",this);
   this._ctrJob14.addEventListener("over",this);
   this._ctrJob15.addEventListener("over",this);
   this._ctrJob16.addEventListener("over",this);
   this._ctrJob17.addEventListener("over",this);
   this._ctrJob18.addEventListener("over",this);
   this._ctrJob19.addEventListener("over",this);
   this._ctrJob20.addEventListener("over",this);
   this._ctrJob21.addEventListener("over",this);
   this._ctrJob22.addEventListener("over",this);
   this._ctrJob23.addEventListener("over",this);
   this._ctrSpe0.addEventListener("over",this);
   this._ctrSpe1.addEventListener("over",this);
   this._ctrSpe2.addEventListener("over",this);
   this._ctrSpe3.addEventListener("over",this);
   this._ctrSpe4.addEventListener("over",this);
   this._ctrSpe5.addEventListener("over",this);
   this._ctrSpe6.addEventListener("over",this);
   this._ctrSpe7.addEventListener("over",this);
   this._ctrSpe8.addEventListener("over",this);
   this._ctrSpe9.addEventListener("over",this);
   this._ctrSpe10.addEventListener("over",this);
   this._ctrSpe11.addEventListener("over",this);
   this._ctrSpe12.addEventListener("over",this);
   this._ctrAlignment.addEventListener("out",this);
   this._ctrJob0.addEventListener("out",this);
   this._ctrJob1.addEventListener("out",this);
   this._ctrJob2.addEventListener("out",this);
   this._ctrJob3.addEventListener("out",this);
   this._ctrJob4.addEventListener("out",this);
   this._ctrJob5.addEventListener("out",this);
   this._ctrJob6.addEventListener("out",this);
   this._ctrJob7.addEventListener("out",this);
   this._ctrJob8.addEventListener("out",this);
   this._ctrJob9.addEventListener("out",this);
   this._ctrJob10.addEventListener("out",this);
   this._ctrJob11.addEventListener("out",this);
   this._ctrJob12.addEventListener("out",this);
   this._ctrJob13.addEventListener("out",this);
   this._ctrJob14.addEventListener("out",this);
   this._ctrJob15.addEventListener("out",this);
   this._ctrJob16.addEventListener("out",this);
   this._ctrJob17.addEventListener("out",this);
   this._ctrJob18.addEventListener("out",this);
   this._ctrJob19.addEventListener("out",this);
   this._ctrJob20.addEventListener("out",this);
   this._ctrJob21.addEventListener("out",this);
   this._ctrJob22.addEventListener("out",this);
   this._ctrJob23.addEventListener("out",this);
   this._ctrSpe0.addEventListener("out",this);
   this._ctrSpe1.addEventListener("out",this);
   this._ctrSpe2.addEventListener("out",this);
   this._ctrSpe3.addEventListener("out",this);
   this._ctrSpe4.addEventListener("out",this);
   this._ctrSpe5.addEventListener("out",this);
   this._ctrSpe6.addEventListener("out",this);
   this._ctrSpe7.addEventListener("out",this);
   this._ctrSpe8.addEventListener("out",this);
   this._ctrSpe9.addEventListener("out",this);
   this._ctrSpe10.addEventListener("out",this);
   this._ctrSpe11.addEventListener("out",this);
   this._ctrSpe12.addEventListener("out",this);
   this._btn10.addEventListener("click",this);
   this._btn10.addEventListener("over",this);
   this._btn10.addEventListener("out",this);
   this._btn11.addEventListener("click",this);
   this._btn11.addEventListener("over",this);
   this._btn11.addEventListener("out",this);
   this._btn12.addEventListener("click",this);
   this._btn12.addEventListener("over",this);
   this._btn12.addEventListener("out",this);
   this._btn13.addEventListener("click",this);
   this._btn13.addEventListener("over",this);
   this._btn13.addEventListener("out",this);
   this._btn14.addEventListener("click",this);
   this._btn14.addEventListener("over",this);
   this._btn14.addEventListener("out",this);
   this._btn15.addEventListener("click",this);
   this._btn15.addEventListener("over",this);
   this._btn15.addEventListener("out",this);
   this._btnJobOpen.addEventListener("click",this);
   this.api.datacenter.Game.addEventListener("stateChanged",this);
   this._btnClose.addEventListener("click",this);
   this._btnClosePanel.addEventListener("click",this);
   this._btnCloseJobs.addEventListener("click",this);
   this._mcMoreStats.onRelease = function()
   {
      this._parent.click({target:this});
   };
};
_loc1.click = function(_loc2_)
{
   var _loc2_;
   switch(_loc2_.target._name)
   {
      case "_mcResetStats":
         this.api.network.send("Apc");
         break;
      case "_btnClosePanel":
         this.hideJob();
         this.hideAlignment();
         this.hideStats();
         break;
      case "_ctrAlignment":
         if(this.api.datacenter.Player.data.alignment.index == 0)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("NEED_ALIGNMENT"),"ERROR_BOX");
         }
         else
         {
            this.showAlignment();
         }
         break;
      case "_btnClose":
         this.callClose();
         break;
      case "_mcMoreStats":
         this.showStats();
         break;
      case "_btn10":
      case "_btn11":
      case "_btn12":
      case "_btn13":
      case "_btn14":
      case "_btn15":
         this.api.sounds.events.onStatsJobBoostButtonClick();
         _loc2_ = _loc2_.target._name.substr(4);
         if(this.api.datacenter.Player.canBoost(_loc2_))
         {
            this.api.ui.loadUIComponent("BonusStats","BonusStats",{stat:_loc2_});
         }
         break;
      case "_btnJobOpen":
         if(this._mcViewersPlacer2._visible)
         {
            this.showJobsPanel(false);
         }
         else
         {
            this.showJobsPanel(true);
         }
         break;
      case "_btnCloseJobs":
         this.showJobsPanel(false);
         break;
      default:
         this.showJob(_loc2_.target.contentData);
   }
};
