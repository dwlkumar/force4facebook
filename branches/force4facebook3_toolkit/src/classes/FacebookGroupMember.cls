public class FacebookGroupMember implements IFacebookQueryResult {
	
	private static long serialVersionUID = 1L;
	private Map<String, String> data = new Map<String, String>();
	
	public String gid { get { return data.get('gid'); }  set { data.put('gid', value); } }
	public String uid {get { return data.get('uid'); } set { data.put('uid', value); } }
	
	public List<Position> positions {get; set;}
 
 	public FacebookGroupMember() { }
 	
	public FacebookGroupMember(XMLDom source) {
		this(source.root);
	}
	
	public FacebookGroupMember(XMLDom.Element source) {
		positions = new List<Position>();
		parseSource(source);
	}

	public String getResultType() {
		return 'group_member';
	}
	
	public void parseSource(XMLDom.Element source) {
		for (XMLDom.Element c: source.childNodes) { 
			if (c.nodeName == 'positions') {
				for (XMLDom.Element p : c.childNodes) {
					positions.add(new Position(p));
				}
			} else {
				data.put(c.nodeName, c.nodeValue);
			}
		}
	}
	
	public class Position {
		private Map<String, String> data = new Map<String, String>();
		
		public String member_type { get { return data.get('member_type'); } set; }
		
		public Position(XMLDom.Element source) {
			parseSource(source);
		}
		
		public void parseSource(XMLDom.Element source) {
			data.put(source.nodeName, source.nodeValue);
		}
	}
			
	static testMethod void testFacebookFriendList() {
		FacebookGroupMember ff = new FacebookGroupMember();
		ff.gid = 'gid';
		ff.uid = 'uid';
		String groupMemberXML = '<group_member>' +
			    '<uid>525031753</uid>' +
			    '<positions list="true">' +
			      '<member_type>OWNER</member_type>' +
			      '<member_type>ADMIN</member_type>' +
			    '</positions>' +
			  '</group_member>';
		
		List<Position> positions = new List<Position>();
		String positionXML =  '<member_type>OWNER</member_type>';
		XMLDom xDom = new XMLDom(positionXML);
		positions.add(new Position(xDom.root));
		
		System.assertEquals(positions[0].member_type, null);
		
		ff.positions = positions;
		
		System.assertEquals(ff.getResultType(), 'group_member');
		System.assertEquals(ff.gid, 'gid');
		System.assertEquals(ff.uid, 'uid');
		System.assertEquals(ff.positions.size(), 1);

		XMLDom gmDom = new XMLDom(groupMemberXML);
		ff = new FacebookGroupMember(gmDom);

	}
}