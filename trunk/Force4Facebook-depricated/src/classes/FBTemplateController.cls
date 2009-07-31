public class FBTemplateController {

    private FacebookApp__c myFBApp;
    private PageReference thisPage;
    public String display {  get; set; }
	public Boolean userLoggedIn { get; set; }
	
    // Container for params sent by Facebook when on the Facebook canvas, profile etc.
    public String queryString { get { return FacebookConnection.fbQueryString; } set; }
    
    // Need to make this transient since it's not serializable and re-hydrate when needed using
    // API_KEY, API_SECRET and sessionKey
    public transient FacebookSession session;
    
    public FBTemplateController() {
    	System.debug(LoggingLevel.INFO, '\n\nFBTemplateController Constructor\n');
    	userLoggedIn = false;
    	thisPage = ApexPages.currentPage();
    	initConnection();
    	getMyFriends();
    	display = 'block';
    }     

	public void initConnection() {
		// Try to init on appKey and userid
		System.debug(LoggingLevel.INFO, '\n\nFBTemplateController initConnection()\n');
		Map<String, String> p = ApexPages.currentPage().getParameters();
		if (p.containsKey('fb_fromhash')) {
			// We are running in facebook
			String fbId = (p.containsKey('fb_sig_canvas_user') ? p.get('fb_sig_canvas_user') : p.get('fb_sig_user'));
			FacebookConnection.fbApp = new FacebookApp__c(FBUserId__c=fbID, AppKey__c=p.get('fb_sig_api_key'));
		}
		if (p.containsKey('fb_sig_api_key')) {
			trySavedConnection(p);
		} else {
	        FacebookConnection.initialize(p);
	        System.debug(LoggingLevel.INFO, '\n\nBack from FacebookConnection.initialize() \n');
	        if (FacebookConnection.fbApp == null) {
	        	System.debug(LoggingLevel.INFO, '\n\nDamin, the FacebookConnection.fbApp is null, why?\n');
	        } else {
	        	myFBApp = FacebookConnection.fbApp;
	        }
		}
	}

    public void init() {
    	System.debug(LoggingLevel.INFO, '\n\nFBTemplateController init()\nfbApp: \n\n' + FacebookConnection.fbApp + '\n\n');
    	if (myFBApp != null) {
    		System.debug(LoggingLevel.INFO, '\n\nUpserting myFBApp from FBTemplateController.init()\n');
			upsert myFbApp;
    	}
    }
    
    public String getApiKeyByAppName() {
    	System.debug(LoggingLevel.INFO, '\n\nFBTemplateController getApiKeyByAppName()\n');
    	if ([Select Count() From FacebookAppList__c Where Name = :ApexPages.currentPage().getParameters().get('appName')] == 1) {
    		return [Select AppKey__c From FacebookAppList__c Where Name = :ApexPages.currentPage().getParameters().get('appName')][0].AppKey__c;
    	} else {
    		return null;
    	}
    }
    
    private void trySavedConnection(Map<String, String> p) {
    	System.debug(LoggingLevel.INFO, '\n\nFBTemplateController trySavedConnection(paramMap)\n\n' + FacebookUtils.mapOut(p) + '\n');
		String api_key = p.get('fb_sig_api_key');
		String fb_user_id = null;
		String force_user_id = null;
		if (p.containsKey('fb_sig_user') || p.containsKey('fb_sig_canvas_user')) {
			fb_user_id = (p.containsKey('fb_sig_user') ? p.get('fb_sig_user') : p.get('fb_sig_canvas_user'));
		} else {
			force_user_id = UserInfo.getUserId();
		}
		myFBApp = FacebookConnection.getFBApp(api_key, fb_user_id, force_user_id);
		if (myFBApp != null) {
			System.debug(LoggingLevel.INFO, '\n\ntrySavedConnection - myFBApp is not null, have saved connection\n');
			FacebookConnection.initialize(p);
			userLoggedIn = true;
		} else {
			System.debug(LoggingLevel.INFO, '\n\ntrySavedConnection - myFBApp is null, do not have a saved connection\n');
			FacebookConnection.initialize(p);
		}
    }    	

	private void getMyFriends() {
    	System.debug(LoggingLevel.INFO, '\n\nFBTemplateController getMyFriends()\n');
		if (FacebookConnection.friendsList == null || FacebookConnection.friendsList.size() == 0) {
			if (myFBApp != null) {
				if (myFBApp.SessionKey__c != null) {
					queryForFriends();
				}
			}
		}
	}
	
	private void queryForFriends() {
    	System.debug(LoggingLevel.INFO, '\n\nFBTemplateController queryForFriends()\n');
		FacebookSession session = new FacebookSession(myFBApp.AppKey__c, myFBApp.AppSecret__c, '', myFBApp.SessionKey__c);
        FacebookConnection.friendsList = session.getFriends();
	}
	
	
    public String appKeyJS { get; set; } 
    public String fbUserIdJS { get; set; }
    public String sessionKeyJS { get; set; }
    
    private boolean isNewRegistration(String fbUID, String apiKey) {
    	if ([Select Count() From FacebookApp__c Where FBUserId__c = :fbUID and AppKey__c = :apiKey] > 0) {
    		FacebookApp__c fapp = [Select SessionKey__c From FacebookApp__c Where FBUserId__c = :fbUID and AppKey__c = :apiKey];
    		return (fapp.SessionKey__c  == null);
    	} else {
    		return true;
    	}
    }
    
    public PageReference registerUser() {
    	System.debug(LoggingLevel.INFO, '\n\nFBTemplateController registerUser()\n');
    	System.debug(LoggingLevel.INFO, '\n\nPosted vars: \nfbUserId: ' + fbUserIdJS + '\nappKey: ' + appKeyJS + '\n\n');
	    System.debug(LoggingLevel.INFO, '\n\nmyFBApp before registering user: ' + myFBApp + '\n\n');
	    Boolean isNew;
		
		Map<String, String> params = new Map<String, String>();
	    params.put('fb_sig_user', fbUserIdJS);
	    params.put('fb_sig_api_key', appKeyJS);
		if (appkeyJS != null && fbUserIdJS != null && sessionKeyJS != null) {
		    
		    myFBApp = FacebookConnection.initialize(params);
			
			isNew = isNewRegistration(fbUserIdJS, appKeyJS);
			
			System.debug(LoggingLevel.INFO, '\n\nREGISTER USER: myFBApp: ' + myFBApp + '\n');
			
		    myFBApp.SessionKey__c = sessionKeyJS;
		    
		    params.put('fb_sig_session_key', sessionKeyJS);
			
		    myFBApp.fbUserId__c = fbUserIdJS;
		    myFBApp.sessionKey__c = sessionKeyJS;
		    if (isStandardUser(UserInfo.getUserId())) {
		    	myFBApp.User__c = UserInfo.getUserId();
		    	myFBApp.UserType__c = 'Standard';
		    }

		    System.debug(LoggingLevel.INFO, '\n\nmyFBApp before upsert: ' + myFBApp + '\n\n');
		    
		    upsert myFBApp; 
		    if (isNew) {
		    	thisPage.setRedirect(true);
			    userLoggedIn = true;
		    	return thisPage;
		    } else {
			    userLoggedIn = true;
		    	return null;
		    }
		    
		} else {
			return null;
		}
		
	}
	private boolean isStandardUser(String userId) {
    	System.debug(LoggingLevel.INFO, '\n\nFBTemplateController isStandardUser()\n');
		User u = [Select Id, UserType From User Where Id = :userId];
		System.debug(LoggingLevel.INFO, '\n\nUSER TYPE IS: ' + u.UserType + '\n\n');
		return ([Select Id, UserType From User Where Id = :userId][0].UserType == 'Standard');
	}

}