public class FacebookEventMember implements IFacebookQueryResult { 
	protected Map<String, String> data = new Map<String, String>();
	
	public String uid { get { return data.get('uid'); } set { data.put('uid', value); } }
	public String eid { get { return data.get('eid'); } set { data.put('eid', value); } }
	public String rsvp_status { get { return data.get('rsvp_status'); } set { data.put('rsvp_status', value); } }
		
	public FacebookEventMember()
	{
	}
	
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

	testmethod static void queryEventMemberTest() {
		FacebookEventMember evm = new FacebookEventMember();
		evm.eid = 'eid';
		evm.rsvp_status = 'status';
		evm.uid = 'uid';
		System.assertEquals(evm.eid, 'eid');
		System.assertEquals(evm.uid, 'uid');
		System.assertEquals(evm.rsvp_status, 'status');
		System.assertEquals(evm.getResultType(), 'event_member');
	}

}