public with sharing class MyFacebookSiteHeaderController {


    public SiteConfig__c siteConfig; 

    public SiteConfig__c getSiteConfig() {
    	if (siteConfig == null) {
    		System.debug('\n\nLooking up site config using ' + Site.getName() + '\n\n');
	    	List<SiteConfig__c> configs = [Select Id, Name, FacebookAppSecret__c, APIKey__c, NewPortalUserAccount__c From SiteConfig__c Where Name = :Site.getName() Limit 1];
    		if (configs.size() == 1) {
    			siteConfig = configs.get(0);
    		} else {
    			return null;
    		}
    	}
    	return siteConfig;
    }

	public MyFacebookSiteHeaderController() {
		getSiteConfig();
	}
}