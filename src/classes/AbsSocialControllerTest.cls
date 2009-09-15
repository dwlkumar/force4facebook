@isTest
private class AbsSocialControllerTest {

    public class TestAuthenticator extends AbsAuthenticator {
        
        public override boolean isValidSig() {
            return false;
        }
        public override SiteConfig__c fetchSiteConfig() {
            return null;
        }
        public override PageReference registerUser() {
            return null;
        }
    }
    
    public class TestSocialController extends AbsSocialController {
        
    }
    
    static testmethod void testAbsSocialController() {
        TestSocialController scontroller = new TestSocialController();
        TestAuthenticator auth = new TestAuthenticator();
        auth.clientController = scontroller;
        scontroller = (TestSocialController)auth.ClientController;
        
        System.assertNotEquals(scontroller.getAuthenticator(), null, '');
        System.assertNotEquals(scontroller.getPageController(), null, '');
        System.assertEquals(scontroller.getIsPortalUser(), true, '');
        
        Test.setCurrentPage(new PageReference('/MyHome.page?refURL=something'));
        scontroller = new TestSocialController();
        
        System.assertEquals(auth.getRedirectUrl(), '/home/home.jsp','');
        Test.setCurrentPage(new PageReference('/MyHome.page?startURL=somethingElse'));
        System.assertEquals(auth.getRedirectUrl(), 'somethingElse','');
        System.assertEquals(auth.userExists('testUserName'), false, '');
        System.assertEquals(auth.isValidSig(), false);
        System.assertEquals(auth.fetchSiteConfig(), null);
        System.assertEquals(auth.registerUser(), null);
        System.assertEquals(auth.siteConfig, null);
        System.assertEquals(auth.generatePassword('testId', 'testApiKey', 'testSecret'), 'B1rL21OKXIVjgrt5X48YNagWOyY=', '');

        Test.setCurrentPage(new PageReference('/MyHome.page'));
        scontroller.getParameterString(); 
    } 
}