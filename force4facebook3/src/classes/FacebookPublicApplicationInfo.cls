public class FacebookPublicApplicationInfo {

	private Map<String, String> data = new Map<String, String>();

	public String app_id { get { return data.get('app_id'); } set;}
	public String api_key {get { return data.get('api_key'); } set;}
	public String canvas_name {get { return data.get('canvas_name'); } set;}
	public String display_name {get { return data.get('display_name'); } set;}
	public String icon_url {get { return data.get('icon_url'); } set;}
	public String logo_url {get { return data.get('logo_url'); } set;}
	public List<String> developers {get; set;}
	public String company_name {get { return data.get('company_name'); } set;}
	public String description {get { return data.get('description'); } set;}
	public Integer daily_active_users {get { return Integer.valueOf(data.get('daily_active_users')); } set;}
	public Integer weekly_active_users {get { return Integer.valueOf(data.get('weekly_active_users')); } set;}
	public Integer monthly_active_users {get { return Integer.valueOf(data.get('monthly_active_users')); } set;}
	
	public FacebookPublicApplicationInfo(XMLDom.Element xml) {
		parseSource(xml);	
	}
	
	public void parseSource(XMLDom.Element source) {
		for (XMLDom.Element c: source.childNodes) { 
			String nodeName = c.nodeName.toUpperCase();
			if (nodeName == 'DEVELOPERS') {
				developers = new List<String>();
				List<XMLDom.Element> affs = c.getElementsByTagName('developer');
				for (XMLDom.Element a : affs) {
					developers.add(a.nodeValue);
				}
			} else {
				data.put(c.nodeName, c.nodeValue);
			}
		}
	}		
}