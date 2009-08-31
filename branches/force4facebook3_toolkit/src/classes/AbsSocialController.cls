public abstract class AbsSocialController implements ISocialController {
	/* 
		This class a bridge between the page controller that extends this class
		and the authenticator being used for social network authentication
	*/
	public List<parameter> parameters { get; set; }
	public String params { get; set; }
	
	public String getParameterString() {
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

	public AbsSocialController() {
		try {
			params = getParameterString();
			parameters = new List<parameter>();
			for (String key : Apexpages.currentPage().getParameters().keySet()) {
				parameters.add(new parameter(key, Apexpages.currentPage().getParameters().get(key)));
			}	
		} catch (Exception ex) {
			System.debug('\n\nError on constructor for AbsSocialController:\n' + ex.getMessage());
		}
	}
	// Authenticator for the page controller
	protected AbsAuthenticator auth;
	
	// Provide access to the athenticator
	public virtual AbsAuthenticator getAuthenticator() {
		return auth;
	}
	// Public setter to provide the athenticator
	public virtual void setAuthenticator(AbsAuthenticator auth) {
		this.auth = auth; 
	}
	
	// Define a get this method to return this instance
	public AbsSocialController getPageController() {
		return this;
	}
	
	// Bubble up the getIsPortalUser from the authenticator	
	public Boolean getIsPortalUser() {
		return auth.getIsPortalUser();
	}
	
}