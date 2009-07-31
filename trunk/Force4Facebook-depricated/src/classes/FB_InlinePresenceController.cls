public class FB_InlinePresenceController {

	public Boolean registered { get; set; }
	public Boolean notRegistered { get; set; }
	public FacebookUserInfo fbUserInfo { get; set; }
	public String myUser { get; set; }
	
	//public String apiKey = '1ddde354953f8a3d5d927868039cc50e';
	public String appSecret = '9d7295233da156f42761758bc159063b';
	
	public FacebookPageComponentController controller;
	
	public FB_InlinePresenceController(FacebookPageComponentController c) {
		controller = c;
	}
	
	public String thisPage { 
		get {
			return ApexPages.currentPage().getUrl();
		}
	}
	public PageReference updateUser() {
		return null;
	} 
	  
	public void init() {
		System.debug(LoggingLevel.INFO, '\n\nUser Id: ' + UserInfo.getUserId());
		//User me = [Select FBUserId__c, FBSessionKey__c From User Where Id = :UserInfo.getUserId()];
		//notRegistered = (me == null);
		//registered = !notRegistered;
		//if (registered) {
			Map<String, String> p = ApexPages.currentPage().getParameters();
			System.debug(LoggingLevel.INFO, '\n\nCREATING SESSION USING:\nappKey: ' + controller.appKey +
				'\nappSecret: ' + controller.appSecret + '\nsessionKey: ' + controller.sessionKey);
			FacebookSession session = new FacebookSession(controller.appKey, appSecret, '', controller.sessionKey);
			//FacebookSession session = new FacebookSession('1ddde354953f8a3d5d927868039cc50e', '9d7295233da156f42761758bc159063b', '', 'bea7ce1733391bb4269525c4-525031753');
			session.getSessionKey();
			
	    	String myId = controller.fbUserId;
	        String returnValue = '';
	        Integer uCount = 0;
	        try {
		    	String fql = 'Select uid, first_name, pic, work_history, birthday, hometown_location, affiliations, pic_square, status from user where name = \'' + ApexPages.currentPage().getParameters().get('name') + '\' AND uid IN (SELECT uid2 FROM friend WHERE uid1 = \'' + controller.fbUserId + '\')';
				List<IFacebookQueryResult> users = session.query(fql);
				for (IFacebookQueryResult u : users) {
					fbUserInfo = (FacebookUserInfo)u;
					System.debug(LoggingLevel.INFO, fbUserInfo);
					myUser = fbUserInfo.uid;
					uCount++;
				}
	        } catch (Exception e) {
	        }
		//}
	}
}