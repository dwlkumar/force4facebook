public class FacebookFriendRequest implements IFacebookQueryResult {
	
	protected Map<String, String> data = new Map<String, String>();
	
	public String uid_from { get { return data.get('uid_from'); } set { data.put('uid_from', value); } }
	public String uid_to { get { return data.get('uid_to'); } set { data.put('uid_to', value); } }
		
	public FacebookFriendRequest() { }
	 
	public FacebookFriendRequest(XMLDom.Element xmlInfo) {
		parseSource(xmlInfo);
	}
	
	public String getResultType() {
		return 'friend_info';
	}

	public void parseSource(XMLDom.Element source) {
		for (XMLDom.Element c: source.childNodes) { 
			System.debug(LoggingLevel.INFO, '\nSetting ' + c.nodeName + ' to ' + c.nodeValue);
			data.put(c.nodeName, c.nodeValue);
		}
	}
			
	testMethod static void queryEventMemberTest() {
		FacebookFriendRequest ffr = new FacebookFriendRequest();
		ffr.uid_from = 'uid_from';
		ffr.uid_to = 'uid_to';

		System.assertEquals(ffr.uid_from, 'uid_from');
		System.assertEquals(ffr.uid_to, 'uid_to');
		System.assertEquals(ffr.getResultType(), 'friend_info');
		
		XMLDom xDom = new XMLDom(FacebookXMLResponses.FRIEND_REQUEST_RESPONSE);
		ffr = new FacebookFriendRequest(xDom.root);
	}

}