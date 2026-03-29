onClipEvent(load){
   function __f_click(eventObj)
   {
      _parent.elegirSet(eventObj);
   }
   this.addEventListener("selectItem",__f_click);
}
