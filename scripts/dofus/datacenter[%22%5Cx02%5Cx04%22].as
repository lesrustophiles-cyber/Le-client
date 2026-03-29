var _loc1 = _global.dofus.datacenter["\x02\x04"].prototype;
_loc1.getActionFunction = function(_loc2_)
{
   switch(_loc2_)
   {
      case 1:
         return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[0,this.id]};
      case 2:
         return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[2,this.id]};
      case 3:
         return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startDialog,params:[this.id]};
      case 4:
         return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[9,this.id]};
      case 5:
         return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[10,this.id]};
      case 6:
         return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[11,this.id]};
      case 7:
         return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[17,this.id]};
      case 8:
         return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[18,this.id]};
      case 9:
         return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[19,this.id]};
      case 10:
         return {object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.startExchange,params:[20,this.id]};
      default:
         return new Object();
   }
};
