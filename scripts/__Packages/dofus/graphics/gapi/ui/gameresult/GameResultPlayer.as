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
_global.dofus["\r\x13"].gapi.ui["\r\x1b"]["\r\x1a"] = function()
{
   super();
};
dofus["\r\x13"].gapi.ui["\r\x1b"]["\r\x1a"].prototype = new ank.gapi.core["\x1e\n\x0e"]();
var _loc1 = dofus["\r\x13"].gapi.ui["\r\x1b"]["\r\x1a"].prototype;
_loc1.__set__list = function(_loc2_)
{
   this._mcList = _loc2_;
   return this.list;
};
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   this._oItems = _loc4_;
   var _loc10_;
   var _loc4_;
   var _loc6_;
   var _loc7_;
   var _loc3_;
   if(_loc2_)
   {
      switch(_loc4_.type)
      {
         case "player":
         case "monster":
         case "taxcollector":
            this._lblName.text = _loc4_.name;
            if(_global.isNaN(_loc4_.xp))
            {
               this._pbXP._visible = false;
            }
            else
            {
               this._pbXP._visible = true;
               this._pbXP.minimum = _loc4_.minxp;
               this._pbXP.maximum = _loc4_.maxxp;
               this._pbXP.value = _loc4_.xp;
            }
            this._lblWinXP.text = _global.isNaN(_loc4_.winxp) ? "" : new ank["\x1e\n\t"]["\x0e\x1b"](_loc4_.winxp).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblBonusXP.text = _global.isNaN(_loc4_.bonus) ? "" : new ank["\x1e\n\t"]["\x0e\x1b"](_loc4_.bonus).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblGuildXP.text = _global.isNaN(_loc4_.guildxp) ? "" : new ank["\x1e\n\t"]["\x0e\x1b"](_loc4_.guildxp).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblMountXP.text = _global.isNaN(_loc4_.mountxp) ? "" : new ank["\x1e\n\t"]["\x0e\x1b"](_loc4_.mountxp).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblKama.text = _global.isNaN(_loc4_.kama) ? "" : new ank["\x1e\n\t"]["\x0e\x1b"](_loc4_.kama).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblLevel.text = _loc4_.level;
            this._lblBonusXP.text = "+" + this._lblBonusXP.text + "%";
            this._mcDeadHead._visible = _loc4_.bDead;
            this.createEmptyMovieClip("_mcItems",10);
            _loc10_ = false;
            _loc4_.items.sortOn(["_itemLevel","_itemName"],Array.DESCENDING | Array.NUMERIC);
            _loc4_ = _loc4_.items.length;
            while(true)
            {
               _loc4_ -= 1;
               if(_loc4_ < 0)
               {
                  break;
               }
               _loc6_ = this._mcItemPlacer._x + 24 * _loc4_;
               if(_loc6_ < this._mcItemPlacer._x + this._mcItemPlacer._width)
               {
                  _loc7_ = _loc4_.items[_loc4_];
                  _loc3_ = this._mcItems.attachMovie("Container","_ctrItem" + _loc4_,_loc4_,{_x:_loc6_,_y:this._mcItemPlacer._y + 1});
                  _loc3_.setSize(18,18);
                  _loc3_.addEventListener("over",this);
                  _loc3_.addEventListener("out",this);
                  _loc3_.addEventListener("click",this);
                  _loc3_.enabled = true;
                  _loc3_.margin = 0;
                  _loc3_.contentData = _loc7_;
               }
               else
               {
                  _loc10_ = true;
               }
            }
            this._ldrAllDrop._visible = _loc10_;
      }
   }
   else if(this._lblName.text != undefined)
   {
      this._pbXP._visible = false;
      this._lblName.text = "";
      this._pbXP.minimum = 0;
      this._pbXP.maximum = 100;
      this._pbXP.value = random(99);
      this._lblWinXP.text = "";
      this._lblBonusXP.text = "";
      this._lblKama.text = "";
      this._mcDeadHead._visible = false;
      this._mcItems.removeMovieClip();
      this._ldrAllDrop._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._mcItemPlacer._alpha = 0;
   this._mcDeadHead._visible = false;
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.size = function()
{
   super.size();
};
_loc1.addListeners = function()
{
   var _loc2_ = this;
   this._ldrAllDrop.addEventListener("over",this);
   this._ldrAllDrop.addEventListener("out",this);
   this._pbXP.enabled = true;
   this._pbXP.addEventListener("over",this);
   this._pbXP.addEventListener("out",this);
};
_loc1.over = function(_loc2_)
{
   var _loc5_;
   var _loc4_;
   var _loc2_;
   var _loc3_;
   var _loc6_;
   var _loc8_;
   switch(_loc2_.target)
   {
      case this._ldrAllDrop:
         _loc5_ = this._oItems.items;
         _loc4_ = "";
         _loc2_ = 0;
         while(_loc2_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc2_];
            if(_loc2_ > 0)
            {
               _loc4_ += "\n";
            }
            _loc4_ += _loc3_.Quantity + " x " + _loc3_.name;
            _loc2_ += 1;
         }
         if(_loc4_ != "")
         {
            this._mcList.gapi.showTooltip(_loc4_,_loc2_.target,30);
         }
         break;
      case this._pbXP:
         this._mcList.gapi.showTooltip(this._oItems.xp + " / " + this._oItems.maxxp,_loc2_.target,20);
         break;
      default:
         _loc6_ = _loc2_.target.contentData;
         _loc8_ = _loc6_.style + "ToolTip";
         this._mcList.gapi.showTooltip(_loc6_.Quantity + " x " + _loc6_.name,_loc2_.target,20,undefined,_loc8_);
   }
};
_loc1.out = function(_loc2_)
{
   this._mcList.gapi.hideTooltip();
};
_loc1.click = function(_loc2_)
{
   var _loc2_ = _loc2_.target.contentData;
   if(Key.isDown(dofus["\x12\x03"].CHAT_INSERT_ITEM_KEY) && _loc2_ != undefined)
   {
      this._mcList._parent.gapi.api.kernel.GameManager.insertItemInChat(_loc2_);
   }
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
