public class FBToolkitPageController {
	
	public FacebookApp__c fbc { 
		get { 
			System.debug(LoggingLevel.INFO, '\n\nReturning fbc from getter.\nfbc: \n\n' + FacebookConnection.fbApp + '\n\n');
			return FacebookConnection.fbApp; 
		} 
		set; 
	}
	public FacebookConnection fbConnection { get; set; }
	public List<String> friendsList { get { return FacebookConnection.friendsList; } set; }
	public String fbUserId { get; set; }
	
	public FBToolkitPageController() {
    	System.debug(LoggingLevel.INFO, '\n\nFBToolkitPageController constructor()\n');
		if (FacebookConnection.fbApp != null) {
			System.debug(LoggingLevel.INFO, FacebookConnection.fbApp.AppKey__c);	
			System.debug(LoggingLevel.INFO, FacebookConnection.fbApp.AppSecret__c);
			System.debug(LoggingLevel.INFO, FacebookConnection.fbApp.FBUserId__c);
			fbc = FacebookConnection.fbApp;
			fbUserId = fbc.FBUserID__c;
		}
	}
    public String getFormContent() {
    	System.debug(LoggingLevel.INFO, '\n\nFBToolkitPageController getFormContent()\n');
        return '<fb:req-choice url=\'see wiki page for fb:req-choice for details.\' label=\'Ignore the Connect test app!\' />';
    }
    public PageReference getUserInfo() {
    	System.debug(LoggingLevel.INFO, '\n\nFBToolkitPageController getUserInfo	()\n');
        return null;
    }
	
}