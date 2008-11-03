public class FacebookEventMember implements IFacebookQueryResult {
	protected Map<String, String> data = new Map<String, String>();
	
	public String uid { get { return data.get('uid'); } set; }
	public String eid { get { return data.get('eid'); } set; }
	public String rsvp_status { get { return data.get('rsvp_status'); } set; }
		
	public FacebookEventMember(XMLDom.Element xmlInfo) {
		parseSource(xmlInfo);
	}
	
	public String getResultType() {
		return 'event_member';
	}

	public void parseSource(XMLDom.Element source) {
		for (XMLDom.Element c: source.childNodes) { 
			data.put(c.nodeName, c.nodeValue);
		}
	}		

}