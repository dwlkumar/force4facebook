public class FacebookPageComponentController {

    public String xdReceiver { 
    	get {
    		if (xdReceiver == null) {
    			xdReceiver = 'xd_receiver';
    		}
    		return xdReceiver;
    	}
    	set {} 
    }
    
    // Needs to be in the controller for Auth 
    public String appKey { get; set; }				// Static app specific secret
    public String appSecret { get; set; }           
    public String appName { get; set; }
    
    // Static app specific keys
    public FacebookApp__c app {get; set; }			// User app info
    public String sfdcUserId { get; set; }
    public String fbUserId { get; set; }            // Facebook user id
    public String sessionKey { get; set; }          // Changes per user
    
    public List<String> parameters { get; set; }    // Debug list of above parameters from fb
    public Map<String, String> params {get { if (params == null) { params = new Map<String, String>(); } return params; } set;}   // Debug Map of parameters
    
    public List<String> friends { get; set; }
    public String friendList { get; set; }

    public String display {  get; set; }
	
    // Container for params sent by Facebook when on the Facebook canvas, profile etc.
    public String queryString { get; set; }
    
    // Need to make this transient since it's not serializable and re-hydrate when needed using
    // API_KEY, API_SECRET and sessionKey
    public transient FacebookSession session;
    
    public FacebookPageComponentController() {
    	display = 'block';

        // Get and store user and params 
        params = ApexPages.currentPage().getParameters();
        queryString = '';
        
        setupParams();
        
        // Grab the information we will want to track and use persistently
	    fbUserId = params.containsKey('fb_sig_canvas_user') ? params.get('fb_sig_canvas_user') : params.get('fb_sig_user');
	    sessionKey = params.get('fb_sig_session_key');
	    appKey = params.get('fb_sig_api_key');
	    if ([Select Count() From FacebookAppList__c Where Name = :appName] == 0) {
	    	ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'my error msg');
	    	ApexPages.addMessage(myMsg);
	    } else {
	    	FacebookAppList__c appRec = [Select AppKey__c, AppSecret__c From FacebookAppList__c Where Name = :appName];
			appSecret = appRec.AppSecret__c;
			appKey = appRec.AppKey__c;
	    }
	    
		friendList = params.get('fb_sig_friends');
		if (friendList != null) {
			friends = friendList.split(',');
		}
    }     

	private void setupParams() {
        for(String key : params.keySet()) {
            queryString += key + '=' + params.get(key) + '&';
        }
        
        if (params.size() > 0) {
        	queryString = queryString.substring(0, queryString.length() - 1);
        }
	}		
	
    public String appKeyJS { get; set; }
    public String fbUserIdJS { get; set; }
    public String sessionKeyJS { get; set; }
    
    public PageReference registerUser() {
		
		if (appkeyJS != null && fbUserIdJS != null && sessionKeyJS != null) {
		    fbUserId = fbUserIdJS;
		    params.put('fb_sig_canvas_user', fbUserId);
		    sessionKey = sessionKeyJS; 
		    params.put('fb_sig_session_key', sessionKey);
		    appKey = appKeyJS;
		    params.put('fb_sig_api_key', appKey);
		    FacebookApp__c fba = [Select SessionKey__c From FacebookApp__c Where FBUserId__c = :fbUserId and AppKey__c = :appKey];
		    fba.sessionKey__c = sessionKey;
		    update fba;
		    setupParams();
		} 
		
		return null;
	}
}