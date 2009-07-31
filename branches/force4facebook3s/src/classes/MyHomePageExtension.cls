public with sharing class MyHomePageExtension extends AbsSocialController {
	
	public Integer userCount { get; set; }
	public FBCAuthenticator myAuth { get; set; }
	
	public override void setAuthenticator(AbsAuthenticator auth) {
		if (auth != null) {
			super.setAuthenticator(auth);
			myauth = (FBCAuthenticator)auth;
			System.debug('\n\nThe authenticator was just set.\n\n');
		}
	}
	
	public MyHomePageExtension(Apexpages.StandardSetController controller) {
		userCount = controller.getResultSize();
	}
}