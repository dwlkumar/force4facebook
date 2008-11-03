public class FBToolkitConnectController {

	public String mySessionKey { get { return controller.sessionKey; } set; }
	public String apiKey { get; set; }
	public String myApiSecret { get { return '9d7295233da156f42761758bc159063b'; } set; }
	public String myUserId { get { return controller.fbUserId; } set; }
	public String mySig { get; set; }
	public Datetime myExpires;
	
	public void setMyExpires(String value) { myExpires = FacebookUtils.epochToDatetime(Long.valueOf(value)); }
	public Datetime getMyExpires() { return myExpires; }
	
	private FacebookQueryString queryString;
	private FacebookPageComponentController controller;
	
	public FBToolkitConnectController() {
	}
	
	public FBToolkitConnectController(FacebookPageComponentController cntrlr) {
		this.controller = cntrlr;
		System.debug(LoggingLevel.INFO, '\n\nSession is: ' + controller.sessionKey);
	}
	
	public void init() {
		myUserId = [Select FBUserId__c From FacebookApp__c Where User__c = :UserInfo.getUserId()].FBUserId__c;
		apiKey = ApexPages.currentPage().getParameters().get('apiKey');
        if (ApexPages.currentPage().getParameters().size() > 0) {
    		// We drop into here if we are on the facebook canvas, not sure it's appropriate for connect
            queryString = new FacebookQueryString(ApexPages.currentPage().getParameters());
            if (queryString.hasAPIKey) {
                    apiKey = queryString.fb_sig_api_key;
            }
            if (queryString.hasSessionKey) {
                    mySessionKey = queryString.fb_sig_session_key;
            }
        }
	}
	
	public List<String> getFriends() {
		System.debug(LoggingLevel.INFO, '\n\nGetting friends using the following auth bits: ');
		System.debug(LoggingLevel.INFO, '\n\napi key: ' + apiKey);
		System.debug(LoggingLevel.INFO, '\n\napiSecret: ' + myApiSecret);
		System.debug(LoggingLevel.INFO, '\n\nsession id: ' + mySessionKey);
		//if (mySessionKey != null) {
	        //FacebookSession session = new FacebookSession(apiKey, myApiSecret, '', mySessionKey);
    	    FacebookSession session = new FacebookSession('bd157275efff039604c464b3a0f41254', '2dcfb6174736898cc063c5859814675e', '', 'ba909ca44c3b22faa458019d-525031753');
        	return session.getFriends();
		//} else {
		//	return new List<String>();
		//}
	}
	
	public List<String> getMyList() {
		List<String> x = new List<String>();
		for (Integer i=0;i<10;i++) {
			x.add('item ' + i);
		}
		return x;
	}
	
	public String getWallPosts() {
		List<String> friends = getFriends();
		String result = '';
		for (String uid : friends) {
			result += '<fb:wallpost uid="' + uid + '"></fb:wallpost>';
		}
		return result;
	}
	
	public PageReference updateSessionKey() {
		
		return null;
	}

    // This is specific to the <fb:requestForm > tag.  Putting it on the page results in a parsing error.
    public String getFormContent() {
        return '<fb:req-choice url=\'see wiki page for fb:req-choice for details.\' label=\'Ignore the Connect test app!\' />';
    }
	
	
}