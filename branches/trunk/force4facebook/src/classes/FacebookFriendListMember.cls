public class FacebookFriendListMember implements IFacebookQueryResult {
	
	protected Map<String, String> data = new Map<String, String>();
	
	public String flid { get { return data.get('flid'); } set { data.put('flid', value); } }
	public String uid { get { return data.get('uid'); } set { data.put('uid', value); } }
		
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