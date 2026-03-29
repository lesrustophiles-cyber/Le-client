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
_global.dofus["\r\x13"].gapi.ui.Edit = function()
{
   super();
};
dofus["\r\x13"].gapi.ui.Edit.prototype = new ank.gapi.core["\x1e\n\x0e"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.Edit.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.Edit.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnAll.addEventListener("click",this);
   this._btnName.addEventListener("click",this);
   this._btnColor.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._lblDescription.text = this.api.lang.getText("EditPlayerDescription");
   this._winBg.title = this.api.lang.getText("CUSTOMIZE");
   this._btnAll.label = this.api.lang.getText("EditPlayer_all");
   this._btnName.label = this.api.lang.getText("EditPlayer_name");
   this._btnColor.label = this.api.lang.getText("EditPlayerDescription");
};
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.ui.Edit.CLASS_NAME = "Edit";
