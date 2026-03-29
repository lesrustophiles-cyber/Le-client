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
_global.dofus["\r\x13"].gapi.ui.PosPelea = function()
{
   super();
};
dofus["\r\x13"].gapi.ui.PosPelea.prototype = new ank.gapi.core["\x1e\n\x0e"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.PosPelea.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.PosPelea.CLASS_NAME);
};
_loc1.callClose = function()
{
   this.api.gfx.clearPointer();
   this.api.gfx.unSelectAllButOne("startPosition");
   this.api.ui.removeCursor();
   this.api.gfx.setInteraction(ank.battlefield["\x12\x03"].INTERACTION_CELL_RELEASE_OVER_OUT);
   this.api.datacenter.Game.setInteractionType("move");
   this.api.kernel.DebugConsole.process("HIDE_POSITIONS");
   _global.COLOR_POS_PELEA = undefined;
   ank.battlefield.mc.Zone.ALPHA = 30;
   this.api.ui.unloadUIComponent("PosPelea");
   return true;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.activar});
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.activar = function()
{
   ank.battlefield.mc.Zone.ALPHA = 100;
   this.api.kernel.DebugConsole.process("SHOW_FIGHTPOS");
   this.api.gfx.clearPointer();
   this.api.datacenter.Game.setInteractionType("fightpos");
   this.api.gfx.setInteraction(ank.battlefield["\x12\x03"].INTERACTION_CELL_RELEASE_OVER_OUT);
   this.api.ui.removeCursor();
   this.api.datacenter.Basics.gfx_canLaunch = false;
   dofus["\x10\x15"].getInstance().forceMouseOver();
   _global.COLOR_POS_PELEA = 2;
   this._btnTeam2.selected = false;
   this._btnBorrar.selected = false;
   this._btnCercado.selected = false;
   this._btnTeam1.selected = true;
   this.api.gfx.addPointerShape("C",0,255,this.api.datacenter.Player.data.cellNum);
};
_loc1.addListeners = function()
{
   this._btnTactico.addEventListener("click",this);
   this._btnClose.addEventListener("click",this);
   this._btnRefresh.addEventListener("click",this);
   this._btnTeam1.addEventListener("click",this);
   this._btnTeam2.addEventListener("click",this);
   this._btnBorrar.addEventListener("click",this);
   this._btnCercado.addEventListener("click",this);
};
_loc1.click = function(oEvent)
{
   loop0:
   switch(oEvent.target._name)
   {
      case "_btnClose":
      case "_btnCancel":
         this.callClose();
         break;
      case "_btnTactico":
         this.api.gfx.activarModoTactico(this._btnTactico.selected);
         break;
      case "_btnTeam1":
      case "_btnTeam2":
      case "_btnBorrar":
      case "_btnCercado":
         this._btnTeam1.selected = false;
         this._btnTeam2.selected = false;
         this._btnBorrar.selected = false;
         this._btnCercado.selected = false;
         oEvent.target.selected = true;
         switch(oEvent.target)
         {
            case this._btnTeam1:
               _global.COLOR_POS_PELEA = 2;
               this.api.gfx.addPointerShape("C",0,255,this.api.datacenter.Player.data.cellNum);
               break loop0;
            case this._btnTeam2:
               _global.COLOR_POS_PELEA = 1;
               this.api.gfx.addPointerShape("C",0,16711680,this.api.datacenter.Player.data.cellNum);
               break loop0;
            case this._btnBorrar:
               _global.COLOR_POS_PELEA = 3;
               this.api.gfx.addPointerShape("C",0,16777215,this.api.datacenter.Player.data.cellNum);
               break loop0;
            case this._btnCercado:
               _global.COLOR_POS_PELEA = 4;
               this.api.gfx.addPointerShape("C",0,65280,this.api.datacenter.Player.data.cellNum);
         }
   }
};
_loc1.objeto = new Object();
_global.dofus["\r\x13"].gapi.ui.PosPelea.CLASS_NAME = "PosPelea";
