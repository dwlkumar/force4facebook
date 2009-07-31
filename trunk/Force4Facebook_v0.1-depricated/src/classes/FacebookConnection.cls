global class FacebookConnection {
	
	//public static FacebookApp__c fbApp { get; set; }
	
	public static String receiver { get { return 'xd_receiver'; } }
	public static String appKey { get; set; }
	
	private static String appSecret { get; set; }

	public static String fbQueryString { get { return paramMapToQueryString(fbParamMap); } set; }
	public static Map<String, String> fbParamMap { get; set; }

	public static String otherQueryString { get { return paramMapToQueryString(otherParamMap); } set; }
	public static Map<String, String> otherParamMap { get; set; }

	public static String friends { get; set; }
	public static List<String> friendsList { get; set; } 
	
	public static boolean inited { get; set; }
	
	/*public FacebookApp__c getConnection() {
    	System.debug(LoggingLevel.INFO, '\n\nFacebookConnection getConnection()\n');
		return fbApp;
	}*/
	
	public static Boolean needConnect { 
		get {
    		System.debug(LoggingLevel.INFO, '\n\nFacebookConnection needConnect.get()\n');
			//return fbApp.sessionKey__c == null;
			return null;
		}
	}
	
	public static Boolean isForceUser() {
    	System.debug(LoggingLevel.INFO, '\n\nFacebookConnection isForceUser()\n');
		return null; //fbApp.User__c != null;
	}
	
	private static String paramMapToQueryString(Map<String, String> pMap) {
    	System.debug(LoggingLevel.INFO, '\n\nFacebookConnection paramMapToQueryString()\n\n' + FacebookUtils.mapOut(pMap) + '\n');
		String out = '';
		if (pMap.size() > 0) {
			for (String key : pMap.keySet()) {
				out += key + '=' + pMap.get(key) + '&';
			}
			if (appKey != null) {
				out += 'fb_sig_api_key=' + appKey + '&';
			}
			out = out.substring(0, out.length() - 1);
		}
		return out;
	}

	public static void initializeParams(Map<String, String> queryParams) {
    	System.debug(LoggingLevel.INFO, '\n\nFacebookConnection initializeParams()\n\n' + FacebookUtils.mapOut(queryParams) + '\n');
    	inited = false;
		loadParameters(queryParams);
	}	

	/*public static FacebookApp__c initialize(Map<String, String> queryParams) {
    	System.debug(LoggingLevel.INFO, '\n\nFacebookConnection initialize()\n\n' + FacebookUtils.mapOut(queryParams) + '\n');
		initializeParams(queryParams);
		 // Grab the information we will want to track and use persistently
	    String fbUserId = queryParams.containsKey('fb_sig_canvas_user') ? queryParams.get('fb_sig_canvas_user') : queryParams.get('fb_sig_user');
	    String sessionKey = queryParams.get('fb_sig_session_key');
	    if (appKey == null) {
		    appKey = queryParams.get('fb_sig_api_key');
	    }
	    String appName = queryParams.get('appName');
	    
	    System.debug(LoggingLevel.INFO, '\n\n' + queryParams + 	'\n');
	    
	    setKeys(fbUserId, sessionKey, appKey, appName);
	    
	    System.debug(LoggingLevel.INFO, '\n\nReturned from setting the keys\nfbApp: ' + fbApp + '\n');
	    return fbApp;
	}	*/
	
	// we may not have fbParams if we are hosted by force.
	// If we do, we will want to verify a couple of things because we
	// may also want to replace or remove some depending on whether
	// the app is added or not by the user
	private static void loadParameters(Map<String, String> queryParams) {
    	System.debug(LoggingLevel.INFO, '\n\nFacebookConnection loadParameters()\n\n' + FacebookUtils.mapOut(queryParams) + '\n');
		fbParamMap = new Map<String, String>();
		otherParamMap = new Map<String, String>();
		
		for (String key : queryParams.keySet()) {
			if (key.startswith('fb_sig')) {
				fbParamMap.put(key, queryParams.get(key));
			} else {
				otherParamMap.put(key, queryParams.get(key));
			}
		}
		friendsList = new List<String>(); 
		if (queryParams.containsKey('fb_sig_friends')) {
			friends = queryParams.get('fb_sig_friends');
			friendsList = friends.split(',');
		}
	}
	
	public static void setKeys(String fbUserId, String sessionKey, String apiKey, String appName) {
    	System.debug(LoggingLevel.INFO, '\n\nFacebookConnection setKeys()\n\nKeys\n\tfbUserId: ' + fbUserId + '\n\tsessionKey: ' + sessionKey + '\n\tappKey: ' + appKey + '\n\tappName: '+ appName + '\n');
		/*FacebookAppList__c fbal = checkAppRegistration(apiKey, appName); 
		if (fbal != null) {
			appSecret = fbal.AppSecret__c;
			System.debug(LoggingLevel.INFO, '\n\nIN SETKEYS Appsecret is: ' + fbal.AppSecret__c + '\n');
			fbApp = getFBApp(fbal.appKey__c, fbUserId, UserInfo.getUserId());
			if (fbApp == null) {
				fbApp = new FacebookApp__c(Name=fbal.Name, FBUserId__c=fbUserId, AppKey__c=fbal.AppKey__c, AppSecret__c=fbal.AppSecret__c);
			}
		} else {
			System.debug(LoggingLevel.INFO, '\n\nERRORRR - FBAL is null\n');
		}*/
	}

	/*public static FacebookApp__c getFBApp(String api_key, String fb_user_id, String force_user_id) {
    	System.debug(LoggingLevel.INFO, '\n\nFacebookConnection getFBApp()\n\narguments: \n\tapi_key: ' + api_key + '\n\tfb_user_id: ' + fb_user_id + '\n\tforce_user_id: ' + force_user_id + '\n');
		if (fb_user_id == null) {
			if ([Select Count() From FacebookApp__c Where appKey__c = :api_key and User__c = :force_user_id] == 0) {
				return null;
			} else {
				return [Select Id, User__c, SessionKey__c, Name, FBUserId__c, FBEmail__c, AppSecret__c, AppKey__c From FacebookApp__c Where appKey__c = :api_key and User__c = :force_user_id];
			}
		} else {
			if ([Select Count() From FacebookApp__c Where appKey__c = :api_key and FBUserId__c = :fb_user_id] == 0) {
				return null;
			} else {
				return [Select Id, User__c, SessionKey__c, Name, FBUserId__c, FBEmail__c, AppSecret__c, AppKey__c From FacebookApp__c Where appKey__c = :api_key and FBUserId__c = :fb_user_id];
			}
		}
	}*/

	/*private static FacebookAppList__c checkAppRegistration(String apiKey, String appName) {
    	System.debug(LoggingLevel.INFO, '\n\nFacebookConnection checkAppRegistration()\n\narguments\n\tapiKey: ' + apiKey + '\n\tappName: ' + appName + '\n');
		if (appName != null) {
		    if ([Select Count() From FacebookAppList__c Where Name = :appName] == 1) {
		    	FacebookAppList__c fbal = [Select AppSecret__c, AppKey__c, Name From FacebookAppList__c Where Name = :appName];
		    	return fbal;
		    }
		} else {
		    if ([Select Count() From FacebookAppList__c Where AppKey__c = :apiKey] == 1) {
		    	FacebookAppList__c fbal = [Select Name, AppSecret__c, AppKey__c From FacebookAppList__c Where AppKey__c = :apiKey];
		    	return fbal;
		    }
		}
		return null;
	}*/
	
	private static Boolean checkUserAppRecord(String userId, string apiKey) {
    	System.debug(LoggingLevel.INFO, '\n\nFacebookConnection checkUserAppRecord()\n\narguments\n\tuserId: ' + userId + '\n\tapiKey: ' + apiKey + '\n');
		//return ([Select Count() From FacebookApp__c Where appKey__c = :apiKey and FBUserId__c = :userId] == 1);
		return null;
	}
}