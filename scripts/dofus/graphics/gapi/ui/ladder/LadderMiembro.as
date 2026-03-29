if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.graphics)
{
   _global.dofus.graphics = new Object();
}
if(!dofus.graphics.gapi)
{
   _global.dofus.graphics.gapi = new Object();
}
if(!dofus.graphics.gapi.ui)
{
   _global.dofus.graphics.gapi.ui = new Object();
}
if(!dofus.graphics.gapi.ui.ladder)
{
   _global.dofus.graphics.gapi.ui.ladder = new Object();
}
_global.dofus.graphics.gapi.ui.ladder.LadderMiembro = function()
{
   super();
};
dofus.graphics.gapi.ui.ladder.LadderMiembro.prototype = new ank.gapi.core.UIBasicComponent();
var _loc1 = _global.dofus.graphics.gapi.ui.ladder.LadderMiembro.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   var _loc4_;
   if(bUsed)
   {
      this._oItem = oItem;
      this._lblNro.text = oItem.nro;
      if(oItem.gfx != undefined && oItem.gfx != "")
      {
         this._ldrGuild.contentPath = dofus.Constants.GUILDS_MINI_PATH + oItem.gfx + ".swf";
      }
      else
      {
         this._ldrGuild.contentPath = "";
      }
      if(oItem.emblema != undefined)
      {
         _loc4_ = oItem.emblema.split(",");
         this._eEmblem._visible = true;
         this._eEmblem.backID = _global.parseInt(_loc4_[0],36);
         this._eEmblem.backColor = _global.parseInt(_loc4_[1],36);
         this._eEmblem.upID = _global.parseInt(_loc4_[2],36);
         this._eEmblem.upColor = _global.parseInt(_loc4_[3],36);
         this._lblRank.text = oItem.titulo;
      }
      else
      {
         this._lblRank.text = this.getTitulo(oItem.titulo);
         this._eEmblem._visible = false;
      }
      this._lblName.text = oItem.nombre;
      this._Liston._visible = oItem.omega <= 0 ? false : true;
      this._lblLevel.styleName = oItem.omega <= 0 ? "BrownCenterSmallLabel" : "BrownCenterSmallLabel";
      this._lblLevel.text = oItem.nivel;
      this._lblWinXP.text = oItem.experiencia;
      this._mcFight._visible = oItem.estado == 2;
      this._mcOffline._visible = oItem.estado == 0;
      if(oItem.alineacion != undefined && oItem.alineacion != "")
      {
         this._ldrAlignement.contentPath = dofus.Constants.ALIGNMENTS_MINI_PATH + oItem.alineacion + ".swf";
      }
      if(oItem.cote != undefined && oItem.cote != "")
      {
         this._lblCote.text = oItem.cote;
      }
      this._mcSearch._visible = oItem.buscado == true;
   }
   else if(this._lblNro.text != undefined)
   {
      this._lblNro.text = "";
      this._lblName.text = "";
      this._lblRank.text = "";
      this._lblLevel.text = "";
      this._lblWinXP.text = "";
      this._ldrGuild.contentPath = "";
      this._ldrAlignement.contentPath = "";
      this._mcFight._visible = false;
      this._mcOffline._visible = false;
      this._mcSearch._visible = false;
      this._eEmblem._visible = false;
      this._Liston._visible = false;
      this._lblCote.text = "";
   }
};
_loc1.getTitulo = function(sData)
{
   if(sData == undefined || sData == "0")
   {
      return "";
   }
   var _loc3_ = "";
   var _loc4_ = Number(sData.split("~")[0]);
   var _loc5_ = sData.split("~")[1];
   switch(this._mcList.gapi.api.lang.getTitle(_loc4_).pt)
   {
      case 1:
         _loc3_ = this._mcList.gapi.api.lang.getTitle(_loc4_).t.split("%1").join(this._mcList.gapi.api.lang.getMonsters()[_global.parseInt(_loc5_)].n);
         break;
      case 0:
      default:
         _loc3_ = this._mcList.gapi.api.lang.getTitle(_loc4_).t.split("%1").join(_loc5_);
   }
   return _loc3_;
};
_loc1.init = function()
{
   super.init(false);
   this._mcFight._visible = false;
   this._mcOffline._visible = false;
   this._mcSearch._visible = false;
   this._Liston._visible = false;
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
