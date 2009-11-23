public class CanvasIdeasController extends AbsSocialController{
    
    private final Idea idea;
    
    public ApexPages.StandardSetController ideaRecords{
        get {
            if(ideaRecords == null) {
                ideaRecords = new ApexPages.StandardSetController(Database.getQueryLocator(
                [SELECT Title, NumComments, VoteTotal, VoteScore  
                FROM Idea ORDER BY VoteScore DESC limit 10]));
            }
            return ideaRecords;
        }
        private set;
    }
    
    public FacebookUserInfo uInfo   { get; set;}
    public FBCAuthenticator fbAuth { get; set; }
    public transient FacebookSession fbs { get; set;}
    public List<String> uFriends    { get; set;}
    
    public List<Idea> getTop10Ideas() { 
         return (List<Idea>) ideaRecords.getRecords();
    } 
    
    public CanvasIdeasController(ApexPages.StandardSetController ideaController) {
        
        this.idea = (Idea)ideaController.getRecord(); 

        try {
            // Create authenticator
            fbAuth = new FBCAuthenticator();
            fbAuth.siteName = 'Coco Ideas';
        }
        catch (Exception ex){
            ApexPages.Message authError = new ApexPages.Message(ApexPages.severity.ERROR,
            'Could not create an Authenticator!');
            ApexPages.addMessage(authError);    
        }

        fbs = new FacebookSession(fbAuth.APIKey, fbAuth.secret, fbAuth.sessionKey);
        uFriends = fbs.getFriends();
        
    }


}