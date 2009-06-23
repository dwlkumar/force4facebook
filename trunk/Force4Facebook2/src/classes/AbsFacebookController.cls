public abstract class AbsFacebookController implements IFacebookController {
	/*
		This class a bridge between the page controller that extends this class
		and the authenticator being used for social network authentication
	*/
	
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