public with sharing class FacebookDevUtils {

	private static String apikey = 'd5ad3c34b635e2a2f1206900e837b310';
	private static String appSecret = '78d1a040bd144dce60dfb1c0906eda9d';
	private static String sessionkey = 'ba0d52f87d4f67213931c0d9-525031753';
	private static String uid = '525031753';
	private static String eid = '104407574239';
	
	public static void eventTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		Long startTime = FacebookUtils.dateTimeToEpoch(Datetime.now().addDays(-1));
		fbs.getEvents(uid, null, startTime, null, null);
		//fbs.getEvent(eid);
	}
	
	public static void userInfoTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		FacebookUserInfo uInfo = fbs.getUserInfo(new List<String>{ uid }, fbs.userInfoFieldList)[0]; //fields) ;
	}
	
	public static void registerTemplateBundleTest() {
		String oneLineStoryTemplate = '["{*actor*} Has submitted a new  <a href=\'{*ideaUrl*}\'>Idea - {*ideaTitle*} </a> using the <a href=\'{*siteUrl*}\'>Force.com Toolkit for Facebook Ideas Sample App</a>."]';
		String shortStoryTemplate = '["template_tile":"<a href=\'http://wiki.developerforce.com/index.php/Facebook_Toolkit\'>New Force.com Toolkit for Facebook</a> Is Easy","template_body":" {*actor*} has been contributing many Ideas on the <a href=\'{*siteUrl*}\'>Force.com Toolkit for Facebook Ideas Sample Site</a> with {*target*}."]';
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		String result = fbs.registerTemplateBundle(oneLineStoryTemplate, shortStoryTemplate);
		System.debug('\n\n\nREGISTER TEMPLATE BUNDLE RESULT: \n' + result + '\n\n\n');
	}
	
	public static void publishUserActionTest() {
		String jsonData = '{"ideaTitle":"' + 'Testing Title' + '"' + ',"siteUrl":"' + 'http://www.salesforce.com' + '"' + ',"ideaUrl":"' + 'http://www.salesforce.com' + 'ideaView?id=' + '1234567891234567' + '"}';
		String bundleId = '110632321385';
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.publishUserAction(bundleId, jsonData);		
	}
	
	public static void getNotificationsTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.getNotifications();		
	}
	
	public static void setStatusTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.setStatus(uid, 'This is a test');		
	}
	
	public static void getAppUsersTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.getAppUsers();		
	}
	
	public static void getFriendsTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.getFriends();		
	}
	
	public static void getAppPublicInfoTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.getAppPublicInfo(apiKey);		
	}
	
	public static void queryAlbumTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.query('Select name, location From album Where owner=525031753');
	}
	
	public static void queryCookieTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		System.debug('\n\nMETHOD CALL RESULT:\n' + fbs.query('Select name, value From cookies Where uid = 525031753') + '\n\n');
	}
	
	public static void queryEventTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		System.debug('\n\nMETHOD CALL RESULT:\n' + fbs.query('Select name From event Where eid = 104407574239') + '\n\n');
	}
	
	public static void queryUserTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.query('Select first_name From user Where uid = 525031753');
	}
	
	public static void queryEventMemberTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
	   	fbs.query('Select uid From event_member Where eid = 104407574239');
	}
	
	public static void queryStandardFriendInfoTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
	   	fbs.query('Select uid2 From standard_friend_info Where uid1 = 525031753');
	}
	public static void queryFriendListTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
	   	fbs.query('SELECT flid,name FROM friendlist WHERE owner=525031753');
	}

	public static void queryFriendListMemberTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
	   	fbs.query('SELECT flid,uid FROM friendlist_member WHERE flid IN (SELECT flid FROM friendlist WHERE owner=525031753)');
	}

	public static void queryGroupTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
	   	fbs.query('SELECT name FROM group WHERE gid = 102520464138');
	}

	public static void queryGroupMemberTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
	   	fbs.query('SELECT uid, positions FROM group_member WHERE gid = 102520464138');
	}
	
	public static void createEventTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.createEvent(getEventData());
	}

	public static void editEventText() {
		FacebookEvent fbevent = getEventData();
		fbevent.end_time = DateTime.now().addMinutes(5);
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.editEvent('211928720580', fbevent);
	} 

	public static void setInfoTest() {
		setupCalendar();
	}
	
	public static void getLoggedInUserTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.getLoggedInUser();		
	}
	
	public static void revokeAuthorizationTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.revokeAuthorization();		
	}
	
	public static void getEventMembersTest() { 
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.getEventMembers('104407574239');		
	}
	
	public static void errorResponseTest() {
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
		fbs.callMethod(new FacebookMethod(FacebookMethod.Error_BAD_METHOD, 'XML'));		
	}
	
	private static FacebookEvent getEventData() {
		FacebookEvent fbevent = new FacebookEvent();
		fbevent.category = 'Other';
		fbevent.creator = Long.valueOf(uid);
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
		return fbevent;
	}	
	    
	public static void setupCalendar() {
        //List<Event> events = [Select Subject, StartDateTime, Location, IsAllDayEvent, EndDateTime, Description, ActivityDateTime, ActivityDate From Event Where OwnerId = :System.UserInfo.getUserId()];
        //for (Event e : events) {
        //    System.debug(LoggingLevel.INFO, e.Subject + '\n' + e.Description);// + '", link:"' + 'http://developer.salesforce.com' + '"} ]');
            //infoFields += '[ {label:"' + e.Subject + '", description:"' + e.Description + '", link:"' + 'http://developer.salesforce.com' + '"} ]';
        //}
		FacebookSession fbs = new FacebookSession(apiKey, appSecret, sessionKey);
        String profileContent = '<fb:subtitle>Events</fb:subtitle><fb:narrow>This is the content</fb:narrow>';
        String profileWContent = '<fb:wide>This is the wide content</fb:wide>';
        fbs.setInfoOptions('Labels', getOptionItems());
        fbs.setInfoOptions('Text Items', getOptionItems2());
        fbs.setFBML(uid, profileWContent, profileContent, profileContent);
        fbs.setInfo('Platform Events', getThumbnailInfo(), uid, FacebookClient.INFO_TEXT_ONLY);
        //controller.session.setInfo('Platform Text Only', getTextInfo(), controller.fbUserId, FacebookClient.INFO_TEXT_ONLY);
    }
	
    private static FacebookInfoItem getItemOne() {
        return new FacebookInfoItem('Label One',
            'http://www.amazon.com', 
            'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg',
            'Description One',
            'Sub label one');
    }
    private static FacebookInfoItem getItemTwo() {
        return new FacebookInfoItem('Label Two', 
            'http://www.amazon.com', 
            'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg',
            'Description Two',
            'Sub label two');
    }
    private static List<FacebookInfoSection> getThumbnailInfo() {
        FacebookInfoSection fis = new FacebookInfoSection();
        fis.field = 'Labels';
        fis.items.add(getItemOne());
        fis.items.add(getItemTwo());
        List<FacebookInfoSection> out = new List<FacebookInfoSection> { fis, getTInfo() };
        return out;
    }
    private static FacebookInfoSection getTInfo() {
        FacebookInfoSection fis = new FacebookInfoSection();
        fis.field = 'Text Items';
        fis.items.add(getItemOne());
        fis.items.add(getItemTwo());
        return fis;
    }
    private static List<FacebookInfoItem> getOptionItems() {
        List<FacebookInfoItem> items = new List<FacebookInfoItem>();
        items.add(new FacebookInfoItem('Label One', 'http://www.linkone.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description One', 'Sublabel One'));
        items.add(new FacebookInfoItem('Label Two', 'http://www.linktwo.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Two', 'Sublabel Two'));
        items.add(new FacebookInfoItem('Label Three', 'http://www.linkthree.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Three', 'Sublabel Three'));
        items.add(new FacebookInfoItem('Label Four', 'http://www.linkfour.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Four', 'Sublabel Four'));
        items.add(new FacebookInfoItem('Label Five', 'http://www.linkfive.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Five', 'Sublabel Five'));
        items.add(new FacebookInfoItem('Label Six', 'http://www.linksix.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Six', 'Sublabel Six'));
        return items;   
    }
    private static List<FacebookInfoItem> getOptionItems2() {
        List<FacebookInfoItem> items = new List<FacebookInfoItem>();
        items.add(new FacebookInfoItem('Text One', 'http://www.linkone.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description One', 'Sublabel TOne'));
        items.add(new FacebookInfoItem('Text Two', 'http://www.linktwo.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Two', 'Sublabel TTwo'));
        items.add(new FacebookInfoItem('Text Three', 'http://www.linkthree.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Three', 'Sublabel TThree'));
        items.add(new FacebookInfoItem('Text Four', 'http://www.linkfour.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Four', 'Sublabel TFour'));
        items.add(new FacebookInfoItem('Text Five', 'http://www.linkfive.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Five', 'Sublabel TFive'));
        items.add(new FacebookInfoItem('Text Six', 'http://www.linksix.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Six', 'Sublabel TSix'));
        return items;   
    }
    private static List<FacebookInfoSection> getTextInfo() {
        List<FacebookInfoSection> tInfo = new List<FacebookInfoSection>();
        FacebookInfoSection fis = new FacebookInfoSection();
        fis.field = 'Text Items';
        fis.items.add(new FacebookInfoItem('This is a label', 'http://this.is.the.link'));
        fis.items.add(new FacebookInfoItem('This is another label', 'http://this.is.the.link'));
        tInfo.add(fis);
        return tInfo;
    }
	
}