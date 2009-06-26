public class FacebookFriendList implements IFacebookQueryResult {
	
	protected Map<String, String> data = new Map<String, String>();
	
	public String flid { get { return data.get('flid'); } set; }
	public String name { get { return data.get('name'); } set; }
	public String owner { get { return data.get('owner'); } set; }
		
	public FacebookFriendList(XMLDom.Element xmlInfo) {
		parseSource(xmlInfo);
	}
	
	public String getResultType() {
		return 'friendlist';
	}

	public void parseSource(XMLDom.Element source) {
		for (XMLDom.Element c: source.childNodes) { 
			data.put(c.nodeName, c.nodeValue);
		}
	}		
}