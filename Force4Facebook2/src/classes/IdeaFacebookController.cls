public virtual class IdeaFacebookController extends AbsFacebookController {
 
	public FacebookSession fbSess;
	public String currentUID { get; set; }
	public FBCAuthenticator myauth;
	
	public override void setAuthenticator(AbsAuthenticator auth) {
		super.setAuthenticator(auth);
		myauth = (FBCAuthenticator)auth;
		if (auth != null) {
			System.debug('\n\nThe authenticator was just set.\n\n');
			currentUID = myauth.uid;
		}
	}


}