public class FacebookEvent implements IFacebookQueryResult {

    private static long serialVersionUID = 1L;
    private Map<String, String> data = new Map<String, String>();
    
    public Long eid { get { return Long.valueOf(data.get('eid')); }  set; }
    public String name {get { return data.get('name'); } set;}
    public String tagLine {get { return data.get('tagline'); } set;}
    public Long nid {get { return Long.valueOf(data.get('nid')); } set;}
    public String pic  { get { return data.get('pic'); } set;}
    public String pic_big {get { return data.get('pic_big'); } set;}
    public String pic_small {get { return data.get('pic_small'); } set;}
    public String host {get { return data.get('host'); } set;}
    public String description {get { return data.get('description'); } set;}
    public String event_type {get { return data.get('event_type'); } set;}
    public String event_subtype {get { return data.get('event_subtype'); } set;}
    public Datetime start_time {get { return getDateTime('start_time'); } set;}
    public Datetime end_time {get{ return getDateTime('end_time'); } set;}
    public Long creator {get{ return Long.valueOf(data.get('creator')); }  set;}
    public Datetime update_time {get{ return getDateTime('update_time'); } set;}
    public String location {get{ return data.get('location'); }  set;}
    public FacebookEventLocation venue {get; set;}
  
    public FacebookEvent(XMLDom source) {
        this(source.root);
    }
    
    public FacebookEvent(XMLDom.Element source) {
        parseSource(source);
    }

    public String getResultType() {
        return 'event';
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
            String nodeName = c.nodeName;
            if (nodeName == 'venue') {
                venue = new FacebookEventLocation(c);
            } else {
                data.put(nodeName, c.nodeValue);
            }
        }
    }       

}