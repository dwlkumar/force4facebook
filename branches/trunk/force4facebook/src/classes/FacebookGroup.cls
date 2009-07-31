public class FacebookGroup implements IFacebookQueryResult { 

	private static long serialVersionUID = 1L;
	private Map<String, String> data = new Map<String, String>();
	
	public String gid { get { return data.get('gid'); }  set { data.put('gid', value); } }
	public String name {get { return data.get('name'); } set { data.put('name', value); } }
	public String nid {get { return data.get('nid'); } set { data.put('nid', value); } }
	public String pic  { get { return data.get('pic'); } set { data.put('pic', value); } }
	public String picBig {get { return data.get('pic_big'); } set { data.put('pic_big', value); } }
	public String picSmall {get { return data.get('pib_small'); } set { data.put('pib_small', value); } }
	public String description {get { return data.get('description'); } set { data.put('description', value); } }
	public String group_type {get { return data.get('group_type'); } set { data.put('group_type', value); } }
	public String group_subtype {get { return data.get('group_subtype'); } set { data.put('group_subtype', value); } }
	public String recent_news {get { return data.get('recent_news'); } set { data.put('recent_news', value); } }
	public String creator {get{ return data.get('creator'); }  set { data.put('creator', value); } }
	public String updateTime {get{ return data.get('update_time'); }  set { data.put('update_time', value); } }
	public String office {get{ return data.get('office'); }  set { data.put('office', value); } }
	public String website {get{ return data.get('website'); }  set { data.put('website', value); } }
	
	public FacebookEventLocation venue {get; set;}
 
	public FacebookGroup(XMLDom source) {
		this(source.root);
	}
	
	public FacebookGroup(XMLDom.Element source) {
		parseSource(source);
	}

	public String getResultType() {
		return 'group';
	}
	
	public void parseSource(XMLDom.Element source) {
		for (XMLDom.Element c: source.childNodes) { 
			String nodeName = c.nodeName;
			if (nodeName == 'venue') {
				venue = new FacebookEventLocation(c);
			} else {
				data.put(nodeName, c.nodeValue);
			}
		}
	}		
}