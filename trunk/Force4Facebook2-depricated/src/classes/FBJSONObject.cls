public class FBJSONObject {

	public String stringValue;
	public Map<String, FBJSONObject> mapValue;
	public List<FBJSONObject> arrayValue;
	public Long intValue;
	public Double doubleValue;
	public Boolean boolValue;
	public String objectType;
	
	private enum ObjectType { OBJ_STRING, OBJ_ARRAY, OBJ_OBJECT, OBJ_INTEGER, OBJ_DOUBLE, OBJ_BOOLEAN }

	public static FBJSONObject createAtomicValue(Object value)
	{
		FBJSONObject valueObject = new FBJSONObject();
		if ( value instanceof String )
		{
			valueObject.setValue((String)value);
		}
		else if (value instanceof Long )
		{
			valueObject.setValue((Long)value);
		}
		else if ( value instanceof Integer )
		{
			valueObject.setValue((Integer)value);
		}
		else if ( value instanceof Double )
		{
			valueObject.setValue((Double)value);
		}
		else if ( value instanceof Boolean )
		{
			valueObject.setValue((Boolean)value);
		}
		
		if ( valueObject.objectType != null )
		{
			return valueObject;
		}
		else
		{
			return null;
		}		
	}
		
	public void setValue(String value)
	{
		stringValue = value;
		objectType = 'string';
	}
	
	public void setValue(Long value)
	{
		intValue = value;
		objectType = 'integer';
	}

	public void setValue(Integer value)
	{
		intValue = value;
		objectType = 'integer';
	}
	
	public void setValue(Double value)
	{
		doubleValue = value;
		objectType = 'double';
	}
	
	public void setValue(Boolean value)
	{
		boolValue = value;
		objectType='boolean';
	}
	
	public void setValue(List<FBJSONObject> value)
	{
		arrayValue= value;
		objectType = 'array';
	}
	
	public void setValue(Map<String,FBJSONObject> value)
	{
		mapValue = value;
		objectType = 'object';
	}
	
	private static String escapeString(String aString)
	{
		aString = aString.replace('"', '\\"');
		aString = aString.replace('\\', '\\\\');
		return aString;
	}
			
	public String dump() {
		String result = '';
		if (objectType == 'array') {
			String arrayResult = '';
			for (FBJSONObject jo : arrayValue) {
				arrayResult += jo.dump()+',';
			}
			if ( arrayResult.length() > 0 )
			{
				arrayResult = arrayResult.substring(0,arrayResult.length()-1);
			}
			result += '['+arrayResult+']';
		} else if (objectType == 'object') {
			String objectResult = '';
			for (String key : mapValue.keySet()) {
				objectResult += +'"'+escapeString(key)+'"' + ':' + mapValue.get(key).dump()+',';
			}
			if ( objectResult.length() > 0 )
			{
				objectResult = objectResult.substring(0,objectResult.length()-1);
			}
			result += '{'+objectResult+'}';
		} else if (objectType == 'integer') {
			result += intValue;
		} else if (objectType == 'double') {
			result += doubleValue;
		} else if (objectType == 'boolean') {
			result += boolValue;
		} else {
			result += '"'+escapeString(stringValue) + '"';
		}
		return result;
	}
}