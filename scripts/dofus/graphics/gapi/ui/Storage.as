var _loc1 = dofus["\r\x13"].gapi.ui.Storage.prototype;
var interval;
var list = "";
var size = 0;
var a = 0;
var active = false;
_loc1.transfertToBankAll = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      this.api.kernel.showMessage("Information","Transfert terminé.","ERROR_BOX",{name:"noItem",listener:this});
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO+" + _loc2_);
   a += 1;
};
_loc1.transfertToInvAll = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      this.api.kernel.showMessage("Information","Transfert terminé","ERROR_BOX",{name:"noItem",listener:this});
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO-" + _loc2_);
   a += 1;
};
_loc1.transfertToBank = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO+" + _loc2_);
   a += 1;
};
_loc1.over = function(_loc2_)
{
   switch(_loc2_.target._name)
   {
      case "_btnTransfertToLeft":
         this.api.ui.showTooltip(this.api.lang.getText("TRANSFERT_TO_THE_LEFT"),_loc2_.target,-20);
         break;
      case "_btnTransfertToRight":
         this.api.ui.showTooltip(this.api.lang.getText("TRANSFERT_TO_THE_RIGHT"),_loc2_.target,-20);
   }
};
_loc1.out = function(_loc2_)
{
   this.api.ui.hideTooltip();
};
_loc1.transfertToInv = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO-" + _loc2_);
   a += 1;
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._ivInventoryViewer.addEventListener("selectedItem",this);
   this._ivInventoryViewer.addEventListener("dblClickItem",this);
   this._ivInventoryViewer.addEventListener("dropItem",this);
   this._ivInventoryViewer.addEventListener("dragKama",this);
   this._ivInventoryViewer2.addEventListener("selectedItem",this);
   this._ivInventoryViewer2.addEventListener("dblClickItem",this);
   this._ivInventoryViewer2.addEventListener("dropItem",this);
   this._ivInventoryViewer2.addEventListener("dragKama",this);
   this._btnMoveAll.addEventListener("click",this);
   if(this._oData != undefined)
   {
      this._oData.addEventListener("modelChanged",this);
   }
};
_loc1.initTexts = function()
{
   this._winInventory.title = this.api.datacenter.Player.data.name;
   if(this._bMount != true)
   {
      this._winInventory2.title = this.api.lang.getText("STORAGE");
   }
   else
   {
      this._winInventory2.title = this.api.lang.getText("MY_MOUNT");
   }
   this._btnMoveAll.label = this.api.lang.getText("MOVE_ALL");
};
_loc1.click = function(oEvent)
{
   var _loc2_;
   var _loc4_;
   switch(oEvent.target._name)
   {
      case "_btnTransfertToLeft":
         if(active == true)
         {
            clearInterval(interval);
            active = false;
         }
         else
         {
            for(var _loc3_ in this._ivInventoryViewer._cgGrid.dataProvider)
            {
               _loc2_ = this._ivInventoryViewer._cgGrid.dataProvider[_loc3_];
               if(list.length > 0)
               {
                  list += ";";
               }
               list += _loc2_.ID + "|" + _loc2_.Quantity;
            }
            list = list.split(";");
            size = list.length;
            interval = setInterval(this,"transfertToBankAll",200);
            active = true;
         }
         break;
      case "_btnTransfertToRight":
         if(active == true)
         {
            clearInterval(interval);
            active = false;
         }
         else
         {
            for(_loc3_ in this._ivInventoryViewer2._cgGrid.dataProvider)
            {
               _loc2_ = this._ivInventoryViewer2._cgGrid.dataProvider[_loc3_];
               if(list.length > 0)
               {
                  list += ";";
               }
               list += _loc2_.ID + "|" + _loc2_.Quantity;
            }
            list = list.split(";");
            size = list.length;
            interval = setInterval(this,"transfertToInvAll",200);
            active = true;
         }
         break;
      case "_btnMoveAll":
         _loc4_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoMoveAll",{title:this.api.lang.getText("MOVE_ALL"),text:this.api.lang.getText("YOU_ARE_SURE_MOVE_ALL"),params:{}});
         _loc4_.addEventListener("yes",this);
         break;
      case "_btnClose":
         this.callClose();
   }
};
_loc1.yes = function(oEvent)
{
   var _loc6_ = new Array();
   var _loc2_;
   for(var _loc7_ in this._ivInventoryViewer.dataInfo)
   {
      _loc2_ = this._ivInventoryViewer.dataInfo[_loc7_];
      _loc6_.push({Add:true,ID:_loc2_.ID,Quantity:_loc2_.Quantity});
   }
   this.api.network.Exchange.movementItems(_loc6_);
};
_loc1.dblClickItem = function(_loc2_)
{
   var _loc4_ = _loc2_.item;
   var _loc3_ = _loc2_.targets;
   if(_loc4_ == undefined)
   {
      return undefined;
   }
   var _loc5_ = Key.isDown(dofus["\x12\x03"].SELECT_MULTIPLE_ITEMS_KEY);
   switch(_loc2_.target._name)
   {
      case "_ivInventoryViewer":
         if(_loc5_ && _loc3_.length > 1)
         {
            if(active == true)
            {
               clearInterval(interval);
               active = false;
            }
            else
            {
               for(_loc4_ in _loc3_)
               {
                  _loc2_ = _loc3_[_loc4_];
                  if(list.length > 0)
                  {
                     list += ";";
                  }
                  list += _loc2_.ID + "|" + _loc2_.Quantity;
               }
               list = list.split(";");
               size = list.length;
               interval = setInterval(this,"transfertToBank",200);
               active = true;
            }
         }
         else
         {
            this.moveItem(_loc4_,true,_loc5_);
         }
         break;
      case "_ivInventoryViewer2":
         if(_loc5_ && _loc3_.length > 1)
         {
            if(active == true)
            {
               clearInterval(interval);
               active = false;
            }
            else
            {
               for(_loc4_ in _loc3_)
               {
                  _loc2_ = _loc3_[_loc4_];
                  if(list.length > 0)
                  {
                     list += ";";
                  }
                  list += _loc2_.ID + "|" + _loc2_.Quantity;
               }
               list = list.split(";");
               size = list.length;
               interval = setInterval(this,"transfertToInv",200);
               active = true;
            }
         }
         this.moveItem(_loc4_,false,_loc5_);
   }
};
