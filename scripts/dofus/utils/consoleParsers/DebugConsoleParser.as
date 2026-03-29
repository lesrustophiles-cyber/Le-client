var _loc1 = dofus["\x1e\n\t"]["\x12\x05"]["\x11\x06"].prototype;
_loc1.sound = new Sound();
_loc1.buscarXXX = function(sTipo, sBuscar, sKey, oValues)
{
   var _loc5_ = "Searching " + sKey + " with \"" + sBuscar + "\" :";
   var _loc3_ = 0;
   var _loc2_;
   for(var _loc7_ in oValues)
   {
      _loc2_ = oValues[_loc7_].n;
      if(_loc2_.toUpperCase().indexOf(sBuscar) != -1)
      {
         _loc3_ = _loc3_ + 1;
         if(_loc3_ > 50)
         {
            break;
         }
         _loc5_ += "\n<b>" + sTipo + "[" + _loc7_ + "]</b>= " + _loc2_;
      }
   }
   if(_loc3_ > 50)
   {
      this.api.kernel.showMessage(undefined,"Many questions similar, please specified better your search","DEBUG_LOG");
   }
   else if(_loc3_ == 0)
   {
      this.api.kernel.showMessage(undefined,"Nothing results","DEBUG_LOG");
   }
   else
   {
      _loc5_ += "\n==================================";
      this.api.kernel.showMessage(undefined,_loc5_,"DEBUG_LOG");
   }
};
_loc1.buscarDialogos = function(sTipo, sBuscar)
{
   var _loc4_ = 0;
   this._oBuscar = new Object();
   var _loc5_;
   if(sTipo == "A")
   {
      _loc5_ = this.api.lang.getDialogResponses();
   }
   else
   {
      _loc5_ = this.api.lang.getDialogQuestions();
   }
   var _loc3_ = "";
   this._oBuscar.buscar = "Searching with \"" + sBuscar + "\"";
   var _loc2_;
   for(var _loc10_ in _loc5_)
   {
      _loc2_ = _loc5_[_loc10_];
      if(_loc2_.toUpperCase().indexOf(sBuscar) != -1)
      {
         if(_loc4_ > 0)
         {
            _loc3_ += ",";
         }
         _loc3_ += _loc10_;
         _loc4_ = _loc4_ + 1;
         this._oBuscar[_loc10_] = {text:"<b>" + sTipo + "[" + _loc10_ + "]</b>= " + _loc2_,actions:""};
      }
   }
   if(_loc4_ > 50)
   {
      this.api.kernel.showMessage(undefined,"Many questions similar, please specified better your search","DEBUG_LOG");
      this._oBuscar = new Object();
   }
   else if(_loc4_ == 0)
   {
      this.api.kernel.showMessage(undefined,"Nothing results","DEBUG_LOG");
      this._oBuscar = new Object();
   }
   else if(sTipo == "A")
   {
      this.api.network.Basics.autorisedCommand("SHOW_ANSWERS " + _loc3_);
   }
   else
   {
      this.api.network.Basics.autorisedCommand("SHOW_QUESTIONS " + _loc3_);
   }
};
_loc1.cargarDialogo = function(sTipo, nID, sActions)
{
   if(this._oBuscar == undefined)
   {
      this._oBuscar = new Object();
   }
   trace("sActions " + sActions);
   var _loc3_;
   var _loc5_;
   if(this._oBuscar[nID] == undefined)
   {
      if(sTipo == "A")
      {
         _loc3_ = this.api.lang.getDialogResponses();
      }
      else
      {
         _loc3_ = this.api.lang.getDialogQuestions();
      }
      _loc5_ = _loc3_[nID];
      this._oBuscar[nID] = {text:"<b>" + sTipo + "[" + nID + "]</b>= " + _loc5_,actions:sActions};
      return undefined;
   }
   this._oBuscar[nID].actions = sActions;
};
_loc1.imprimirDialogos = function()
{
   var _loc2_ = "";
   if(this._oBuscar.buscar != undefined)
   {
      _loc2_ = this._oBuscar.buscar;
   }
   var _loc3_ = 0;
   for(var _loc4_ in this._oBuscar)
   {
      switch(_loc4_)
      {
         case "buscar":
         case "tipo":
            break;
         default:
            _loc3_ = _loc3_ + 1;
            if(_loc2_.length > 0)
            {
               _loc2_ += "\n";
            }
            _loc2_ += this._oBuscar[_loc4_].text + this._oBuscar[_loc4_].actions;
            break;
      }
   }
   this._oBuscar = new Object();
   if(_loc3_ > 0)
   {
      _loc2_ += "\n==================================";
   }
   else
   {
      _loc2_ = "Nothing searched";
   }
   this.api.kernel.showMessage(undefined,_loc2_,"DEBUG_LOG");
};
_loc1.process = function(sCmd)
{
   super.process(sCmd);
   var _loc4_;
   var _loc19_;
   var _loc28_;
   var _loc26_;
   var _loc21_;
   var _loc14_;
   var _loc32_;
   var _loc34_;
   var _loc38_;
   var _loc29_;
   var _loc40_;
   var _loc11_;
   var _loc13_;
   var _loc7_;
   var _loc39_;
   var _loc36_;
   var _loc37_;
   var _loc35_;
   var _loc33_;
   var _loc31_;
   var _loc8_;
   var _loc10_;
   var _loc24_;
   var _loc23_;
   var _loc22_;
   var _loc6_;
   var _loc27_;
   var _loc15_;
   var _loc5_;
   var _loc30_;
   var _loc12_;
   var _loc18_;
   var _loc9_;
   if(sCmd.charAt(0) == "/")
   {
      _loc4_ = sCmd.split(" ");
      _loc19_ = _loc4_[0].substr(1).toUpperCase();
      _loc4_.splice(0,1);
      switch(_loc19_)
      {
         case "RADIO":
            _loc28_ = _loc4_[0];
            _loc26_ = _loc4_[1];
            this.sound.stop();
            this.sound = new Sound();
            if(_loc26_ != undefined)
            {
               this.sound.checkPolicyFile = _loc26_;
            }
            this.sound.loadSound(_loc28_,true);
            sound.start();
            var i = 0;
            this.onEnterFrame = function()
            {
               trace("bytes " + sound.getBytesLoaded());
               i++;
               if(i > 20)
               {
                  delete this.onEnterFrame;
               }
            };
            trace("radio es " + _loc28_);
            break;
         case "INTERACTION_CELL":
            _loc21_ = Number(_loc4_[0]);
            if(_global.isNaN(_loc21_) || _loc21_ == undefined)
            {
               for(var _loc6_ in this.api.gfx.mapHandler.getCellsData())
               {
                  this.api.gfx.setInteractionOnCell(_loc6_,Number(_loc4_[1]));
               }
            }
            else
            {
               this.api.gfx.setInteractionOnCell(_loc21_,Number(_loc4_[1]));
            }
            this.api.kernel.showMessage(undefined,"SET INTERACTION CELL IS " + Number(_loc4_[1]),"DEBUG_LOG");
            break;
         case "GET_THIS":
            _loc4_ = _loc4_[0].split(".");
            _loc14_ = this;
            var i = 0;
            while(i < _loc4_.length)
            {
               _loc14_ = _loc14_[_loc4_[i]];
               i++;
            }
            _loc32_ = _loc4_.join(".");
            this.api.kernel.showMessage(undefined,"GET this." + _loc32_ + " = " + _loc14_,"DEBUG_LOG");
            break;
         case "GET_UI":
            _loc34_ = this.api.ui.getUIComponent(_loc4_[0]);
            this.api.kernel.showMessage(undefined,"GET UI" + _loc4_[0] + " = " + _loc34_,"DEBUG_LOG");
            break;
         case "GET_CURRENT_REAL_DATE":
            _loc38_ = this.api.kernel.NightManager.getCurrentRealDate();
            this.api.kernel.showMessage(undefined,"CURRENT REAL DATE = " + _loc38_,"DEBUG_LOG");
            break;
         case "GET_CURRENT_TIME":
            _loc38_ = this.api.kernel.NightManager.getCurrentTime();
            this.api.kernel.showMessage(undefined,"CURRENT TIME = " + _loc38_,"DEBUG_LOG");
            break;
         case "GET_DIFF_DATE":
            _loc38_ = this.api.kernel.NightManager.getDiffDate(Number(_loc4_[0]));
            this.api.kernel.showMessage(undefined,"DIFF DATE DE " + _loc4_[0] + " = " + _loc38_,"DEBUG_LOG");
            break;
         case "GET_CURRENT_DATE_STRING":
            _loc38_ = this.api.kernel.NightManager.getCurrentDateString();
            this.api.kernel.showMessage(undefined,"CURRENT DATE STRING = " + _loc38_,"DEBUG_LOG");
            break;
         case "GET_DURATION_STRING":
            _loc38_ = this.api.kernel.GameManager.getDurationString(Number(_loc4_[0]));
            this.api.kernel.showMessage(undefined,"DURACION DE " + _loc4_[0] + " = " + _loc38_,"DEBUG_LOG");
            break;
         case "BORRAR_MAPA":
            this.api.lang.getValueFromSOMapData("MAP_" + _loc4_[0]).data = undefined;
            this.api.lang.getValueFromSOMapData("MAP_" + _loc4_[0]).flush;
            break;
         case "GET_OPTION_MANAGER":
            this.api.kernel.showMessage(undefined,"OPTION MANAGER[" + _loc4_[0] + "] = " + _global.API.kernel.OptionsManager.getOption(_loc4_[0]),"DEBUG_LOG");
            break;
         case "GET_GLOBAL_SO":
            this.api.kernel.showMessage(undefined,"GLOBAL SO[" + _loc4_[0] + "] = " + _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME].data[_loc4_[0]],"DEBUG_LOG");
            break;
         case "GET_GLOBAL":
            this.api.kernel.showMessage(undefined,"GLOBAL[" + _loc4_[0] + "] = " + _global[_loc4_[0]],"DEBUG_LOG");
            break;
         case "STR_TEST_1":
            this.api.kernel.showMessage(undefined,_global.STR_TEST_1,"DEBUG_LOG");
            break;
         case "STR_TEST_2":
            this.api.kernel.showMessage(undefined,_global.STR_TEST_2,"DEBUG_LOG");
            break;
         case "STR_TEST_3":
            this.api.kernel.showMessage(undefined,_global.STR_TEST_3,"DEBUG_LOG");
            break;
         case "STR_PATH":
            this.api.kernel.showMessage(undefined,_global.STR_PATH,"DEBUG_LOG");
            break;
         case "NUMERO_CELDA":
            _global.NUMERO_CELDA = Number(_loc4_[0]);
            break;
         case "RECIBIDOS":
            if(_loc4_[0] == "enable" || _loc4_[0] == "true" || _loc4_[0] == "on")
            {
               _global.RECIBIDOS = true;
            }
            else if(_loc4_[0] == "disable" || _loc4_[0] == "false" || _loc4_[0] == "off")
            {
               _global.RECIBIDOS = false;
            }
            break;
         case "ENVIADOS":
            if(_loc4_[0] == "enable" || _loc4_[0] == "true" || _loc4_[0] == "on")
            {
               _global.ENVIADOS = true;
            }
            else if(_loc4_[0] == "disable" || _loc4_[0] == "false" || _loc4_[0] == "off")
            {
               _global.ENVIADOS = false;
            }
            break;
         case "MODO_ELBUSTA":
         case "ELBUSTA":
         case "SKIPCHECK":
            if(_loc4_[0] == "enable" || _loc4_[0] == "true" || _loc4_[0] == "on")
            {
               _global.MODO_ELBUSTA = true;
               _global.CONFIG.skipLanguageVerification = true;
            }
            else if(_loc4_[0] == "disable" || _loc4_[0] == "false" || _loc4_[0] == "off")
            {
               _global.MODO_ELBUSTA = false;
               _global.CONFIG.skipLanguageVerification = false;
            }
            break;
         case "PREGUNTA":
         case "QUESTION":
         case "QUESTIONID":
         case "PREGUNTAID":
            this.api.kernel.showMessage(undefined,this.api.lang.getDialogQuestionText(_loc4_[0]),"DEBUG_LOG");
            break;
         case "RESPUESTA":
         case "ANSWER":
         case "REPONSE":
         case "RESPUESTAID":
         case "REPONSEID":
         case "ANSWERID":
            this.api.kernel.showMessage(undefined,this.api.lang.getDialogResponseText(_loc4_[0]),"DEBUG_LOG");
            break;
         case "SEARCH_NPC":
            _loc29_ = _loc4_.join(" ").toUpperCase();
            _loc40_ = this.api.lang.getNpcs();
            this.buscarXXX("N",_loc29_,"NPC",_loc40_);
            break;
         case "SEARCH_ITEM_SET":
            _loc29_ = _loc4_.join(" ").toUpperCase();
            _loc40_ = this.api.lang.getItemsSets();
            this.buscarXXX("IS",_loc29_,"ITEM SET",_loc40_);
            break;
         case "SEARCH_ITEM":
            _loc29_ = _loc4_.join(" ").toUpperCase();
            _loc40_ = this.api.lang.getItemUnics();
            this.buscarXXX("I",_loc29_,"ITEM",_loc40_);
            break;
         case "SEARCH_MONSTER":
            _loc29_ = _loc4_.join(" ").toUpperCase();
            _loc40_ = this.api.lang.getMonsters();
            this.buscarXXX("M",_loc29_,"MONSTER",_loc40_);
            break;
         case "SEARCH_SPELL":
            _loc29_ = _loc4_.join(" ").toUpperCase();
            _loc40_ = this.api.lang.getSpells();
            this.buscarXXX("S",_loc29_,"SPELL",_loc40_);
            break;
         case "SEARCHQUESTION":
         case "SEARCH_QUESTION":
         case "BUSCAR_PREGUNTA":
         case "BUSCARPREGUNTA":
            _loc29_ = _loc4_.join(" ").toUpperCase();
            this.buscarDialogos("Q",_loc29_);
            break;
         case "SEARCH_REPONSE":
         case "SEARCH_ANSWER":
         case "SEARCHREPONSE":
         case "SEARCHANSWER":
         case "BUSCAR_RESPUESTA":
         case "BUSCARRESPUESTA":
            _loc29_ = _loc4_.join(" ").toUpperCase();
            this.buscarDialogos("A",_loc29_);
            break;
         case "TOGGLESPRITES":
            this.api.datacenter.Basics.gfx_isSpritesHidden = !this.api.datacenter.Basics.gfx_isSpritesHidden;
            if(this.api.datacenter.Basics.gfx_isSpritesHidden)
            {
               this.api.gfx.spriteHandler.maskAllSprites();
            }
            else
            {
               this.api.gfx.spriteHandler.unmaskAllSprites();
            }
            break;
         case "INFOS":
            _loc11_ = "Svr:";
            _loc11_ += "\nNb:";
            _loc11_ += "\n Map  : " + String(this.api.datacenter.Game.playerCount);
            _loc11_ += "\n Cell : " + this.api.datacenter.Map.data[this.api.datacenter.Player.data.cellNum].spriteOnCount;
            _loc11_ += "\nDataServers:";
            _loc13_ = _level0._loader.copyAndOrganizeDataServerList();
            _loc7_ = 0;
            while(_loc7_ < _loc13_.length)
            {
               _loc11_ += "\n host: " + _loc13_[_loc7_].url + "  priority: " + _loc13_[_loc7_].priority;
               _loc7_ = _loc7_ + 1;
            }
            _loc11_ += "\n l   : " + this.api.config.language + " (" + this.api.lang.getLangVersion() + " & " + this.api.lang.getXtraVersion() + ")";
            this.api.kernel.showMessage(undefined,_loc11_,"DEBUG_LOG");
            break;
         case "ZOOM":
            this.api.kernel.GameManager.zoomGfx(_loc4_[0],_loc4_[1],_loc4_[2]);
            break;
         case "TIMERSCOUNT":
            this.api.kernel.showMessage(undefined,String(ank.utils.Timer.getTimersCount()),"DEBUG_LOG");
            break;
         case "VARS":
            this.api.kernel.showMessage(undefined,this.api.kernel.TutorialManager.vars,"DEBUG_LOG");
            break;
         case "MOUNT":
            _loc39_ = this.api.gfx.getSprite(this.api.datacenter.Player.ID);
            if(!_loc39_.isMounting)
            {
               _loc36_ = _loc4_[0] == undefined ? "7002.swf" : _loc4_[0] + ".swf";
               _loc37_ = _loc4_[1] == undefined ? "10.swf" : _loc4_[1] + ".swf";
               _loc35_ = new ank.battlefield.datacenter.Mount(dofus.Constants.CLIPS_PERSOS_PATH + _loc36_,dofus.Constants.CHEVAUCHOR_PATH + _loc37_);
               this.api.gfx.mountSprite(this.api.datacenter.Player.ID,_loc35_);
            }
            else
            {
               this.api.gfx.unmountSprite(this.api.datacenter.Player.ID);
            }
            break;
         case "SCALE":
            this.api.gfx.setSpriteScale(this.api.datacenter.Player.ID,_loc4_[0],_loc4_.length != 2 ? _loc4_[0] : _loc4_[1]);
            break;
         case "ANIM":
            if(_loc4_.length > 1)
            {
               this.api.gfx.setSpriteLoopAnim(this.api.datacenter.Player.ID,_loc4_[0],_loc4_[1]);
            }
            else
            {
               this.api.gfx.setSpriteAnim(this.api.datacenter.Player.ID,_loc4_.join(""));
            }
            break;
         case "C":
            _loc33_ = _loc4_[0];
            _loc4_.splice(0,1);
            switch(_loc33_)
            {
               case ">":
                  this.api.network.send(_loc4_.join(" "));
                  break;
               case "<":
                  this.api.network.processCommand(_loc4_.join(" "));
            }
            break;
         case "D":
            _loc31_ = _loc4_[0];
            _loc4_.splice(0,1);
            switch(_loc31_)
            {
               case ">":
                  this.api.network.send(_loc4_.join(" "),false,undefined,false,true);
                  break;
               case "<":
                  this.api.network.processCommand(_loc4_.join(" "));
            }
            break;
         case "PING":
            this.api.network.ping();
            break;
         case "MAPID":
            this.api.kernel.showMessage(undefined,"carte : " + this.api.datacenter.Map.id,"DEBUG_LOG");
            this.api.kernel.showMessage(undefined,"Area : " + this.api.datacenter.Map.area,"DEBUG_LOG");
            this.api.kernel.showMessage(undefined,"Sub area : " + this.api.datacenter.Map.subarea,"DEBUG_LOG");
            this.api.kernel.showMessage(undefined,"Super Area : " + this.api.datacenter.Map.superarea,"DEBUG_LOG");
            break;
         case "CELLID":
            this.api.kernel.showMessage(undefined,"cellule : " + this.api.datacenter.Player.data.cellNum,"DEBUG_LOG");
            break;
         case "TIME":
            this.api.kernel.showMessage(undefined,"Heure : " + this.api.kernel.NightManager.time,"DEBUG_LOG");
            break;
         case "CACHE":
            this.api.kernel.askClearCache();
            break;
         case "REBOOT":
            this.api.kernel.reboot();
            break;
         case "FPS":
            this.api.ui.getUIComponent("Debug").showFps();
            break;
         case "UI":
            this.api.ui.loadUIComponent(_loc4_[0],_loc4_[0]);
            break;
         case "DEBUG":
            dofus.Constants.DEBUG = !dofus.Constants.DEBUG;
            this.api.kernel.showMessage(undefined,"DEBUG : " + dofus.Constants.DEBUG,"DEBUG_LOG");
            break;
         case "ASKOK":
            this.api.ui.loadUIComponent("AskOk","AskOkContent",{title:"AskOKDebug",text:this.api.lang.getText(_loc4_[0],_loc4_.splice(1))});
            break;
         case "ASKOK2":
            _loc8_ = "";
            _loc10_ = -1;
            while(true)
            {
               _loc10_ = _loc10_ + 1;
               if(_loc10_ >= _loc4_.length)
               {
                  break;
               }
               if(_loc10_ > 0)
               {
                  _loc8_ += " ";
               }
               _loc8_ += _loc4_[_loc10_];
            }
            this.api.ui.loadUIComponent("AskOk","AskOkContent",{title:"AskOKDebug",text:_loc8_});
            break;
         case "MOVIECLIP":
            this.api.kernel.findMovieClipPath();
            break;
         case "LOS":
            _loc24_ = Number(_loc4_[0]);
            _loc23_ = Number(_loc4_[1]);
            if(_global.isNaN(_loc24_) || (_loc24_ == undefined || (_global.isNaN(_loc23_) || _loc23_ == undefined)))
            {
               this.api.kernel.showMessage(undefined,"Unable to resolve case ID","DEBUG_LOG");
               return undefined;
            }
            this.api.kernel.showMessage(undefined,"Line of sight between " + _loc24_ + " and " + _loc23_ + " -> " + ank.battlefield.utils.Pathfinding.checkView(this.api.gfx.mapHandler,_loc24_,_loc23_),"DEBUG_LOG");
            break;
         case "CLEARCELL":
            _loc22_ = Number(_loc4_[0]);
            if(_global.isNaN(_loc22_) || _loc22_ == undefined)
            {
               this.api.kernel.showMessage(undefined,"I\'ll need an ID!","DEBUG_LOG");
               return undefined;
            }
            this.api.gfx.mapHandler.getCellData(_loc22_).removeAllSpritesOnID();
            this.api.kernel.showMessage(undefined,"Cell " + _loc22_ + " cleaned.","DEBUG_LOG");
            break;
         case "CELLINFO":
            _loc21_ = Number(_loc4_[0]);
            if(_global.isNaN(_loc21_) || _loc21_ == undefined)
            {
               this.api.kernel.showMessage(undefined,"I\'ll need an ID!","DEBUG_LOG");
               return undefined;
            }
            _loc6_ = this.api.gfx.mapHandler.getCellData(_loc21_);
            if(_loc6_ == undefined)
            {
               this.api.kernel.showMessage(undefined,"ID Invalida","DEBUG_LOG");
               return undefined;
            }
            _loc27_ = ank.battlefield.utils.Pathfinding.getCaseCoordonnee(this.api.gfx.mapHandler,_loc21_);
            this.api.kernel.showMessage(undefined,"Datas about cell " + _loc21_ + "[" + _loc27_.x + ", " + _loc27_.y + "] " + ":","DEBUG_LOG");
            for(var _loc20_ in _loc6_)
            {
               this.api.kernel.showMessage(undefined,"    " + _loc20_ + " -> " + _loc6_[_loc20_],"DEBUG_LOG");
               if(_loc20_ == "dataCelda")
               {
                  for(var _loc17_ in _loc6_[_loc20_])
                  {
                     this.api.kernel.showMessage(undefined,"        " + _loc17_ + " -> " + _loc6_[_loc20_][_loc17_],"DEBUG_LOG");
                  }
               }
            }
            break;
         case "CELLINFO2":
            _loc21_ = Number(_loc4_[0]);
            if(_global.isNaN(_loc21_) || _loc21_ == undefined)
            {
               this.api.kernel.showMessage(undefined,"I\'ll need an ID!","DEBUG_LOG");
               return undefined;
            }
            _loc6_ = this.api.gfx.mapHandler.getCellData(_loc21_);
            this.api.kernel.showMessage(undefined,"Datas about cell " + _loc21_ + ":","DEBUG_LOG");
            for(_loc20_ in _loc6_)
            {
               this.api.kernel.showMessage(undefined,"    " + _loc20_ + " -> " + _loc6_[_loc20_],"DEBUG_LOG");
               if(_loc6_[_loc20_] instanceof Object)
               {
                  for(var _loc16_ in _loc6_[_loc20_])
                  {
                     this.api.kernel.showMessage(undefined,"        " + _loc16_ + " -> " + _loc6_[_loc20_][_loc16_],"DEBUG_LOG");
                  }
               }
            }
            break;
         case "LANGFILE":
            this.api.kernel.showMessage(undefined,_loc4_[0] + " lang file size : " + this.api.lang.getLangFileSize(_loc4_[0]) + " octets","DEBUG_LOG");
            break;
         case "POINTSPRITE":
            this.api.kernel.TipsManager.pointSprite(-1,Number(_loc4_[0]));
            break;
         case "LISTSPRITES":
            _loc15_ = this.api.gfx.spriteHandler.getSprites().getItems();
            for(_loc20_ in _loc15_)
            {
               this.api.kernel.showMessage(undefined,"Sprite " + _loc15_[_loc20_].gfxFile,"DEBUG_LOG");
            }
            break;
         case "LISTPICTOS":
            _loc5_ = this.api.gfx.mapHandler.getCellsData();
            for(_loc20_ in _loc5_)
            {
               if(_loc5_[_loc20_].layerObject1Num != undefined && (!_global.isNaN(_loc5_[_loc20_].layerObject1Num) && _loc5_[_loc20_].layerObject1Num > 0))
               {
                  this.api.kernel.showMessage(undefined,"Picto " + _loc5_[_loc20_].layerObject1Num,"DEBUG_LOG");
               }
               if(_loc5_[_loc20_].layerObject2Num != undefined && (!_global.isNaN(_loc5_[_loc20_].layerObject2Num) && _loc5_[_loc20_].layerObject2Num > 0))
               {
                  this.api.kernel.showMessage(undefined,"Picto " + _loc5_[_loc20_].layerObject2Num,"DEBUG_LOG");
               }
            }
            break;
         case "POINTPICTO":
            this.api.kernel.TipsManager.pointPicto(-1,Number(_loc4_[0]));
            break;
         case "SAVETHEWORLD":
            if(dofus.Constants.SAVING_THE_WORLD)
            {
               dofus.SaveTheWorld.execute();
            }
            else
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc19_]),"DEBUG_ERROR");
            }
            break;
         case "STOPSAVETHEWORLD":
            if(dofus.Constants.SAVING_THE_WORLD)
            {
               dofus.SaveTheWorld.stop();
            }
            else
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc19_]),"DEBUG_ERROR");
            }
            break;
         case "NEXTSAVE":
            if(dofus.Constants.SAVING_THE_WORLD)
            {
               dofus.SaveTheWorld.getInstance().nextAction();
            }
            else
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc19_]),"DEBUG_ERROR");
            }
            break;
         case "SOMAPLAY":
            _loc30_ = _loc4_.join(" ");
            this.api.kernel.AudioManager.playSound(_loc30_);
            break;
         case "VERIFYIDENTITY":
            _loc12_ = _loc4_[0];
            if(this.api.network.isValidNetworkKey(_loc12_))
            {
               this.api.kernel.showMessage(undefined,_loc12_ + ": Ok!","DEBUG_LOG");
            }
            else
            {
               this.api.kernel.showMessage(undefined,_loc12_ + ": Failed.","DEBUG_LOG");
               if(_loc12_ == undefined)
               {
                  this.api.kernel.showMessage(undefined," - Undefined identity.","DEBUG_LOG");
               }
               if(_loc12_.length == 0)
               {
                  this.api.kernel.showMessage(undefined," - Zero-length identity.","DEBUG_LOG");
               }
               if(_loc12_ == "")
               {
                  this.api.kernel.showMessage(undefined,"\t- Empty string identity.","DEBUG_LOG");
               }
               if(dofus.aks.Aks.checksum(_loc12_.substr(0,_loc12_.length - 1)) != _loc12_.substr(_loc12_.length - 1))
               {
                  this.api.kernel.showMessage(undefined,"\t- First checksum is wrong. Got " + _loc12_.substr(_loc12_.length - 1) + ", " + dofus.aks.Aks.checksum(_loc12_.substr(0,_loc12_.length - 1)) + " expected.","DEBUG_LOG");
               }
               if(dofus.aks.Aks.checksum(_loc12_.substr(1,_loc12_.length - 2)) != _loc12_.substr(0,1))
               {
                  this.api.kernel.showMessage(undefined,"\t- Second checksum is wrong. Got " + _loc12_.substr(0,1) + ", " + dofus.aks.Aks.checksum(_loc12_.substr(1,_loc12_.length - 2)) + " expected.","DEBUG_LOG");
               }
            }
            break;
         case "MONSTER":
            _loc18_ = _loc4_[0];
            _loc9_ = this.api.lang.getMonsters();
            for(var i in _loc9_)
            {
               if(_loc9_[i].n.toUpperCase().indexOf(_loc18_.toUpperCase()) != -1)
               {
                  this.api.kernel.showMessage(undefined," " + _loc9_[i].n + " : " + i + " ( gfx:" + _loc9_[i].g + ")","DEBUG_LOG");
               }
            }
            break;
         default:
            this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc19_]),"DEBUG_ERROR");
      }
   }
   else if(this.api.datacenter.Basics.isLogged)
   {
      this.api.network.Basics.autorisedCommand(sCmd);
   }
   else
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[sCmd]),"DEBUG_ERROR");
   }
};
