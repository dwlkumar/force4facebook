public class FacebookEventLocation {
    private static final long   serialVersionUID    = 1L;

    private Map<String, String> data = new Map<String, String>();
    
    public FacebookEventLocation()
    {
    }
    
    public FacebookEventLocation(XMLDom.Element source) {
        parseSource(source);
    }
    
    public String street {get { return data.get('STREET'); } set { data.put('STREET', value); } }
    public Double latitude {get { return Double.valueOf(data.get('LATITUDE')); } set { data.put('LATITUDE', String.valueOf(value)); } }
    public Double longitude {get { return Double.valueOf(data.get('LONGITUDE')); } set { data.put('LONGITUDE', String.valueOf(value)); } }
    public String city {get { return data.get('CITY'); } set { data.put('CITY', value); } }
    public String state {get { return data.get('STATE'); } set { data.put('STATE', value); } }
    public String country {get { return data.get('COUNTRY'); } set { data.put('COUNTRY', value); } }

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

	public FBJSONObject toJSON()
	{
		Map<String,FBJSONObject> jsonValue = new Map<String,FBJSONObject>();
		
		for ( String key: data.keySet() )
		{
			String value = data.get(key);
			if ( value != null )
			{
				FBJSONObject valueObject = FBJSONObject.createAtomicValue(value);
				jsonValue.put(key.toLowerCase(), valueObject);
			}
		}
		
		FBJSONObject jsonObjectValue = new FBJSONObject();
		jsonObjectValue.setValue(jsonValue);
		return jsonObjectValue;
	}
}