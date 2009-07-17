public class FacebookPublicApplicationInfo {

	private Map<String, String> data = new Map<String, String>();

	public String app_id { get { return data.get('app_id'); } set { data.put('app_id', value); } }
	public String api_key {get { return data.get('api_key'); } set { data.put('api_key', value); } }
	public String canvas_name {get { return data.get('canvas_name'); } set { data.put('canvas_name', value); } }
	public String display_name {get { return data.get('display_name'); } set { data.put('display_name', value); } }
	public String icon_url {get { return data.get('icon_url'); } set { data.put('icon_url', value); } }
	public String logo_url {get { return data.get('logo_url'); } set { data.put('logo_url', value); } }
	public String company_name {get { return data.get('company_name'); } set { data.put('company_name', value); } }
	public String description {get { return data.get('description'); } set { data.put('description', value); } }
	public Integer daily_active_users {get { return Integer.valueOf(data.get('daily_active_users')); } set { data.put('daily_active_users', String.valueOf(value)); } }
	public Integer weekly_active_users {get { return Integer.valueOf(data.get('weekly_active_users')); } set { data.put('weekly_active_users', String.valueOf(value)); } }
	public Integer monthly_active_users {get { return Integer.valueOf(data.get('monthly_active_users')); } set { data.put('monthly_active_users', String.valueOf(value)); } }

	public List<String> developers {get; set; }
	
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