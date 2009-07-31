public class MyFacebookSiteLoginController extends AbsSocialController {
    public String username {get; set;}
    public String password {get; set;}

    public PageReference login() {
        String startUrl = System.currentPageReference().getParameters().get('startURL');
        return Site.login(username, password, startUrl);
    } 
    
   	public MyFacebookSiteLoginController () {}
     
    public static testMethod void testSiteLoginController () {
        // Instantiate a new controller with all parameters in the page
        MyFacebookSiteLoginController controller = new MyFacebookSiteLoginController ();
        controller.username = 'test@salesforce.com';
        controller.password = '123456'; 
                
        System.assertEquals(controller.login(),null);                           
    }    

}