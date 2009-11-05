@isTest
private class AbsAuthenticatorTest {

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
    
    
    static testmethod void changeUser() {
        List<User> u = [Select Id, Username, email From user Where UserType = 'PowerCustomerSuccess'];
        if (u.size() > 0) {
            u[0].email = 'foo@bar.com';
            update u;
        }
    }
    
    static testmethod void testAbsAthenticator() {
        TestAuthenticator auth = new TestAuthenticator();
        System.assertEquals(auth.isValidSig(), false, '');
        System.assertEquals(auth.fetchSiteConfig(), null, '');
        System.assertEquals(auth.registerUser(), null, '');
        
        SiteConfig__c sc = auth.siteConfig;
        System.assertNotEquals(auth.getRedirectUrl(), '/home/home.jsp','');
        
        TestSocialController scontroller = new TestSocialController();
        
        Test.setCurrentPage(new PageReference('/MyHome.page?refURL=something'));
        scontroller = new TestSocialController();
        auth.clientController = scontroller;
    }
    
}