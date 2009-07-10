/*
	This class is the controller for the FacebookConnect component.  It handles all
	correlation of the Facebook user to the Portal user.  It also creates a Portal
	user and logs Portal users into the site.
*/
public virtual class FBCAuthenticator extends AbsAuthenticator {

 
	/* Sample URL query string from Facebook whilst on the Facebook Platform
	Key: _fb_q = 1
	Key: fb_sig = fc68437d647ba70c46395300e1af224c
	Key: fb_sig_added = 1
	Key: fb_sig_api_key = f0bb6a299d7f8d6b
	Key: fb_sig_app_id = 94778684485
	Key: fb_sig_expires = 1246118400
	Key: fb_sig_ext_perms = auto_publish_recent_activity
	Key: fb_sig_in_iframe = 1
	Key: fb_sig_in_new_facebook = 1 
	Key: fb_sig_locale = en_US
	Key: fb_sig_profile_update_time = 1241728107
	Key: fb_sig_session_key = 2.xmGloEFLsENAZAZCYVy96w__.86400.1246118400-525031753
	Key: fb_sig_ss = WfV42ctBByp3mdw__
	Key: fb_sig_time = 1246031953.2545
	Key: fb_sig_user = 525031753  
	 */
  
     
	public String loginTitle { get; set; }
	public String loginMessage { get; set; }
	public String loginFooterMessage { get; set; }
	public String requiredPerms { get; set; }
	public String grantedPerms { get; set; }

    public String siteAPIKey { get { return siteConfig.APIKey__c; } set; }
	
	// Get the site configuration values. This uses the name of the site to fetch
	// apikeys, secrets and such.
	public override SiteConfig__c fetchSiteConfig() {
  		System.debug('\n\nLooking up site config using ' + Site.getName() + '\n\n');
    	List<SiteConfig__c> configs = [Select Id, Name, FacebookAppSecret__c, APIKey__c, NewPortalUserAccount__c From SiteConfig__c Where Name = :Site.getName() Limit 1];
   		if (configs.size() == 1) {
   			return configs.get(0);
    	} else {
    		return null;
    	}
	}
	
	// Determine if the logged in user is a facebook user by virtue of having an 
	// existing registration record in the GFCUser__c table. Handy to make this static
	// so it can be called from any apex code block.
	public static Boolean loggedInUserIsFacebookUser() {
		if ([Select Id From GFCUser__c Where User__c = :UserInfo.getUserId()].size() > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// Instance getter for the function above.  Useful when you have an instance of
	// this class.
	public Boolean getIsFacebookUser() {
		return loggedInUserIsFacebookUser();
	}
	
	// Not sure how important this is still.  It is intended to carry parameters from
	// one page to the next.  This is especially important when the application is running
	// inside of Facebook as an IFrame app.
	public String getParameterString() {
		String url = Apexpages.currentPage().getUrl();
		params = url.substring(url.indexOf('?'), url.length());
		return params;
	}
	
	// Constructor.  When this class is instantiated we want to get as much info about the
	// current user as possible.
    public FBCAuthenticator() {
    	try {
	        if (userExists(UserInfo.getUsername())) {
	        	
	            GFCUser__c u = [Select g.Sig__c, g.SessionKey__c, g.Secret__c, g.Name, g.Id, g.APIKey__c From GFCUser__c g Where g.User__c = :UserInfo.getUserId()][0];
	            APIKey = u.APIKey__c;
	            secret = u.Secret__c;
	            sessionKey = u.SessionKey__c;
	            sig = u.Sig__c;
	            uid = u.Name;
	        }
    	} catch(Exception ex) {
    		
    	}
    }
    
    /*
    	These properties concern Facebook specific authentication and call information
    */
    public String APIKey 			{ get; set; }
    public String expires 			{ get; set; }
    public String sessionKey 		{ get; set; }
    public String sig 				{ get; set; }
    public String uid 				{ get; set; }
    public String sessionSecret 	{ get; set; }
	public String params 			{ get; set; }
    public String secret { 
    	get {
    		return siteConfig.FacebookAppSecret__c;
    	}
		set; 
	}
	
	/****************************************************************************/
    /*  See header comments for AbsAuthenticator.registerUser()
    */
	/****************************************************************************/
    public virtual override PageReference registerUser() {
    	/***
    		TODO - there are a few things that are required for the system to work.
    				we need to check for the existence and consistency of as many
    				of these as possilbe. 
    				- APIKey matches the one from facebook
    				- Remote Site settings are set
    				- Account exists for creating portal user
    				- Account owner has a Role
    				- ??? 
    	***/
    	try {
    		// Check to see if there are a bunch of fb_sig params on the url.  If there
    		// this means that we are running inside of Facebook.
			if (Apexpages.currentPage().getParameters().containsKey('fb_sig_session_key')) {
	    		Map<String, String> params = Apexpages.currentPage().getParameters();
	    		APIKey = params.get('fb_sig_api_key');
	    		expires = params.get('fb_sig_expires');
	    		sessionKey = params.get('fb_sig_session_key');
	    		sessionSecret = params.get('fb_sig_ss');
	    		sig = params.get('fb_sig');
	    		uid = params.get('fb_sig_user'); 
			}
			
			// Verify that the APIKeys match
			if (!APIKey.equals(siteConfig.APIKey__c)) {
				throw new AuthenticatorException('API Key does not match the API Key from Facebook.');
			} 
			
			System.debug('\n\nAttempt at parameter retrieval: sessionKey = [' + Apexpages.currentPage().getParameters().get('fb_sig_session_key') + '] \n\n');
			System.debug('\n\nAuth values from page:\n' + '\tAPIKey: ' + APIKey + '\n' + '\tSession Secret: ' + secret + '\n' + '\tSession Key: ' + sessionKey + '\n\n');
			
			// For or portal user we will create a unique username based on the Facebook userid
			String userName = uid + '@' + uid + '.com';
 			
 			// Try to get some facebook user info for the identified uid
			FacebookSession fbs = new FacebookSession(APIKey, secret, sessionKey);
			FacebookUserInfo uInfo = fbs.getUserInfo(new List<String>{ uid }, fbs.userInfoFieldList)[0]; //fields) ;
			
			loginRedirect = getRedirectUrl();

			if (userExists(username)) {
				// In this case, the use exists in the User table.  By implication, this means that
				// we have created the user in a previous registration.
				
				// We will now update the GFCUser__c with the information that was passed to us from
				// the Facebook Connect javascript
				GFCUser__c u = [Select g.UsingNewPassword__c, g.Sig__c, g.SessionKey__c, g.Secret__c, g.Name, g.Id, g.APIKey__c From GFCUser__c g Where g.Name = :uid][0];
				u.Sig__c = sig;
				u.SessionKey__c = sessionKey;
				u.Secret__c = sessionSecret;
				u.APIKey__c = APIKey;
				update u;
	            
	            // We can now just attempt to log the user in.
	            /*
	            	TODO - Password generation poses a problem due to the fact that the password
	            			is using the application secret to generate the password.  The problem
	            			arises when the application secret is reset.  When the developer resets
	            			the application secret in Facebook, she needs to edit the Site Config to
	            			contain the new application secret.  Of course, if we use the new application
	            			secret to generate the password, the password will be different than the one
	            			that we originally created for the user.
	            			
	            			Trigger???
	            */
				System.debug('\n\nUsing app secret - about to login using \n\tusername: ' + username + '\n\tpassword: ' + generatePassword(uid, u.APIKey__c, siteConfig.FacebookAppSecret__c) + '\n\tredirect: ' + loginRedirect + '\n\n');
				PageReference pr = Site.login(username, generatePassword(uid, u.APIKey__c, siteConfig.FacebookAppSecret__c), loginRedirect);

				if (pr == null) {
					System.debug('\n\nOk, that failed, trying session secret - about to login using \n\tusername: ' + username + '\n\tpassword: ' + generatePassword(uid, u.APIKey__c, sessionSecret) + '\n\tredirect: ' + loginRedirect + '\n\n');
					pr = Site.login(username, generatePassword(uid, u.APIKey__c, sessionSecret), loginRedirect);
				}
				if (pr == null) {
					System.debug('\n\nOk, that failed too, return null?\n\n');
					return null;
				}
				pr.setRedirect(true);
				return pr;
			} else {
				// We get here when we have a Facebook user that has no portal user created
				
				// Generate a unique community nick name.
				/*
					TODO - can we use the uInfo from the user's Facebook profile for the CNN?
				*/
				String cnn = handleDuplicates((uInfo.first_name == null ? uid : uInfo.last_name) + (uInfo.last_name == null ? uid : uInfo.last_name));
				
				String accountId = siteConfig.NewPortalUserAccount__c;
	    
				// Create a new User object
				User u = new User(Username = username, Email = username, CommunityNickname = cnn);
				
				// Create the portal user.  This will essentially fail quietly if for any reason
				// the portal user could not be created.
				String userId = Site.createPortalUser(u, accountId, generatePassword(uid, APIKey, siteConfig.FacebookAppSecret__c));

				if (userId != null) {
					System.debug('\n\nThe Portal user was successfully created.');
					
					// Create the new registration record for the newly created portal user
					GFCUser__c fc = new GFCUser__c(Name = uid, User__c = userId, DisplayName__c = uInfo.first_name + ' ' + uInfo.last_name, thumbnailUrl__c  = uInfo.pic_small);
					insert fc;
					
					// The next line illustrates setting the status in Facebook for the user.
					/*setStatus('Just signed up for this cool 61 demo!', APIKey, secret, sessionKey);*/
					
					// We have a portal user, now we need to log that user in.
					PageReference pr = Site.login(username, generatePassword(uid, APIKey, siteConfig.FacebookAppSecret__c), loginRedirect);
					pr.setRedirect(true);
					return pr;
				} else {
					System.debug('\n\nThe damn user was not created!~!!!\n' + u.Username + 
						'\n' + u.Email + '\n' + u.CommunityNickname + '\n' +
						accountId + '\n' + generatePassword(uid, APIKey, siteConfig.FacebookAppSecret__c));
						
					throw new AuthenticatorException('Portal User not created.\n' + Site.getErrorMessage());
				}
			}
		} catch(Exception ex) {
			System.debug('\n\nERROR - REGISTERUSER - \n' + ex.getMessage());
			errorMessage = ex.getMessage();
		} 
        
		return null;
	}
    
    /*
    	The following method is used to update the user status.  We do this in a future
    	method so that we don't get the error about having uncommitted work.
    */
    @future(callout=true)
    public static void setStatus(String status, String apikey, String secret, string sessionKey) {
        FacebookSession fbs = new FacebookSession(apikey, secret, sessionKey);
        fbs.setStatus('', status);
    }

	// Ensure that the community nick name is not a duplicate, CNN must be unique.
    public String handleDuplicates(String name) {
        List<User> users = [Select Id, CommunityNickName From User Where CommunityNickName Like :name + '%' Order By CommunityNickName Desc];
        if (users.size() == 0) {
            return name;
        } else {
            // This may not be reliable, but, here goes
            return name + '' + (users.size() + 1);
        }
    }
    
    /*
    	TODO - This signature validation routine does not work.  This is an important step
    			in ensuring security.
    */
    public override boolean isValidSig() {
    	Map<String, String> sigParms = new Map<String, String>();
    	sigParms.put('expires', expires);
    	sigParms.put('session_key', sessionKey);
    	sigParms.put('ss', secret);
    	sigParms.put('user', uid);
    	String sigString = '';
    	List<String> keys = new List<String>(sigParms.keySet());
    	keys.sort();
    	String debugMsg = '';
        for ( String key : keys )
        {
            String value = sigParms.get( key );
            sigString += key;
            sigString += '=';
            sigString += value;
            debugMsg += key + '=' + value + '\n';

        }
        sigString += siteConfig.FacebookAppSecret__c;
        debugMsg += siteConfig.FacebookAppSecret__c + '\n';
        System.debug(LoggingLevel.INFO, debugMsg);
    	
    	sigString += siteConfig.FacebookAppSecret__c;
    	System.debug('\n\nHere is what I am signing: \n' + sigString + '\n\n');
    	Blob mac = Crypto.generateDigest('MD5', Blob.valueOf(sigString));
    	String sig  = EncodingUtil.convertToHex(mac);
    	System.debug('\n\nIs sig match: ' + (sig.equals(this.sig)) + '\nsig from call: ' + this.sig + '\nsig from calc: ' + sig + '\n\n');
    	//return sig.equals(this.sig); 
    	return true;
    }

}