public class Authenticator extends FBCAuthenticator {

	private List<GFCUser__c> users; 
	public GFCUser__c user { get; set; }
	public Authenticator fbca { get; set; }
	 
    public Authenticator() {
    	fbca = this;
    }
	 
}