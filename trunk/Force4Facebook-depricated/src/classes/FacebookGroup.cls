public class FacebookGroup implements IFacebookQueryResult {

	private static long serialVersionUID = 1L;
	private Map<String, String> data = new Map<String, String>();
	
	public String gid { get { return data.get('gid'); }  set; }
	public String name {get { return data.get('name'); } set;}
	public String nid {get { return data.get('nid'); } set;}
	public String pic  { get { return data.get('pic'); } set;}
	public String picBig {get { return data.get('pic_big'); } set;}
	public String picSmall {get { return data.get('pib_small'); } set;}
	public String description {get { return data.get('description'); } set;}
	public String group_type {get { return data.get('group_type'); } set;}
	public String group_subtype {get { return data.get('group_subtype'); } set;}
	public String recent_news {get { return data.get('recent_news'); } set;}
	public String creator {get{ return data.get('creator'); }  set;}
	public String updateTime {get{ return data.get('update_time'); }  set;}
	public String office {get{ return data.get('office'); }  set;}
	public String website {get{ return data.get('website'); }  set;}
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