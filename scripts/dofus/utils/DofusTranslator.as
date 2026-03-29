var _loc1 = _global.dofus["\x1e\n\t"]["\x10\x12"].prototype;
_loc1.getNpcs = function()
{
   return this.getValueFromSOXtra("N").d;
};
_loc1.getSpells = function()
{
   return this.getValueFromSOXtra("S");
};
_loc1.getItemsSets = function()
{
   return this.getValueFromSOXtra("IS");
};
_loc1.getDialogQuestions = function()
{
   return this.getValueFromSOXtra("D").q;
};
_loc1.getDialogResponses = function()
{
   return this.getValueFromSOXtra("D").a;
};
_loc1.getListaReportes = function()
{
   return this.getValueFromSOLang("RB");
};
_loc1.getListaMapasPorCoord = function(sKey)
{
   return this.getValueFromSOXtra("MA").r[sKey];
};
_loc1.getNonPlayableCharacters = function()
{
   return this.getValueFromSOXtra("N").d;
};
_loc1.getItemsCreados = function(nId)
{
   return this.getValueFromSOXtra("I").oc[nId];
};
_loc1.getItemUnicText = function(nKey)
{
   return this.getValueFromSOXtra("I").u[nKey];
};
_loc1.getComunidades = function()
{
   COM = new Array();
   COM[0] = {n:"Frances",i:0,d:true,c:["FR","CH","BE","LU"]};
   COM[1] = {n:"Reino Unido",i:1,d:true,c:["UK","IE","GB"]};
   COM[2] = {n:"Internacional",i:2,d:true,c:["XX","EN"]};
   COM[3] = {n:"Aleman",i:3,d:true,c:["DE","AT","LI"]};
   COM[5] = {n:"Ruso",i:5,d:true,c:["RU"]};
   COM[4] = {n:"Español",i:4,d:true,c:["ES","AD","AR","CK","MX"]};
   COM[6] = {n:"Brasileño",i:6,d:true,c:["PT","BR"]};
   COM[7] = {n:"Holandes",i:7,d:true,c:["NL"]};
   COM[9] = {n:"Italiano",i:9,d:true,c:["IT"]};
   COM[10] = {n:"Japones",i:10,d:true,c:["JP"]};
   COM[99] = {n:"Test",i:99,d:false,c:[]};
   return COM;
};
_loc1.getValueFromSOMapData = function(sKey)
{
   var _loc2_ = _global["MAP_" + sKey];
   if(_loc2_ == undefined)
   {
      _global["MAP_" + sKey] = ank["\x1e\n\t"].SharedObjectFix.getLocal("MAP_" + sKey);
      _loc2_ = _global["MAP_" + sKey];
   }
   return _loc2_;
};
