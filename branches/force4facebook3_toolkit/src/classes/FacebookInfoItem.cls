public class FacebookInfoItem {
	
	private Map<String, String> itemFields = new Map<String, String>();
	
	public String label { get { return itemFields.get('label'); } set { setItemField('label', value); } }
	public String link { get { return itemFields.get('link'); } set { setItemField('link', value); } }
	public String image { get { return itemFields.get('image'); } set { setItemField('image', value); } }
	public String description { get { return itemFields.get('description'); } set { setItemField('description', value); } }
	public String sublabel { get { return itemFields.get('sublabel'); } set {setItemField('sublabel', value); } }
	
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

	testMethod static void doTest() {
		FacebookInfoItem fii = new FacebookInfoItem('label', 'link');
		fii = new FacebookInfoItem('label', 'link', 'image', 'description', 'sublabel');
		fii.label = 'label';
		fii.link = 'link';
		fii.image = 'image';
		fii.description = 'description';
		fii.sublabel = 'sublabel';
		
		System.assertEquals(fii.label, 'label');
		System.assertEquals(fii.link, 'link');
		System.assertEquals(fii.image, 'image');
		System.assertEquals(fii.sublabel, 'sublabel');
		System.assertEquals(fii.description, 'description');
		fii.toJSON();
		
	}

}