global class FutureMethods {

	private static void addNewApp(String name, String uid, String app_key, String app_secret) {
		System.debug(LoggingLevel.INFO, '\n\nIn the set keys future method.\n');
		FacebookApp__c fbApp = new FacebookApp__c(Name=name, FBUserId__c=uid, AppKey__c=app_key, AppSecret__c=app_secret);
		insert fbApp;
	} 
	
	@future(callout=true)
	public static void getAppData(List<String> ids) {
		List<FacebookAppList__c> apps = new List<FacebookAppList__c>();
		for (String id : ids) {
			FacebookAppList__c appList = [Select Id, AppKey__c, AppSecret__c, Name From FacebookAppList__c Where Id = :id];
			FacebookSession session = new FacebookSession(appList.AppKey__c, appList.AppSecret__c, '', '');
			FacebookPublicApplicationInfo pai = session.getAppPublicInfo(appList.AppKey__c);
			appList.app_id__c = pai.app_id;
			appList.canvas_name__c = pai.canvas_name;
			appList.company_name__c = pai.company_name;
			appList.daily_active_users__c = Integer.valueOf(pai.daily_active_users);
			appList.description__c = pai.description;
			appList.display_name__c = pai.display_name;
			appList.icon_url__c = pai.icon_url;
			appList.logo_url__c = pai.logo_url;
			appList.monthly_active_users__c = Integer.valueOf(pai.monthly_active_users);
			appList.weekly_active_users__c = Integer.valueOf(pai.weekly_active_users);
			apps.add(appList);
		}
		update apps;
	}
}