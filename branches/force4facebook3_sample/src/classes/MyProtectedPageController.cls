public with sharing class MyProtectedPageController extends AbsSocialController {

	public FacebookSession fbSess;
	public String facebookUserId { get; set; }
	public FBCAuthenticator myauth;
	
	public override void setAuthenticator(AbsAuthenticator auth) {
		super.setAuthenticator(auth);
		myauth = (FBCAuthenticator)auth;
		if (auth != null) {
			System.debug('\n\nThe authenticator was just set.\n\n');
			facebookUserId = myauth.uid;
		} 
	}
}