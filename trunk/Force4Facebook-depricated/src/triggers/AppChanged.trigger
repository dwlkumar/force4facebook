trigger AppChanged on FacebookApp__c (after insert, after update) {

	if (FacebookUtils.triggerFirstRun == true) {
		List<String> ids = new List<String>();
		for (FacebookApp__c one : trigger.new) {
			ids.add(one.AppKey__c);
		}
		List<FacebookAppList__c> appList = [Select Id From FacebookAppList__c Where AppKey__c in :ids];
		ids = new List<String>();
		for (FacebookAppList__c app : appList) {
			ids.add(app.Id);
		}
		FutureMethods.getAppData(ids); 
	}

}