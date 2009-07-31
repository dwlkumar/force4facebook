public with sharing class MyFacebookChangePasswordController {
 public String oldPassword {get; set;}
    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;}        
    
    public PageReference changePassword() {
        return Site.changePassword(newPassword, verifyNewPassword, oldpassword);    
    }    
    
   	public MyFacebookChangePasswordController() {}
    
   	public static testMethod void testChangePasswordController() {
        // Instantiate a new controller with all parameters in the page
        MyFacebookChangePasswordController controller = new MyFacebookChangePasswordController();
        controller.oldPassword = '123456';
        controller.newPassword = 'qwerty1'; 
        controller.verifyNewPassword = 'qwerty1';                
        
        System.assertEquals(controller.changePassword(),null);                           
    }    
}