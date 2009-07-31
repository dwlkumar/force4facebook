public class FacebookGroupMember implements IFacebookQueryResult {
	
	private static long serialVersionUID = 1L;
	private Map<String, String> data = new Map<String, String>();
	
	public String gid { get { return data.get('gid'); }  set { data.put('gid', value); } }
	public String uid {get { return data.get('uid'); } set { data.put('uid', value); } }
	
	public List<Position> positions {get; set;}
 
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
}