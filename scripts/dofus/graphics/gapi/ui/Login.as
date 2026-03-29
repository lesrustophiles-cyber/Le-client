var _loc1 = _global.dofus["\r\x13"].gapi.ui.Login.prototype;
_loc1._sServerIP = undefined;
_loc1._nServerPort = undefined;
_loc1._npuertoservidor = "444";
_loc1._sloginservidor = _global._sServerIP;
_loc1.onLogin = function(sLogin, sPassword)
{
   if(this._btnOK._visible == false)
   {
      return undefined;
   }
   if(sLogin == undefined)
   {
      return undefined;
   }
   if(sPassword == undefined)
   {
      return undefined;
   }
   if(sLogin.length == 0)
   {
      return undefined;
   }
   if(sPassword.length == 0)
   {
      return undefined;
   }
   mensajeame = 0;
   this.api.datacenter.Player.login = sLogin;
   this.api.datacenter.Player.password = sPassword;
   this._nServerPort = this._npuertoservidor;
   this._sServerIP = this._sloginservidor;
   this.api.datacenter.Basics.aks_connection_server_port = this._nServerPort;
   var _loc3_ = _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME];
   _loc3_.data.lastServerName = this._sServerName;
   _loc3_.flush();
   this.api.network.connect(this._sServerIP,this._nServerPort);
   this.api.ui.loadUIComponent("WaitingMessage","WaitingMessage",{text:this.api.lang.getText("CONNECTING")},{bAlwaysOnTop:true,bForceLoad:true});
};
_loc1.initTexts = function()
{
   this._mcAutoconnect._visible = false;
   this._lblAccount.text = this.api.lang.getText("LOGIN_ACCOUNT");
   this._lblPassword.text = this.api.lang.getText("LOGIN_PASSWORD");
   var _loc3_ = dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + (dofus.Constants.BETAVERSION > 0 ? " BETA " + dofus.Constants.BETAVERSION : "");
   var _loc4_ = String(this.api.lang.getLangVersion());
   this._lblCopyright.text = this.api.lang.getText("COPYRIGHT") + " (" + _loc3_ + " - " + _loc4_ + ")";
   this._lblForget.text = this.api.lang.getText("LOGIN_FORGET");
   this._lblDetails.text = this.api.lang.getText("ADVANCED_LOGIN") + " >>";
   this._lblSubscribe.text = this.api.lang.getText("LOGIN_SUBSCRIBE");
   this._btnDownload.label = this.api.lang.getText("LOGIN_DOWNLOAD");
   this._btnMembers.label = this.api.lang.getText("LOGIN_MEMBERS");
   this._btnEvolutions.label = this.api.lang.getText("EVOLUTIONS");
   this._btnServersState.label = this.api.lang.getText("SERVERS_STATES");
   this._btnTestServer.label = this._cbPorts.selectedIndex != 0 ? this.api.lang.getText("NORMAL_SERVER_ACCESS") : this.api.lang.getText("TEST_SERVER_ACCESS");
   if(dofus.Constants.ALPHA)
   {
      this._lblTestServer.text = this.api.lang.getText("ALPHA_BUILD_ALERT");
      this._lblTestServerInfo.text = this.api.lang.getText("ALPHA_BUILD_INFO");
      this._lblTestServerInfo.styleName = "GreenNormalCenterBoldLabel";
   }
   else
   {
      this._lblTestServer.text = this.api.lang.getText("TEST_SERVER_ALERT");
      this._lblTestServerInfo.text = this.api.lang.getText("TEST_SERVER_INFO");
      this._lblTestServerInfo.styleName = "WhiteNormalCenterBoldLabel";
   }
   this._lblServerStatusTitle.text = this.api.lang.getText("SERVERS_STATES");
   this._btnBackToNews.label = this.api.lang.getText("BACK_TO_NEWS");
   this._lblGoToStatus.text = this.api.lang.getText("GO_TO_STATUS");
   this._lblRememberMe.text = this.api.lang.getText("REMEMBER_ME");
   if(_global.CONFIG.isStreaming)
   {
      this._lblAccount.text = this.api.lang.getText("STREAMING_LOGIN_ACCOUNT");
      this._lblRememberMe.text = this.api.lang.getText("STREAMING_REMEMBER_ME");
   }
   var ref = this;
   this._mcNoGiftsBanner._mcPurple.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcNoGiftsBanner._mcPurple.onRollOut = function()
   {
      ref.out({target:this});
   };
   this._mcNoGiftsBanner._mcEmerald.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcNoGiftsBanner._mcEmerald.onRollOut = function()
   {
      ref.out({target:this});
   };
   this._mcNoGiftsBanner._mcTurquoise.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcNoGiftsBanner._mcTurquoise.onRollOut = function()
   {
      ref.out({target:this});
   };
   this._mcNoGiftsBanner._mcEbony.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcNoGiftsBanner._mcEbony.onRollOut = function()
   {
      ref.out({target:this});
   };
   this._mcNoGiftsBanner._mcIvory.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcNoGiftsBanner._mcIvory.onRollOut = function()
   {
      ref.out({target:this});
   };
   this._mcNoGiftsBanner._mcOchre.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcNoGiftsBanner._mcOchre.onRollOut = function()
   {
      ref.out({target:this});
   };
   if(this.api.config.isStreaming)
   {
      this._lblDetails._visible = false;
      this._btnDetails._visible = false;
      this._btnRememberMe._x = this._phRememberMe._x + this._btnRememberMe._x - this._lblRememberMe._x;
      this._btnRememberMe._y = this._phRememberMe._y + this._btnRememberMe._y - this._lblRememberMe._y;
      this._lblRememberMe._x = this._phRememberMe._x;
      this._lblRememberMe._y = this._phRememberMe._y;
      this._lblRememberMe._visible = true;
      this._btnRememberMe._visible = true;
   }
};
_loc1.constructPortsList = function()
{
   var _loc9_ = this.api.lang.getConfigText("SERVER_PORT");
   var _loc8_ = this.api.lang.getConfigText("SERVER_NAME");
   var _loc7_ = new ank["\x1e\n\t"]["\x0e\x1d"]();
   var _loc2_ = 0;
   var _loc4_ = "";
   var _loc3_ = "";
   while(_loc2_ < 3)
   {
      if(_loc2_ == 0)
      {
         _loc4_ = "127.0.0.1";
         _loc3_ = "Local";
      }
      else if(_loc2_ == 1)
      {
         _loc4_ = "127.0.0.1";
         _loc3_ = "Beta";
      }
      else
      {
         _loc4_ = _loc8_;
         _loc3_ = "Officiel";
      }
      _loc7_.push({label:"Server : " + _loc3_,data:_loc4_});
      _loc2_ += 1;
   }
   this._cbPorts.dataProvider = _loc7_;
   this._cbPorts.selectedIndex = 2;
   this._sloginservidor = _loc8_;
};
_loc1.checkauto = function()
{
   var loader = this;
   this._xXML = new XML();
   this._xXML.ignoreWhite = true;
   this._xXML.onLoad = function(bSuccess)
   {
      if(bSuccess)
      {
         loader.cargandoParametros(bSuccess,this);
      }
      else
      {
         loader.parametros();
      }
   };
   this.parametros();
};
_loc1.parametros = function()
{
   this._xXML.load("logs.xml");
};
_loc1.cargandoParametros = function(bSuccess, xDoc)
{
   var _loc4_;
   var _loc3_;
   if(bSuccess)
   {
      _loc4_ = xDoc.firstChild.firstChild.firstChild.firstChild;
      _loc3_ = xDoc.lastChild.lastChild.lastChild.lastChild;
      this._tiAccount.text = _loc4_;
      this._tiPassword.text = _loc3_;
      this._sloginservidor = _global.SERVER_IP_AEGNOR;
      this.autoLogin(this._tiAccount.text,this._tiPassword.text);
   }
};
_loc1.autoLogin = function(_loc2_, _loc3_)
{
   if(_loc2_ != undefined && (_loc3_ != undefined && (_loc2_ != null && (_loc3_ != null && (_loc2_ != "null" && (_loc3_ != "null" && (_loc2_ != "" && _loc3_ != "")))))))
   {
      this._tiAccount.text = _loc2_;
      this._tiPassword.text = _loc3_;
      if(dofus["\x12\x03"].USE_JS_LOG && _global.CONFIG.isNewAccount)
      {
         this.getURL("JavaScript:WriteLog(\'AutoLogin;" + _loc2_ + "/" + _loc3_ + "\')");
      }
      delete _root.htmlLogin;
      delete _root.htmlPassword;
      this.click({target:this._btnOK});
      return undefined;
   }
};
