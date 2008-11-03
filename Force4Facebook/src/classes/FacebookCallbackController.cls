public class FacebookCallbackController {

    FacebookPageComponentController controller;
    public List<FacebookInfoSection> fields { get { if (fields == null) { fields = new List<FacebookInfoSection>(); } return fields; } set; }
    public String json { get; set; }
    public String fbUserId { get; set; } 
    
    public FacebookCallbackController(FacebookPageComponentController cntrlr) {
        controller = cntrlr;
        // Grab the fields from the url parameters - this is a json representation
        json = ApexPages.currentPage().getParameters().get('fields');
        fbUserId = ApexPages.currentPage().getParameters().get('fb_sig_user');
        
        // Hack for creating a string that ends with a backslash
        String bs = '\\\\this';
        bs = bs.replace('this', '');
        json = json.replaceAll(bs, '');

        parseJSON();
    }
    
    public PageReference setFields() {
        System.debug(LoggingLevel.INFO, 'Number of fields = ' + fields.size());
        return null;
    }
    
    public class FieldThing {
        
        public String field { get; set; }
        public List<ItemThing> items { get; set; }
            
    }   
    public class ItemThing {
        public String label { get; set; }
        public String link { get; set; }
        public String description { get; set; }
        public String image { get; set; }
        public String sublabel { get; set; }
    }
     
    private void parseJSON() {
        JSONParser jp = new JSONParser();
        JSONObject jo = jp.parse(json);
        
        for (JSONObject j : jo.arrayValue) {
            FacebookInfoSection fis = new FacebookInfoSection();
            
            fis.field = j.mapValue.get('field').stringValue;
            fis.fbUserId = fbUserId;
            
            List<JSONObject> items = j.mapValue.get('items').arrayValue;
            
            for (JSONObject item : items) {
                FacebookInfoItem fii = new FacebookInfoItem(item.mapValue.get('label').stringValue, item.mapValue.get('link').stringValue);
                fii.description = item.mapValue.get('description').stringValue;
                fii.image = item.mapValue.get('image').stringValue;
                fii.sublabel = item.mapValue.get('sublabel').stringValue;
                fis.items.add(fii);
                fields.add(fis);
            }
        }   
    }
}