public class FacebookInfoSection {

	public String field { get; set;}
	public String fbUserId { get; set; }
	
	public List<FacebookInfoItem> items { get { if (items == null) { items = new List<FacebookInfoItem>(); } return items; } set; }
	
	public String toJSON() {
		String output = '{';
		output += '"items":[';
		for (FacebookInfoItem item : items) {
			output += item.toJSON() + ',';
		}
		if (items.size() > 0) {
			output = output.substring(0, output.length() - 1);
		}
		output += '], "field":"' + field + '"}';
		return output;
	}
	
	public void save() {
		// TODO - figure out this implementation	
	}
}