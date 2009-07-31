public class FacebookCookies implements IFacebookQueryResult { 

    protected Map<String, String> data = new Map<String, String>();
    
    public String uid { get { return data.get('uid'); } set; }
    public String name { get { return data.get('name'); } set; }
    public String value { get { return data.get('value'); } set; }
    public Datetime expires { get { return FacebookUtils.epochToDatetime(Long.valueOf(data.get('expires'))); } set; }
    public String path { get { return data.get('path'); } set; }
        
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

}