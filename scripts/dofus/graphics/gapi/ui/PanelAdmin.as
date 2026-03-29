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
_global.dofus["\r\x13"].gapi.ui.PanelAdmin = function()
{
   super();
};
dofus["\r\x13"].gapi.ui.PanelAdmin.prototype = new ank.gapi.core["\x1e\n\x0e"]();
var _loc1 = _global.dofus["\r\x13"].gapi.ui.PanelAdmin.prototype;
_loc1.__set__Data = function(sValue)
{
   if(sValue == undefined)
   {
      sValue = "";
   }
   this._sData = sValue;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x13"].gapi.ui.PanelAdmin.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initData = function()
{
   var _loc4_ = this._sData.split("|");
   var _loc3_ = Number(_loc4_[0]);
   var _loc6_ = Number(_loc4_[1]);
   var _loc7_ = Number(_loc4_[2]);
   var _loc5_ = Number(_loc4_[3]);
   if(_global.isNaN(p))
   {
      p = Number(0);
   }
   if(_global.isNaN(_loc6_))
   {
      _loc6_ = Number(0);
   }
   if(_global.isNaN(_loc7_))
   {
      _loc7_ = Number(0);
   }
   if(_global.isNaN(_loc5_))
   {
      _loc5_ = Number(0);
   }
   this._btnAgresion.selected = (_loc3_ & 1) != 1;
   this._btnArena.selected = (_loc3_ & 2) == 2;
   this._btnMazmorra.selected = (_loc3_ & 4) == 4;
   this._btnDesafio.selected = (_loc3_ & 8) != 8;
   this._btnRecaudador.selected = (_loc3_ & 0x10) != 16;
   this._btnMercante.selected = (_loc3_ & 0x20) != 32;
   this._itMaxGrupoMobs.text = _loc6_;
   this._itMaxMobs.text = _loc7_;
   this._itMaxMercantes.text = _loc5_;
   this._itTipoPelea.text = "4";
   this._itArgsFinPelea.text = "MapID,CellID";
   this._itAccionFinPelea.text = "0";
   this._itMapaFinPelea.text = this.api.datacenter.Map.id;
};
_loc1.addListeners = function()
{
   this._btnCerrar.addEventListener("click",this);
   this._btnClose.addEventListener("click",this);
   this._btnMaxGrupoMobs.addEventListener("click",this);
   this._btnMaxMobs.addEventListener("click",this);
   this._btnMaxMercantes.addEventListener("click",this);
   this._btnParametros.addEventListener("click",this);
   this._btnBorrarPosPelea.addEventListener("click",this);
   this._btnCambiarKey.addEventListener("click",this);
   this._btnTriggers.addEventListener("click",this);
   this._btnPosPelea.addEventListener("click",this);
   this._btnAddDrops.addEventListener("click",this);
   this._btnBorrarMobsNormal.addEventListener("click",this);
   this._btnBorrarMobsFijos.addEventListener("click",this);
   this._btnAddMobsNormal.addEventListener("click",this);
   this._btnFinPelea.addEventListener("click",this);
   this._btnMobStats.addEventListener("click",this);
   this._btnPanelNPC.addEventListener("click",this);
   this._btnParametros.addEventListener("over",this);
   this._btnBorrarPosPelea.addEventListener("over",this);
   this._btnCambiarKey.addEventListener("over",this);
   this._btnTriggers.addEventListener("over",this);
   this._btnPosPelea.addEventListener("over",this);
   this._btnAddDrops.addEventListener("over",this);
   this._btnBorrarMobsNormal.addEventListener("over",this);
   this._btnBorrarMobsFijos.addEventListener("over",this);
   this._btnAddMobsNormal.addEventListener("over",this);
   this._btnPanelNPC.addEventListener("over",this);
   this._btnMobStats.addEventListener("over",this);
   this._btnParametros.addEventListener("out",this);
   this._btnBorrarPosPelea.addEventListener("out",this);
   this._btnCambiarKey.addEventListener("out",this);
   this._btnTriggers.addEventListener("out",this);
   this._btnPosPelea.addEventListener("out",this);
   this._btnAddDrops.addEventListener("out",this);
   this._btnBorrarMobsNormal.addEventListener("out",this);
   this._btnBorrarMobsFijos.addEventListener("out",this);
   this._btnAddMobsNormal.addEventListener("out",this);
   this._btnPanelNPC.addEventListener("out",this);
};
this._btnMobStats.addEventListener("out",this);
_loc1.initTexts = function()
{
   this._winBackground.title = "PANEL ADMIN";
   this._btnParametros.label = "PARAMETERS";
   this._btnMaxGrupoMobs.label = "MODIFY";
   this._btnMaxMobs.label = "MODIFY";
   this._btnMaxMercantes.label = "MODIFY";
   this._btnTriggers.label = "PANEL TRIGGERS";
   this._btnPosPelea.label = "PANEL CELLS FIGHTERS";
   this._btnAddDrops.label = "PANEL ADD DROPS MOB";
   this._btnBorrarPosPelea.label = "DELETE CELLS FIGHTERS";
   this._btnCambiarKey.label = "CHANGE VERSION MAP";
   this._btnBorrarMobsNormal.label = "DELETE MOBS NORMAL";
   this._btnBorrarMobsFijos.label = "DELETE MOBS FIXES";
   this._btnAddMobsNormal.label = "ADD GROUP MOBS";
   this._btnPanelNPC.label = "PANEL MODIFY NPC";
   this._btnMobStats.label = "MODIFY STATS MOBS";
   this._btnFinPelea.label = "OK";
};
_loc1.over = function(oEvent)
{
   var _loc2_ = "";
   switch(oEvent.target)
   {
      case this._btnParametros:
         _loc2_ = "MODIFY THE PARAMETERS IN THE MAP";
         break;
      case this._btnBorrarPosPelea:
         _loc2_ = "DELETE ALL CELLS FIGHTERS OF THE MAP";
         break;
      case this._btnCambiarKey:
         _loc2_ = "IF THE MAP IS EMPTY, YOU CAN TRY USE OTHER VERSION MAP";
         break;
      case this._btnTriggers:
         _loc2_ = "OPEN THE PANEL FOR ADD/DELETE TRIGGERS";
         break;
      case this._btnPosPelea:
         _loc2_ = "OPEN THE PANEL FOR ADD/DELETE POSITIONS FIGHTERS";
         break;
      case this._btnAddDrops:
         _loc2_ = "OPEN THE PANEL FOR ADD DROPS TO A MOB";
         break;
      case this._btnBorrarMobsNormal:
         _loc2_ = "DELETE ALL MOBS NORMAL (MOBS ALEATORIES), NOT FIXES (SPECIFIED MOBS)";
         break;
      case this._btnBorrarMobsFijos:
         _loc2_ = "DELETE ALL MOBS FIXES (SPECIFIED MOBS), NOT NORMALS (MOBS ALEATORIES)";
         break;
      case this._btnAddMobsNormal:
         _loc2_ = "OPEN THE PANEL FOR ADD GROUP MOBS (OPTION SAVE SQL)";
         break;
      case this._btnMobStats:
         _loc2_ = "OPEN THE PANEL FOR MODIFY AND TEST THE STATS OF ALL MOBS (CALCULADORA)";
         break;
      case this._btnPanelNPC:
         _loc2_ = "OPEN THE PANEL FOR MODIFY NPC TEMPLATES";
   }
   this.gapi.showTooltip(_loc2_,oEvent.target,-20,{bXLimit:true,bYLimit:false});
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.click = function(oEvent)
{
   var _loc2_;
   switch(oEvent.target)
   {
      case this._btnCerrar:
         this.api.ui.unloadUIComponent("PanelAdmin");
         break;
      case this._btnPanelNPC:
         this.api.ui.loadUIComponent("PanelNPC","PanelNPC");
         break;
      case this._btnTriggers:
         this.api.ui.loadUIComponent("Triggers","Triggers");
         break;
      case this._btnPosPelea:
         this.api.ui.loadUIComponent("PosPelea","PosPelea");
         break;
      case this._btnAddMobsNormal:
         this.api.ui.loadUIComponent("SpawnMobs","SpawnMobs");
         break;
      case this._btnAddDrops:
         this.api.ui.loadUIComponent("AgregarDrops","AgregarDrops");
         break;
      case this._btnMobStats:
         this.api.ui.loadUIComponent("MobStats","MobStats");
         break;
      case this._btnCambiarKey:
         this.api.kernel.DebugConsole.process("RELOADMAP");
         break;
      default:
         break;
      case this._btnParametros:
         _loc2_ = 0;
         if(!this._btnAgresion.selected)
         {
            _loc2_ += 1;
         }
         if(this._btnArena.selected)
         {
            _loc2_ += 2;
         }
         if(this._btnMazmorra.selected)
         {
            _loc2_ += 4;
         }
         if(!this._btnDesafio.selected)
         {
            _loc2_ += 8;
         }
         if(!this._btnRecaudador.selected)
         {
            _loc2_ += 16;
         }
         if(!this._btnMercante.selected)
         {
            _loc2_ += 32;
         }
         this.api.kernel.DebugConsole.process("MAPA_PARAMETROS " + _loc2_);
         return undefined;
      case this._btnBorrarPosPelea:
         this.api.kernel.DebugConsole.process("ELIMINAR_POSICIONES");
         return undefined;
      case this._btnBorrarMobsNormal:
         this.api.kernel.DebugConsole.process("BORRAR_MOBS");
         return undefined;
      case this._btnBorrarMobsFijos:
         this.api.kernel.DebugConsole.process("BORRAR_MOBS_FIJOS");
         return undefined;
      case this._btnMaxGrupoMobs:
         this.api.kernel.DebugConsole.process("MAX_GRUPO_MOBS " + this._itMaxGrupoMobs.text);
         return undefined;
      case this._btnMaxMobs:
         this.api.kernel.DebugConsole.process("MAX_MOBS_POR_GRUPO " + this._itMaxMobs.text);
         return undefined;
      case this._btnMaxMercantes:
         this.api.kernel.DebugConsole.process("MAX_MERCANTES " + this._itMaxMercantes.text);
         return undefined;
      case this._btnFinPelea:
         this.api.kernel.DebugConsole.process("ADD_ACTION_END_FIGHT " + this._itTipoPelea.text + " " + this._itAccionFinPelea.text + " " + this._itArgsFinPelea.text + "  " + this._itMapaFinPelea.text);
         return undefined;
   }
   this.api.ui.unloadUIComponent("PanelAdmin");
};
_loc1._sData = "";
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.ui.PanelAdmin.CLASS_NAME = "PanelAdmin";
