public class FacebookCookies implements IFacebookQueryResult { 

    protected Map<String, String> data = new Map<String, String>();
    
    public String uid { get { return data.get('uid'); } set { data.put('uid', value); } }
    public String name { get { return data.get('name'); } set { data.put('name', value); } }
    public String value { get { return data.get('value'); } set { data.put('value', value); } }
    public Datetime expires { get { return FacebookUtils.epochToDatetime(FacebookUtils.stringToEpoch(data.get('expires').replaceAll('T', ' '))); } set { data.put('expires', FacebookUtils.epochToString(FacebookUtils.dateTimeToEpoch(value))); } }
    public String path { get { return data.get('path'); } set { data.put('path', value); } }
        
    public FacebookCookies() { }
    
    public FacebookCookies(XMLDom.Element xmlInfo) {
        parseSource(xmlInfo);
    }
    
    public String getResultType() {
        return 'cookies';
    }

    public void parseSource(XMLDom.Element source) {
        for (XMLDom.Element c: source.childNodes) { 
            data.put(c.nodeName, c.nodeValue);
        }
    }       

	testMethod static void doTest() {
		FacebookCookies fc = new FacebookCookies();
		fc.uid = 'uid';
		fc.name = 'name';
		fc.value = 'value';
		DateTime dt = dateTime.now();
		fc.expires = dt;
		fc.path = 'path';
		
		System.assertEquals(fc.uid, 'uid');
		System.assertEquals(fc.name, 'name');
		System.assertEquals(fc.path, 'path');
		System.assertEquals(fc.expires, dt);
		System.assertEquals(fc.value, 'value');
		System.assertEquals(fc.getResultType(), 'cookies');
		
		XMLDom xDom = new XMLDom('<cookie><name>test</name></cookie>');
		fc = new FacebookCookies(xDom.root);
	}

}