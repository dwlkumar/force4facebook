public class MyFacebookForgotPasswordController {
    public String username {get; set;}   
       
    public MyFacebookForgotPasswordController() {} 
	
  	public PageReference forgotPassword() {
  		boolean success = Site.forgotPassword(username);
  		PageReference pr = Page.MyFacebookForgotPasswordConfirm;
  		pr.setRedirect(true);
  		
  		if (success) {  			
  			return pr;
  		}
  		return null;
  	}
  	
  	 public static testMethod void testForgotPasswordController() {
    	// Instantiate a new controller with all parameters in the page
    	MyFacebookForgotPasswordController controller = new MyFacebookForgotPasswordController();
    	controller.username = 'test@salesforce.com';     	
    
    	System.assertEquals(controller.forgotPassword(),null); 
    }

}