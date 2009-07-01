public abstract class AbsFacebookController implements IFacebookController {
	/*
		This class a bridge between the page controller that extends this class
		and the authenticator being used for social network authentication
	*/
	public List<parameter> parameters { get; set; }
	public String params { get; set; }
    public SiteConfig__c siteConfig;

    public SiteConfig__c getSiteConfig() {
    	if (siteConfig == null) {
    		System.debug('\n\nLooking up site config using ' + Site.getName() + '\n\n');
	    	List<SiteConfig__c> configs = [Select Id, Name, FacebookAppSecret__c, APIKey__c, NewPortalUserAccount__c From SiteConfig__c Where Name = :Site.getName() Limit 1];
    		if (configs.size() == 1) {
    			siteConfig = configs.get(0);
    		} else {
    			return null;
    		}
    	}
    	return siteConfig;
    }
	
	public String getParameterString() {
		siteConfig = getSiteConfig();
		String url = Apexpages.currentPage().getUrl();
		if (url.contains('?')) {
			String p = url.substring(url.indexOf('?'), url.length());
			return p;
		} else {
			return '';
		}
	}
	
	public class parameter {
		public String key {get; set;}
		public String val {get; set;}
		public parameter(String key, String val) {
			this.key = key;
			this.val = val;
		}
	}

	public AbsFacebookController() {
		getSiteConfig();
		System.debug('\n\nI say I am in the constructor (AbsFacebookController).\nConfig: \n' + siteConfig + '\n\n');
		try {
			params = getParameterString();
			parameters = new List<parameter>();
			for (String key : Apexpages.currentPage().getParameters().keySet()) {
				parameters.add(new parameter(key, Apexpages.currentPage().getParameters().get(key)));
			}	
		} catch (Exception ex) {
			System.debug('\n\nError on constructor for AbsFacebookController:\n' + ex.getMessage());
		}
	}
	// Authenticator for the page controller
	AbsAuthenticator auth;
	
	// Provide access to the athenticator
	public virtual AbsAuthenticator getAuthenticator() {
		return auth;
	}
	// Public setter to provide the athenticator
	public virtual void setAuthenticator(AbsAuthenticator auth) {
		this.auth = auth; 
	}
	
	// Define a get this method to return this instance
	public AbsFacebookController getThis() {
		return this;
	}
	
	// Bubble up the getIsPortalUser from the authenticator	
	public Boolean getIsPortalUser() {
		return auth.getIsPortalUser();
	}
	
}