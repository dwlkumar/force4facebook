public class JSONObject {

	public String stringValue;
	public Map<String, JSONObject> mapValue;
	public List<JSONObject> arrayValue;
	public Integer intValue;
	public Double doubleValue;
	public Boolean boolValue;
	public String objectType;
	
	public String dump() {
		String result = '';
		if (objectType == 'array') {
			for (JSONObject jo : arrayValue) {
				result += jo.dump();
			}
		} else if (objectType == 'object') {
			for (String key : mapValue.keySet()) {
				result += key + ': ' + mapValue.get(key).dump();
			}
		} else if (objectType == 'integer') {
			result += intValue + '\n';
		} else if (objectType == 'double') {
			result += doubleValue + '\n';
		} else if (objectType == 'boolean') {
			result += boolValue + '\n';
		} else {
			result += stringValue + '\n';
		}
		return result;
	}
}