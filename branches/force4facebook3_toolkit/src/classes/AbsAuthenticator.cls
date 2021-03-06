public abstract class AbsAuthenticator {
 
    public String errorMessage { get; set; }
    public SiteConfig__c siteConfig { 
    	get {
    		if (siteConfig == null) {
    			siteConfig = fetchSiteConfig();
    		}
    		return siteConfig;
    	}
    	set;
    }
    
    public abstract SiteConfig__c fetchSiteConfig();
    
	public class AuthenticatorException extends Exception {
		
	}
	
	public Boolean createPortalUser { get; set; }
	public AbsSocialController clientController { get; 
		set {
			System.debug('\n\nSetting client controller.\n\n');
			if (value != null) {
				clientController = value;
				clientController.setAuthenticator(this);
			} 
		}
	}
	

	public Boolean getIsPortalUser() {
		return UserInfo.getUserType() != 'Guest';
	}
	
	public Boolean getIsStandardUser() {
		return UserInfo.getUserType() != 'Standard';
	}
	
    public AbsAuthenticator() {
    	
    }
    
    public String loginRedirect { get; set; }
    
    // Upon login, where do we go
    // For Site Home Page Redirect - Set to refURL 
    // For Customer Portal Redirect - Set to default to the portal home
    
    public virtual String getRedirectUrl() {
    	String u = null;
    	if (Apexpages.currentPage().getParameters().containsKey('startURL')) {
  			u = Apexpages.currentPage().getParameters().get('startURL');
    	} else if (Apexpages.currentPage().getParameters().containsKey('refURL')) {
    		//u = '/home/home.jsp';
    		u = Apexpages.currentPage().getParameters().get('refURL');
    	} /*else { 
    		u = '/home/home.jsp';
    	}*/
    	return u;
    }

	/****************************************************************************/
    /*  Now, this is where you lookup the portal user, or
        if you can't find one, create a new one.  In either case
        we will want to login as the user.  
        
        To create a user we need
        1. generate a username based on Facebook user id ( eg. uid + '@' + uInfo.last_name + '.force.com')
        2. Use the username as the email address
        3. Need to create a community nickname.  Depending on what the site does, the user may see this.
            It is a good practice to allow the user to change this via a settings page.  You can try to use
            uInfo.first_name + '_' + uInfo.last_name.  The fact of the matter is, community nick names must
            be unique, so you may want to implement a numbering scheme if the community nick name is taken.
        4. You will also need an account Id with which you can associate the portal user.  What really happens is
            that a contact is created on the account id you specify.  The contact is created with the minimal
            amount of fields set (lastname).  This contact is then "enabled" as a portal user.  You can create
            your own account (think person accounts) but you cannot create the contact, Site.createPortalUser 
            does that for you, no matter what.
        5. Use a password that you can remember - ( eg. $@vedBYzer0).  The user should never be aware of this
            password since we are leveraging Facebook SSO
        6. We also need to have gotten here via SSL.  Http address will not work.
        7. Once the user is created you can call Site.login. This call must be made over HTTPS.
    */
	/****************************************************************************/
    public abstract PageReference registerUser();
    
    public virtual Boolean userExists(String username) {
        return [Select Id From User Where UserName = :username].size() > 0;
    }
    
    public String generatePassword(String uid, String apiKey, String appSecret) {
        return EncodingUtil.base64Encode(Crypto.generateMac('HmacSHA1', Blob.valueOf(uid + apiKey), Blob.valueOf(appSecret)));
    }
    
    public abstract Boolean isValidSig();

}