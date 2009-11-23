public class CanvasIdeasDetailController extends AbsSocialController{
	
	private final Idea idea;
	public FacebookUserInfo uInfo	{ get; set;}
	public FBCAuthenticator fbAuth { get; set; }
	public transient FacebookSession fbs { get; set;}
	public List<String> uFriends	{ get; set;}
    
	public CanvasIdeasDetailController(ApexPages.StandardController ideaController) {
		
		this.idea = (Idea)ideaController.getRecord(); 

		try {
			// Create authenticator
			fbAuth = new FBCAuthenticator();
			fbAuth.siteName = 'FB Example';
		}
		catch (Exception ex){
			ApexPages.Message authError = new ApexPages.Message(ApexPages.severity.ERROR,
			'Could not create an Authenticator!');
			ApexPages.addMessage(authError); 	
		}

		fbs = new FacebookSession(fbAuth.APIKey, fbAuth.secret, fbAuth.sessionKey);
		uFriends = fbs.getFriends();
		//fbs.setStatus(fbAuth.uid, 'Checking out the Coco Ideas Community on Facebook');
				
	}

}