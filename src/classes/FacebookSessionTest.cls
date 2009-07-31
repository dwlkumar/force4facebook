@isTest
private class FacebookSessionTest {
	
	/*static testMethod void constructors() {
		FacebookSession fbs = new FacebookSession('', '', '');
		fbs = new FacebookSession(new FBCAuthenticator());
		fbs = new FacebookSession('', '');
		fbs = new FacebookSession();
	}*/
	static testMethod void constructorOne() {
		
		FBCAuthenticator fbc = new FBCAuthenticator();
		fbc.testing = true;
		FacebookSessionTester fbs = new FacebookSessionTester(fbc);

		Test.setCurrentPage(new PageReference('/MyHome.page?refURL=something'));
		
		System.assertEquals(fbc.getIsFacebookUser(), false, '');
		System.assertNotEquals(fbc.getParameterString(), '', '');
		

		fbc.registerUser();
		Test.setCurrentPage(new PageReference('/MyHome.page?fb_sig_session_key=something&fb_sig_api_key=d5ad3c34b635e2a2f1206900e837b310'));
		fbc.registerUser();
		
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