public class FacebookAlbum implements IFacebookQueryResult { 

	protected Map<String, String> data = new Map<String, String>();
	
	public String aid { get { return data.get('aid'); } set { data.put('aid', value); } }
	public String cover_pid { get { return data.get('cover_pid'); } set { data.put('cover_pid', value); } }
	public String owner { get { return data.get('owner'); } set { data.put('owner', value); } }
	public String name { get { return data.get('name'); } set { data.put('name', value); } }
	public Datetime created { get { return FacebookUtils.epochToDatetime(FacebookUtils.stringToEpoch(data.get('created').replaceAll('T', ' '))); } set { data.put('created', FacebookUtils.epochToString(FacebookUtils.dateTimeToEpoch(value))); } }
	public String modified { get { return data.get('modified'); } set { data.put('modified', value); } }
	public String description { get { return data.get('description'); } set { data.put('description', value); } }
	public String location { get { return data.get('location'); } set { data.put('location', value); } }
		
	public FacebookAlbum()
	{	
	}	
	
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
	
	
	/* Test Methods */
	public static testMethod void testAlbumGetterSetter()
	{
		FacebookAlbum fbAlbum = new FacebookAlbum();
		fbAlbum.aid = '000001';
		fbAlbum.cover_pid = '000002';
		fbAlbum.owner = 'Salesforce';
		fbAlbum.name = 'Test Album Name';
		fbAlbum.modified = 'Today';
		fbAlbum.description = 'A Test Album';
		fbAlbum.location = 'San Francisco, CA';
		DateTime rightNow = dateTime.now();
		fbAlbum.created = rightNow;
		System.assertEquals(fbAlbum.created, rightNow);
		
		String test = '';
		test = fbAlbum.aid;
		test = fbAlbum.cover_pid;
		test = fbAlbum.owner;
		test = fbAlbum.name;
		test = fbAlbum.modified;
		test = fbAlbum.description;
		test = fbAlbum.location;
		
		test = fbAlbum.getResultType();
		
		XMLDom.Element test2 = new XMLDom.Element();
		FacebookAlbum fbAlbum2 = new FacebookAlbum(test2);
	}

}