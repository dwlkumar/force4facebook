public class FacebookCookies implements IFacebookQueryResult { 

    protected Map<String, String> data = new Map<String, String>();
    
    public String uid { get { return data.get('uid'); } set { data.put('uid', value); } }
    public String name { get { return data.get('name'); } set { data.put('name', value); } }
    public String value { get { return data.get('value'); } set { data.put('value', value); } }
    public Datetime expires { get { return FacebookUtils.epochToDatetime(Long.valueOf(data.get('expires'))); } set { data.put('expires', FacebookUtils.epochToString(FacebookUtils.dateTimeToEpoch(value))); } }
    public String path { get { return data.get('path'); } set { data.put('path', value); } }
        
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