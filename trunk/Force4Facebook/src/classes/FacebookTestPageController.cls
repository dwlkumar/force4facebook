public class FacebookTestPageController {
	
	public FacebookApp__c fbc { get; set; }
	public String fbUserId { get; set; }
	
	public List<String> debugStatements {
		get {
			if (debugStatements == null) {
				debugStatements = new List<String>();
			}
			return debugStatements;
		}
		set; 
	}
	public void debug(String value) {
		debugStatements.add(value + '\n'); 
	}
	
	public FacebookTestPageController() {
		System.debug(LoggingLevel.INFO, '\n\nFacebookTestPageController\n' + FacebookConnection.fbApp + '\nconnection???');
		if (FacebookConnection.fbApp != null) {
			debug(FacebookConnection.fbApp.AppKey__c);	
			debug(FacebookConnection.fbApp.AppSecret__c);
			debug(FacebookConnection.fbApp.FBUserId__c);
			fbc = FacebookConnection.fbApp;
			fbUserId = fbc.FBUserID__c;
		}
	}	
}