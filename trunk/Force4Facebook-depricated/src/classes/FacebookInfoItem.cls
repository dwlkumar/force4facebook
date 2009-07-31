public class FacebookInfoItem {
	
	private Map<String, String> itemFields = new Map<String, String>();
	
	public String label { get; set { setItemField('label', value); } }
	public String link { get; set { setItemField('link', value); } }
	public String image { get; set { setItemField('image', value); } }
	public String description { get; set { setItemField('description', value); } }
	public String sublabel { get; set {setItemField('sublabel', value); } }
	
	private void setItemField(String name, String value) {
		itemFields.put(name, value);
	}
	
	public FacebookInfoItem(String label, String link) {
		this.label = label;
		this.link = link;
	}
	public FacebookInfoItem(String label, String link, String image, String description, String sublabel) {
		this(label, link);
		if (image != null) { this.image = image; }
		if (description != null) { this.description = description; }
		if (sublabel != null) { this.sublabel = sublabel; }
	}
	
	public String toJSON() {
		String output = '{';
		String dataOut = '';
		if (itemFields.containsKey('label')) {
			dataOut += '"label":"' + itemFields.get('label') + '",';
		}
		if (itemFields.containsKey('link')) {
			dataOut += '"link":"' + itemFields.get('link') + '",';
		}
		if (itemFields.containsKey('image')) {
			dataOut += '"image":"' + itemFields.get('image') + '",';
		}
		if (itemFields.containsKey('description')) {
			dataOut += '"description":"' + itemFields.get('description') + '",';
		}
		if (itemFields.containsKey('sublabel')) {
			dataOut += '"sublabel":"' + itemFields.get('sublabel') + '",';
		}
		if (dataOut.length() > 1) {
			dataOut = dataOut.substring(0, dataOut.length() - 1);
		}
		output += dataOut + '}';
		return output;
	}
}