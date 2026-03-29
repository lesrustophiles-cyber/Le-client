var a = [2071,202,809,2020];
var n = Math.floor(a.length * Math.random());
this._btnCerrar._visible = true;
this._btnEffect.loadMovie("clips/spells/" + a[n] + ".swf");
var allitems = this.itemsdb;
var _loc4_ = new _global.palmad.dofus.datacenter.Items(0,allitems.split(",")[0],1,-1,-1);
this.item1.contentData = _loc4_;
api = _global.API;
api.ui.getUIComponent("LootBox").reiniciame(api.ui.getUIComponent("LootBox").valueS);
