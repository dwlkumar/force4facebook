@isTest
private class FacebookSessionTest {
	
	/*static testMethod void constructors() {
		FacebookSession fbs = new FacebookSession('', '', '');
		fbs = new FacebookSession(new FBCAuthenticator());
		fbs = new FacebookSession('', '');
		fbs = new FacebookSession();
	}*/
	static testMethod void constructorOne() {
		
		GFCUser__c user = new GFCUser__c(Sig__c = 'sig', SessionKey__c = 'sess', Secret__c = 'secret', Name = 'somename', APIKey__c = 'apikey', user__c = Userinfo.getUserId());
		insert user;
		
		FBCAuthenticator fbc = new FBCAuthenticator();
		delete user;
		PageReference pr = new PageReference('/?fb_sig_session_key=1&fb_sig_user=sam');
		
		System.Test.setCurrentPage(pr);
		Id pId = [Select Id From Profile Where Name = 'System Administrator'][0].Id;
		User puser = new User(email = 'sam@sam.com', timezonesidkey = 'America/Los_Angeles', alias = 'samam', localesidkey = 'en_US', emailencodingkey = 'ISO-8859-1', profileid = pid, languagelocalekey = 'en_US', username = 'sam@sam.com', lastname='Smith', firstname='Sam', communitynickname='ss');
		insert puser;
		user = new GFCUser__c(Sig__c = 'sig', SessionKey__c = 'sess', Secret__c = 'secret', Name = 'sam', APIKey__c = 'apikey', user__c = puser.Id);
		insert user;
		
		fbc = new FBCAuthenticator();
		
		fbc.testing = true;
		FacebookSessionTester fbs = new FacebookSessionTester();
		fbs = new FacebookSessionTester('secret', 'sauce');
		fbs = new FacebookSessionTester(fbc);

		Test.setCurrentPage(new PageReference('/MyHome.page?refURL=something'));
		
		System.assertEquals(fbc.getIsFacebookUser(), false, '');
		System.assertNotEquals(fbc.getParameterString(), '', '');
		

		fbc.registerUser();
		Test.setCurrentPage(new PageReference('/MyHome.page?fb_sig_session_key=something&fb_sig_user=sam&fb_sig_api_key=d5ad3c34b635e2a2f1206900e837b310'));
		fbc.registerUser();
		//puser.username = 'crap@crap.com';
		//update puser;
		delete user;

		fbc = new FBCAuthenticator();
		fbc.testing = true;
		fbc.registerUser();
		
		Boolean vSig = fbc.isValidSig();
		
		System.assertEquals(fbs.getSessionKey(), null, ''); 
		System.assertEquals(fbs.getAuthToken(), null, '');
		
	   	fbs.getEvents('SOMEUID', new List<String>{'3','4'}, FacebookUtils.dateTimeToEpoch(DateTime.now()) , FacebookUtils.dateTimeToEpoch(DateTime.now()) , 'attending' );
	   	fbs.getEvents(new List<String> { '3', '4'});
	   	fbs.getEvents();
	   	fbs.getEvent('someId');
	   	
	   	fbs.registerTemplateBundle('not really a template', 'this one either');
		fbs.publishUserAction('fakeId', 'fakeData');		
	   	fbs.getNotifications();
	   	fbs.setStatus('fakeId', 'fake Status');
	   	fbs.getAppUsers();
	   	fbs.getFriends();
	   	fbs.getAppPublicInfo('fakeAPIKey');
	   	fbs.query('Select name, location From album Where owner=525031753');
	   	fbs.query('Select name, value From cookies Where uid = 525031753');
	   	fbs.query('Select name From event Where eid = 104407574239');
	   	fbs.query('Select first_name From user Where uid = 525031753');
	   	fbs.query('Select uid From event_member Where eid = 104407574239');
	   	fbs.query('Select uid2 From standard_friend_info Where uid1 = 525031753');
	   	fbs.query('SELECT flid,name FROM friendlist WHERE owner=525031753');
	   	fbs.query('SELECT flid,uid FROM friendlist_member WHERE flid IN (SELECT flid FROM friendlist WHERE owner=525031753)');
	   	fbs.query('SELECT name FROM group WHERE gid = 102520464138');
	   	fbs.query('SELECT uid, positions FROM group_member WHERE gid = 102520464138');
		fbs.createEvent(FacebookSessionTest.getEventData());
		FacebookEvent fbevent = getEventData();
		fbevent.end_time = DateTime.now().addMinutes(5);
		fbs.editEvent('211928720580', fbevent);
		fbs.cancelEvent('event_id'); 
	   	fbs.setInfoOptions('field', new List<FacebookInfoItem> { new FacebookInfoItem('label', 'field') });
		fbs.setInfo('title', new List<FacebookInfoSection> { new FacebookInfoSection()}, 'someuserid', '5');
		fbs.setFBML('uid', 'profile', 'profile_main', 'mobile_profile');
		fbs.getLoggedInUser();
		fbs.revokeAuthorization();
		fbs.getEventMembers('eventId');
		fbs.callMethod(new FacebookMethod(FacebookMethod.Error_BAD_METHOD, 'XML'));
		fbs.callSecureMethod(new FacebookMethod(FacebookMethod.Error_BAD_METHOD, 'XML'), new Map<String, String>());
		fbs.getLoginUrl('mytoken');
		fbs.pagesIsAdmin('111');
		fbs.pagesIsAppAdded('1111');
		fbs.getPageInfo(new String[]{ 'one', 'two'}, new String[]{'one', 'two'});
		XMLDom eDom = new XMLDom(FacebookXMLResponses.ERROR_BAD_METHOD_RESPONSE);
		FacebookSession.checkResponse(eDom.root.firstChild());
		String apiKey = fbc.siteAPIKey;
		fbs.getSessionKey();
		fbs.createToken();
		fbs.getSession();
		fbs.callMethod(new FacebookMethod(FacebookMethod.Events_CREATE, 'XML'), 'dave', new List<String> { 'vaone', 'kone'});
		
		
		FacebookClient.LoginParameters lp = new FacebookClient.LoginParameters();
		String v = lp.API_KEY;
		v = lp.API_VERSION;
		v = lp.AUTH_TOKEN;
		v = lp.CANVAS;
		v = lp.HIDE_CHECKBOX;
		v = lp.NEXT_URL;
		v = lp.POPUP;
		v = lp.SKIP_COOKIE;
		
		FacebookClient fc = new FacebookClient('api', 'secret', 'session');
	}
	
	public static FacebookEvent getEventData() {
		FacebookEvent fbevent = new FacebookEvent();
		fbevent.category = 'Other';
		fbevent.creator = Long.valueOf('525031753');
		fbevent.description = 'This is a test event';
		fbevent.event_subtype = 'Preview';
		fbevent.host = 'Well Me';
		fbevent.location = 'The Basement';
		fbevent.name = 'Test Event';
		fbevent.privacy_type = 'CLOSED';
		fbevent.start_time = Datetime.now();
		fbevent.end_time = Datetime.now().addHours(1);
		fbevent.tagLine = 'Its Event Time';
		fbevent.subcategory = 'Potluck';
		return fbEvent;
	}
	
}