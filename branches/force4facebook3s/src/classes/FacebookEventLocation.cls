public class FacebookEventLocation {
    private static final long   serialVersionUID    = 1L;

    private Map<String, String> data = new Map<String, String>();
    
    public FacebookEventLocation()
    {
    }
    
    public FacebookEventLocation(XMLDom.Element source) {
        parseSource(source);
    }
    
    public String street {get { return data.get('street'); } set { data.put('street', value); } }
    public Double latitude {get { return Double.valueOf(data.get('latitude')); } set { data.put('latitude', String.valueOf(value)); } }
    public Double longitude {get { return Double.valueOf(data.get('longitude')); } set { data.put('longitude', String.valueOf(value)); } }
    public String city {get { return data.get('city'); } set { data.put('city', value); } }
    public String state {get { return data.get('state'); } set { data.put('state', value); } }
    public String country {get { return data.get('counrty'); } set { data.put('counrty', value); } }

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