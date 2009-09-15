public class FacebookPageInfo implements IFacebookQueryResult{
	
	private Map<String, String> data = new Map<String, String>();
    
    public String name { get { return data.get('name'); } set { data.put('name', value); } }
    public String hasAddedApp { get { return data.get('has_added_app'); } set { data.put('has_added_app', value); } }
    public String pageType { get { return data.get('type'); } set { data.put('type', value); } }

	public FacebookPageInfo() {} 
	
	public FacebookPageInfo(XMLDom.Element xmlInfo) {
        parseSource(xmlInfo);
	}
    
    public String getResultType() {
        return 'user';
    }
    
    public void parseSource(XMLDom.Element source) {
        for (XMLDom.Element c: source.childNodes) { 
            String nodeName = c.nodeName.toUpperCase();
            data.put(c.nodeName, c.nodeValue);
        }
    } 

	testMethod static void doTest() {
		FacebookPageInfo fpi = new FacebookPageInfo();
		fpi.name = 'name';
		fpi.hasAddedApp = 'hasAddedApp';
		fpi.pageType = 'pageType';
		 
		System.assertEquals(fpi.name, 'name');
		System.assertEquals(fpi.hasAddedApp, 'hasAddedApp');
		System.assertEquals(fpi.pageType, 'pageType');
		System.assertEquals(fpi.getResultType(), 'user');
		XMLDom xDom = new XMLDom('<cookie><name>test</name></cookie>');
		fpi = new FacebookPageInfo(xDom.root);
	}

}