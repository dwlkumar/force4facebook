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

	public Boolean getIsFacebookUser() {
		return [Select Id From GFCUser__c Where User__c = :UserInfo.getUserId()].size() > 0;
	}
	public String getParameterString() {
		String url = Apexpages.currentPage().getUrl();
		params = url.substring(url.indexOf('?'), url.length());
		return params;
	}
	
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
        } catch (Exception ex) {
        	
        }
    }
    
    
    public String fbUserId { get; set; }

    public String APIKey { get; set; }
    public String expires { get; set; }
    public String secret { get; set; }
    public String sessionKey { get; set; }
    public String sig { get; set; }
    public String uid { get; set; }
	public String params { get; set; }
	
	/****************************************************************************/
    /*  See header comments for AbsAuthenticator.registerUser()
    */
	/****************************************************************************/
    public virtual override PageReference registerUser() {
		try { 
			if (Apexpages.currentPage().getParameters().containsKey('fb_sig_session_key')) {
	    		Map<String, String> params = Apexpages.currentPage().getParameters();
	    		APIKey = params.get('fb_sig_api_key');
	    		expires = params.get('fb_sig_expires');
	    		secret = params.get('fb_sig_ss');
	    		sessionKey = params.get('fb_sig_session_key');
	    		sig = params.get('fb_sig');
	    		uid = params.get('fb_sig_user'); 
			}
			if (!APIKey.equals(siteConfig.APIKey__c)) {
				throw new AuthenticatorException('API Key does not match the API Key from Facebook.');
			} 
			System.debug('\n\nAttempt at parameter retrieval: sessionKey = [' + Apexpages.currentPage().getParameters().get('fb_sig_session_key') + '] \n\n');
			System.debug('\n\nAuth values from page:\n' + '\tAPIKey: ' + APIKey + '\n' + '\tSession Secret: ' + secret + '\n' + '\tSession Key: ' + sessionKey + '\n\n');
			String userName = uid + '@' + uid + '.com';
			String password = generatePassword(uid, siteConfig.APIKey__c, siteConfig.FacebookAppSecret__c);

			FacebookSession fbs = new FacebookSession(APIKey, siteConfig.FacebookAppSecret__c, sessionKey);
			FacebookUserInfo uInfo = fbs.getUserInfo(new List<String>{ uid }, fbs.userInfoFieldList)[0]; //fields) ;
			loginRedirect = getRedirectUrl();

			if (userExists(username)) {
				GFCUser__c u = [Select g.UsingNewPassword__c, g.Sig__c, g.SessionKey__c, g.Secret__c, g.Name, g.Id, g.APIKey__c From GFCUser__c g Where g.Name = :uid][0];
				u.Sig__c = sig;
				u.SessionKey__c = sessionKey;
				u.Secret__c = secret;
				u.APIKey__c = APIKey;
				update u;
	                
				PageReference pr = Site.login(username, generatePassword(uid, u.APIKey__c, siteConfig.FacebookAppSecret__c), loginRedirect);
				pr.setRedirect(true);
				return pr;
			} else {
				String cnn = handleDuplicates((uInfo.first_name == null ? uid : uInfo.last_name) + (uInfo.last_name == null ? uid : uInfo.last_name));
				String accountId = siteConfig.NewPortalUserAccount__c;
	    
				User u = new User(Username = username, Email = username, CommunityNickname = cnn);

				String userId = Site.createPortalUser(u, accountId, password);

				if (userId != null) {
					System.debug('\n\nThe Portal user was successfully created.');
					GFCUser__c fc = new GFCUser__c(Name = uid, User__c = userId, DisplayName__c = uInfo.first_name + ' ' + uInfo.last_name, thumbnailUrl__c  = uInfo.pic_small);
					insert fc;
					//setStatus('Just signed up for this cool 61 demo!', APIKey, secret, sessionKey);
					PageReference pr = Site.login(username, password, loginRedirect);
					pr.setRedirect(true);
					return pr;
				} else {
					System.debug('\n\nThe damn user was not created!~!!!\n' + u.Username + 
						'\n' + u.Email + '\n' + u.CommunityNickname + '\n' +
						accountId + '\n' + password);
						
					throw new AuthenticatorException('Portal User not created.\n' + Site.getErrorMessage());
				}
			}
		} catch(Exception ex) {
			System.debug('\n\nERROR - REGISTERUSER - \n' + ex.getMessage());
			errorMessage = ex.getMessage();
		} 
        
		return null;
	}
    
    @future(callout=true)
    public static void setStatus(String status, String apikey, String secret, string sessionKey) {
        FacebookSession fbs = new FacebookSession(apikey, secret, sessionKey);
        //fbs.setStatus('', 'Just signed up for this cool 61 Demo....');
    }

    public String handleDuplicates(String name) {
        List<User> users = [Select Id, CommunityNickName From User Where CommunityNickName Like :name + '%' Order By CommunityNickName Desc];
        if (users.size() == 0) {
            return name;
        } else {
            // This may not be reliable, but, here goes
            return name + '' + (users.size() + 1);
        }
    }
    
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