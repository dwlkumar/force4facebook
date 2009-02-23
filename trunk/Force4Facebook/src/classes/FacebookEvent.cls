public class FacebookEvent implements IFacebookQueryResult {

    private static long serialVersionUID = 1L;
    private Map<String, String> data = new Map<String, String>();
    
    public Long eid { get { return Long.valueOf(data.get('eid')); }  set { data.put('eid', String.valueOf(value)); } }
    public String name {get { return data.get('name'); } set { data.put('name', value); }}
    public String tagLine {get { return data.get('tagline'); } set { data.put('tagline', value); }}
    public Long nid {get { return Long.valueOf(data.get('nid')); } set { data.put('nid', String.valueOf(value)); }}
    public String pic  { get { return data.get('pic'); } set { data.put('pic', value); }}
    public String pic_big {get { return data.get('pic_big'); } set { data.put('pic_big', value); }}
    public String pic_small {get { return data.get('pic_small'); } set { data.put('pic_small', value); }}
    public String host {get { return data.get('host'); } set { data.put('host', value); }}
    public String description {get { return data.get('description'); } set { data.put('description', value); }}
    public String event_type {get { return data.get('event_type'); } set { data.put('event_type', value); }}
    public String event_subtype {get { return data.get('event_subtype'); } set { data.put('event_subtype', value); }}
    public Datetime start_time {get { return getDateTime('start_time'); } set { setDateTime('start_time', value); }}
    public Datetime end_time {get{ return getDateTime('end_time'); } set { setDateTime('end_time', value); }}
    public Long creator {get{ return Long.valueOf(data.get('creator')); }  set { data.put('creator', String.valueOf(value)); }}
    public Datetime update_time {get{ return getDateTime('update_time'); } set { setDateTime('update_time', value); }}
    public String location {get{return data.get('location');} set { data.put('location', value); } }
    public String category {get{return data.get('category');} set { data.put('category', value); } }
    public String subcategory {get{return data.get('subcategory');} set { data.put('subcategory', value); } }
    public String privacy_type {get{return data.get('privacy_type');} set { data.put('privacy_type', value); } }
    
    public FacebookEventLocation venue {get; set;}
  
	public FacebookEvent()
	{
	}
	
    public FacebookEvent(XMLDom source) {
        this(source.root);
    }
    
    public FacebookEvent(XMLDom.Element source) {
        parseSource(source);
    }

    public String getResultType() {
        return 'event';
    }
    
    private void setDateTime(String fieldName, Datetime theDateTime)
    {
    	data.put(fieldName, String.valueOf(FacebookUtils.dateTimeToEpoch(theDateTime)));
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

	public JSONObject toJSON(boolean flatten)
	{
		Set<String> intKeys = new Set<String> { 'hide_guest_list', 'eid', 'creator', 'update_time', 'end_time', 'start_time' };
		
		Map<String,JSONObject> jsonValue = new Map<String,JSONObject>();
		
		for ( String key: data.keySet() )
		{
			String value = data.get(key);
			if ( value != null )
			{
				JSONObject valueObject;
				if ( intKeys.contains(key) )
				{
					valueObject = JSONObject.createAtomicValue(Long.valueOf(value));
				}
				else
				{
					valueObject = JSONObject.createAtomicValue(value);
				}
				
				jsonValue.put(key, valueObject);
			}
		}
		
		if ( flatten )
		{
			JSONObject venueJsonObject = venue.toJSON();
			Map<String,JSONObject> venueJsonValues = venueJsonObject.mapValue;
			for ( String key: venueJsonValues.keySet() )
			{
				jsonValue.put(key, venueJsonValues.get(key));
			}
		}
		else
		{
			jsonValue.put('location', venue.toJSON());
		}
		
		JSONObject jsonObjectValue = new JSONObject();
		jsonObjectValue.setValue(jsonValue);
		return jsonObjectValue;
	}
}