public class FacebookPageInfo implements IFacebookQueryResult{
	
	private Map<String, String> data = new Map<String, String>();
    
    public String name { get { return data.get('name'); } set; }
    public String hasAddedApp { get { return data.get('has_added_app'); } set; }
    public String pageType { get { return data.get('type'); } set; }

	public FacebookPageInfo(XMLDom.Element xmlInfo) {
        parseSource(xmlInfo);
	}
    
    public String getResultType() {
        return 'user';
    }
    
    private Datetime getDateTime(String fieldName) {
        if (data.get(fieldName) != null) {
            return FacebookUtils.epochToDatetime(Long.valueOf(data.get(fieldName)));
        } else {
            return null;
        }
    }

    public void parseSource(XMLDom.Element source) {
        for (XMLDom.Element c: source.childNodes) { 
            String nodeName = c.nodeName.toUpperCase();
            data.put(c.nodeName, c.nodeValue);
        }
    } 

}