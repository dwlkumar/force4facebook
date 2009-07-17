public class FacebookAlbum implements IFacebookQueryResult { 

	protected Map<String, String> data = new Map<String, String>();
	
	public String aid { get { return data.get('aid'); } set { data.put('aid', value); } }
	public String cover_pid { get { return data.get('cover_pid'); } set { data.put('cover_pid', value); } }
	public String owner { get { return data.get('owner'); } set { data.put('owner', value); } }
	public String name { get { return data.get('name'); } set { data.put('name', value); } }
	public Datetime created { get { return FacebookUtils.epochToDatetime(Long.valueOf(data.get('created'))); } set { data.put('birthday', FacebookUtils.epochToString(FacebookUtils.dateTimeToEpoch(value))); } }
	public String modified { get { return data.get('modified'); } set { data.put('modified', value); } }
	public String description { get { return data.get('description'); } set { data.put('description', value); } }
	public String location { get { return data.get('location'); } set { data.put('location', value); } }
		
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