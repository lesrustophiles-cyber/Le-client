var _loc1 = _global.dofus["\r\x13"].gapi.ui.EditPlayer.prototype;
_loc1.__set__Precio = function(sData)
{
   this.Price = sData;
};
_loc1.ColorNombre = function(bVisible)
{
   this._csColorsName._visible = bVisible;
   if(this._bEditColors)
   {
      this._csColors._visible = !bVisible;
   }
   this.ValorC = bVisible;
};
_loc1.addListeners = function()
{
   this._mcRandomName.onPress = function()
   {
      ref.click({target:this});
   };
   this._mcRandomName.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcRandomName.onRollOut = function()
   {
      ref.out({target:this});
   };
   this._btnColorName.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnValidate.addEventListener("click",this);
   this._btnClose.addEventListener("click",this);
   this._itCharacterName.addEventListener("change",this);
   this._csColors.addEventListener("change",this);
   this._csColors.addEventListener("over",this);
   this._csColors.addEventListener("out",this);
   this._csColorsName.addEventListener("change",this);
};
_loc1.change = function(_loc2_)
{
   var _loc3_;
   var _loc4_;
   var _loc2_;
   switch(_loc2_.target)
   {
      case this._csColorsName:
         this.setColorsName(_loc2_.value);
         break;
      case this._csColors:
         this.setColors(_loc2_.value);
         break;
      case this._itCharacterName:
         _loc3_ = this._itCharacterName.text;
         if(!this.api.datacenter.Player.isAuthorized)
         {
            _loc3_ = _loc3_.substr(0,1).toUpperCase() + _loc3_.substr(1);
            _loc4_ = _loc3_.substr(0,1);
            _loc2_ = 1;
            while(_loc2_ < _loc3_.length)
            {
               if(_loc3_.substr(_loc2_ - 1,1) != "-")
               {
                  _loc4_ += _loc3_.substr(_loc2_,1).toLowerCase();
               }
               else
               {
                  _loc4_ += _loc3_.substr(_loc2_,1);
               }
               _loc2_ += 1;
            }
            this._itCharacterName.removeEventListener("change",this);
            this._itCharacterName.text = _loc4_;
            this._itCharacterName.textColor = this._nColorName;
            this._itCharacterName.addEventListener("change",this);
            break;
         }
   }
};
_loc1.setColorsName = function(oColors)
{
   this._nColorName = Number(oColors.color1);
   this._itCharacterName.textColor = this._nColorName;
};
_loc1.initComponent = function()
{
   this._csColorsName.applyColor(this._nColorName,1);
   this._csColorsName._visible = false;
   this._btnCloseC._visible = false;
   this._winBgColor._visible = false;
   if(this._bForce)
   {
      this._btnClose._visible = false;
      this._btnCancel._visible = false;
   }
   if(!this._bEditName)
   {
      this._itCharacterName.enabled = false;
      this._mcRandomName._visible = false;
      this._mcItCharacterNameBg._visible = false;
      this._btnColorName._visible = false;
      this._winBgColor._visible = false;
   }
   if(!this._bEditColors)
   {
      this._lblCharacterColors._visible = false;
      this._csColors._visible = false;
   }
   this.characterName = this.api.datacenter.Player.Name;
   var _loc2_ = this.api.datacenter.Player.data;
   var _loc3_;
   var _loc4_;
   if(_loc2_ == undefined)
   {
      this._svCharacter._visible = false;
      this._csColors._visible = false;
   }
   else
   {
      this._oColors = {color1:_loc2_.color1,color2:_loc2_.color2,color3:_loc2_.color3};
      this._svCharacter.zoom = 250;
      this._svCharacter.spriteAnims = ["StaticF","StaticR","StaticL","WalkF","RunF","Anim2R","Anim2L"];
      this._svCharacter.refreshDelay = 50;
      this._svCharacter.useSingleLoader = true;
      _loc3_ = this.api.datacenter.Player.Guild;
      _loc4_ = this.api.datacenter.Player.Sex;
      this._csColors.breed = _loc3_;
      this._csColors.sex = _loc4_;
      this._csColors.colors = [_loc2_.color1,_loc2_.color2,_loc2_.color3];
      this._svCharacter.spriteData = new ank.battlefield.datacenter["\x1e\x0e\x12"]("1",undefined,dofus["\x12\x03"].CLIPS_PERSOS_PATH + _loc3_ + _loc4_ + ".swf",undefined,5);
      this._svCharacter.setColors(this._oColors);
   }
   this._btnValidate.label = this.api.lang.getText("VALIDATE");
};
_loc1.validateNameEdit = function()
{
   var _loc2_ = this._itCharacterName.text;
   var _loc7_ = this._itCharacterName.textColor;
   if(_loc2_.length == 0 || _loc2_ == undefined)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("NEED_CHARACTER_NAME"),"ERROR_BOX",{name:"CREATENONAME"});
      return undefined;
   }
   if(_loc2_.length > 20)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("LONG_CHARACTER_NAME",[_loc2_,20]),"ERROR_BOX");
      return undefined;
   }
   var _loc4_;
   var _loc5_;
   var _loc3_;
   if(this.api.lang.getConfigText("CHAR_NAME_FILTER") && !this.api.datacenter.Player.isAuthorized)
   {
      _loc4_ = new dofus["\x1e\n\t"]["\b\x18"]["\b\x19"](_loc2_);
      _loc5_ = new dofus["\x1e\n\t"]["\b\x18"]["\x1e\x15\x02"].NameCheckerCharacterNameRules();
      _loc3_ = _loc4_.isValidAgainstWithDetails(_loc5_);
      if(!_loc3_.IS_SUCCESS)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("INVALID_CHARACTER_NAME") + "\r\n" + _loc3_.toString("\r\n"),"ERROR_BOX");
         return undefined;
      }
   }
   this.api.network.send("ZsN" + this._itCharacterName.text + ";" + this._nColorName);
};
_loc1.initTexts = function()
{
   this._precio.text = "Prix: " + this.Price;
   this._winBg.title = this.api.lang.getText("CUSTOMIZE");
   this._lblTitle.text = this.api.lang.getText("CREATE_TITLE");
   this._lblCharacterColors.text = this.api.lang.getText("SPRITE_COLORS");
   this._lblCharacterName.text = this.api.lang.getText("CREATE_CHARACTER_NAME");
   this._btnCancel.label = this.api.lang.getText("BACK");
   this._btnColorName.label = "Color";
   this._btnValidate.label = this.api.lang.getText("VALIDATE");
};
_loc1.addProperty("precio",function()
{
}
,_loc1.__set__Precio);
_loc1.ValorC = false;
_loc1.Price = 0;
_loc1._nColorName = -1;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x13"].gapi.ui.EditPlayer.CLASS_NAME = "Edit";
