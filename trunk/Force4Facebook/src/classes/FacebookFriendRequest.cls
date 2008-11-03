public class FacebookFriendRequest implements IFacebookQueryResult {
	protected Map<String, String> data = new Map<String, String>();
	
	public String uid_from { get { return data.get('uid_from'); } set; }
	public String uid_to { get { return data.get('uid_to'); } set; }
		
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
}