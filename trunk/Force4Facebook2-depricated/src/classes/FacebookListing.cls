public class FacebookListing implements IFacebookQueryResult {
	
	private Map<String, String> data = new Map<String, String>();
	
    public String listing_id { get { return data.get('listing_id'); } set; }
    public String url { get { return data.get('url'); } set; }
    public String title { get { return data.get('title'); } set; }
    public String description { get { return data.get('description'); } set; }

    public String price { get { return data.get('price'); } set; }
    public String poster { get { return data.get('poster'); } set; }
    public String update_time { get { return data.get('update_time'); } set; }
    public String category { get { return data.get('category'); } set; }
    public String subcategory { get { return data.get('subcategory'); } set; }
    public List<String> image_urls { get; set; }
    public String condition { get { return data.get('condition'); } set; }
    public String isbn { get { return data.get('isbn'); } set; }
    public String num_beds { get { return data.get('num_beds'); } set; }
    public String num_baths { get { return data.get('num_baths'); } set; }
    public String dogs { get { return data.get('dogs'); } set; }
    public String cats { get { return data.get('cats'); } set; }
    public String smoking { get { return data.get('smoking'); } set; }
    public String sqare_footage { get { return data.get('sqare_footage'); } set; }
    public String street { get { return data.get('street'); } set; }
    public String crossstreet { get { return data.get('crossstreet'); } set; }
    public String postal { get { return data.get('postal'); } set; }
    public String rent { get { return data.get('rent'); } set; }
    public String pay { get { return data.get('pay'); } set; }
    public String full { get { return data.get('full'); } set; }
    public String intern { get { return data.get('intern'); } set; }
    public String summer { get { return data.get('summer'); } set; }
    public String nonprofit { get { return data.get('nonprofit'); } set; }
    public String pay_type { get { return data.get('pay_type'); } set; }

	public FacebookListing(XMLDom.Element xmlInfo) {
		image_urls = new List<String>();
		parseSource(xmlInfo);
	}
	
	public String getResultType() {
		return 'listing';
	}
	 
	public void parseSource(XMLDom.Element source) {
		for (XMLDom.Element c: source.childNodes) { 
			if (c.nodeName == 'image_urls') {
				for (XMLDom.Element img : c.childNodes) {
					image_urls.add(img.nodeValue);
				}
			} else {
				data.put(c.nodeName, c.nodeValue);
			}
		}
	}
}