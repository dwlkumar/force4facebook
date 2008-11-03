public class FacebookAlbum implements IFacebookQueryResult {

	protected Map<String, String> data = new Map<String, String>();
	
	public String aid { get { return data.get('aid'); } set; }
	public String cover_pid { get { return data.get('cover_pid'); } set; }
	public String owner { get { return data.get('owner'); } set; }
	public String name { get { return data.get('name'); } set; }
	public Datetime created { get { return FacebookUtils.epochToDatetime(Long.valueOf(data.get('created'))); } set; }
	public String modified { get { return data.get('modified'); } set; }
	public String description { get { return data.get('description'); } set; }
	public String location { get { return data.get('location'); } set; }
		
	public FacebookAlbum(XMLDom.Element xmlInfo) {
		parseSource(xmlInfo);
	} 
	
	public String getResultType() {
		return 'album';
	}

	public void parseSource(XMLDom.Element source) {
		for (XMLDom.Element c: source.childNodes) { 
			data.put(c.nodeName, c.nodeValue);
		}
	}		

}