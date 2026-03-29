var _loc1 = ank.battlefield.datacenter["\x13\n"].prototype;
_loc1.__get__isTactic = function(_loc2_)
{
   _loc2_ = false;
   if(this.layerGroundNum == 0 && (this.groundSlope == 1 && (this.layerObject2Num == 0 || (this.layerObject2Num == dofus["\x12\x03"].getTacticLayerObject2(_loc2_.subarea) || (this.layerObject2Num == 25 || this.layerObject2Num == 1030)))))
   {
      if(!this.lineOfSight)
      {
         if(this.layerObject1Num == dofus["\x12\x03"].getTacticGfx(_loc2_.subarea,0))
         {
            _loc2_ = true;
         }
      }
      else if(this.movement == 0 || this.movement == 1)
      {
         if(this.layerObject1Num == 10002)
         {
            _loc2_ = true;
         }
      }
      else if(this.layerObject1Num == dofus["\x12\x03"].getTacticGfx(_loc2_.subarea,1) || this.layerObject1Num == dofus["\x12\x03"].getTacticGfx(_loc2_.subarea,3))
      {
         _loc2_ = true;
      }
   }
   return _loc2_;
};
_loc1.turnTactic = function(_loc2_, _loc3_)
{
   var _loc5_ = this.isTrigger;
   if(this.nPermanentLevel == 0)
   {
      this.nPermanentLevel = 1;
   }
   this.layerGroundNum = 0;
   this.groundSlope = 1;
   this.layerObject1Rot = 0;
   var _loc4_;
   if(!this.lineOfSight)
   {
      this.layerObject1Num = dofus["\x12\x03"].getTacticGfx(_loc3_.subarea,0);
   }
   else if(this.movement == 0 || this.movement == 1)
   {
      this.layerObject1Num = 10002;
   }
   else
   {
      _loc2_ = ank.battlefield["\x1e\n\t"]["\x1e\x16\x1b"].getCaseCoordonnee(_loc2_,this.num);
      _loc4_ = Math.abs(_loc2_.x) % 2 == Math.abs(_loc2_.y) % 2;
      this.layerObject1Num = !_loc4_ ? dofus["\x12\x03"].getTacticGfx(_loc3_.subarea,3) : dofus["\x12\x03"].getTacticGfx(_loc3_.subarea,1);
   }
   if(this.layerObject2Num != 25)
   {
      if(!this.lineOfSight)
      {
         this.layerObject2Num = dofus["\x12\x03"].getTacticLayerObject2(_loc3_.subarea);
      }
      else if(_loc5_)
      {
         this.layerObject2Num = 1030;
      }
      else
      {
         this.layerObject2Num = 0;
      }
   }
};
_loc1.addProperty("isTactic",function()
{
}
,_loc1.__get__isTactic);
_loc1.estrellas = -1;
_loc1.layerTactico1_1 = 0;
_loc1.layerTactico1_2 = 0;
_loc1.layerTactico2_1 = 0;
_loc1.layerTactico2_2 = 0;
_loc1.oGroundSlope = 1;
