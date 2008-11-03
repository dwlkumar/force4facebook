public class FacebookEventLocation {
    private static final long   serialVersionUID    = 1L;

    private Map<String, String> data = new Map<String, String>();
    
    public FacebookEventLocation(XMLDom.Element source) {
        parseSource(source);
    }
    
    public String street {get { return data.get('STREET'); } }
    public Double latitude {get { return Double.valueOf(data.get('LATITUDE')); } }
    public Double longitude {get { return Double.valueOf(data.get('LONGITUDE')); } }
    public String city {get { return data.get('CITY'); } }
    public String state {get { return data.get('STATE'); } }
    public String country {get { return data.get('COUNTRY'); } }

    private void parseSource(XMLDom.Element source) {
        for (XMLDom.Element e : source.childNodes) {
            data.put(e.nodeName.toUpperCase(), e.nodeValue);
        }
    }
    
    public String fieldForName( String fieldName )
    {
        return String.valueOf( fieldName.toUpperCase() );
    }

    public enum Field 
    {
        CITY, STATE, COUNTRY, STREET, LATITUDE, LONGITUDE
    }

}