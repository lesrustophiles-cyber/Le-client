onClipEvent(load){
   function __f_click(eventObj)
   {
      _parent.elegirIcono(eventObj);
   }
   this.addEventListener("selectItem",__f_click);
}
