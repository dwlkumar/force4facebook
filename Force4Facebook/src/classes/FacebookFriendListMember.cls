public class FacebookFriendListMember implements IFacebookQueryResult {
	protected Map<String, String> data = new Map<String, String>();
	
	public String flid { get { return data.get('flid'); } set; }
	public String uid { get { return data.get('uid'); } set; }
		
	public FacebookFriendListMember(XMLDom.Element xmlInfo) {
		parseSource(xmlInfo);
	}
	
	public String getResultType() {
		return 'friendlist_member';
	}

	public void parseSource(XMLDom.Element source) {
		for (XMLDom.Element c: source.childNodes) { 
			data.put(c.nodeName, c.nodeValue);
		}
	}		

}