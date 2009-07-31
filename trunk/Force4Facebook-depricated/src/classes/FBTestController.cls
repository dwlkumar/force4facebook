public class FBTestController {

    public FacebookPageComponentController controller { get; set; }
    
    public PageReference getUserInfo() {
        return null;
    }
    
    public String json { get; set; }
    
    public List<String> parameters { get { return controller.parameters; } }
    
    private final String userInfoFieldList = 'aboutMe,picUrl,uid,activities,birthday,books,first_name,is_app_user,has_added_app,interests,last_name,locale,movies,music,name,notes_count,pic_big,pic_small,pic_square,political,profile_update_time,quotes,relationship_status,religion,sex,significant_other_id,timezone,tv,wall_count,affiliations,current_location,education_history,hometown_location,hs_info,meeting_for,meeting_sex,status,work_history';
    
    public FacebookUserInfo UserInfo { get; set; }
    
    public String getFormContent() {
        return '<fb:req-choice url=\'see wiki page for fb:req-choice for details.\' label=\'Ignore the Connect test app!\' />';
    }
    public FBTestController(FacebookPageComponentController cntrlr) {
        controller = cntrlr;
        init();
    }
  
    
    private FacebookInfoItem getItemOne() {
        return new FacebookInfoItem('Label One',
            'http://www.amazon.com', 
            'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg',
            'Description One',
            'Sub label one');
    }
    private FacebookInfoItem getItemTwo() {
        return new FacebookInfoItem('Label Two', 
            'http://www.amazon.com', 
            'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg',
            'Description Two',
            'Sub label two');
    }
    private List<FacebookInfoSection> getThumbnailInfo() {
        FacebookInfoSection fis = new FacebookInfoSection();
        fis.field = 'Labels';
        fis.items.add(getItemOne());
        fis.items.add(getItemTwo());
        List<FacebookInfoSection> out = new List<FacebookInfoSection> { fis, getTInfo() };
        return out;
    }
    private FacebookInfoSection getTInfo() {
        FacebookInfoSection fis = new FacebookInfoSection();
        fis.field = 'Text Items';
        fis.items.add(getItemOne());
        fis.items.add(getItemTwo());
        return fis;
    }
    private List<FacebookInfoItem> getOptionItems() {
        List<FacebookInfoItem> items = new List<FacebookInfoItem>();
        items.add(new FacebookInfoItem('Label One', 'http://www.linkone.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description One', 'Sublabel One'));
        items.add(new FacebookInfoItem('Label Two', 'http://www.linktwo.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Two', 'Sublabel Two'));
        items.add(new FacebookInfoItem('Label Three', 'http://www.linkthree.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Three', 'Sublabel Three'));
        items.add(new FacebookInfoItem('Label Four', 'http://www.linkfour.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Four', 'Sublabel Four'));
        items.add(new FacebookInfoItem('Label Five', 'http://www.linkfive.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Five', 'Sublabel Five'));
        items.add(new FacebookInfoItem('Label Six', 'http://www.linksix.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Six', 'Sublabel Six'));
        return items;   
    }
    private List<FacebookInfoItem> getOptionItems2() {
        List<FacebookInfoItem> items = new List<FacebookInfoItem>();
        items.add(new FacebookInfoItem('Text One', 'http://www.linkone.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description One', 'Sublabel TOne'));
        items.add(new FacebookInfoItem('Text Two', 'http://www.linktwo.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Two', 'Sublabel TTwo'));
        items.add(new FacebookInfoItem('Text Three', 'http://www.linkthree.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Three', 'Sublabel TThree'));
        items.add(new FacebookInfoItem('Text Four', 'http://www.linkfour.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Four', 'Sublabel TFour'));
        items.add(new FacebookInfoItem('Text Five', 'http://www.linkfive.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Five', 'Sublabel TFive'));
        items.add(new FacebookInfoItem('Text Six', 'http://www.linksix.com', 'http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg', 'Description Six', 'Sublabel TSix'));
        return items;   
    }
    private List<FacebookInfoSection> getTextInfo() {
        List<FacebookInfoSection> tInfo = new List<FacebookInfoSection>();
        FacebookInfoSection fis = new FacebookInfoSection();
        fis.field = 'Text Items';
        fis.items.add(new FacebookInfoItem('This is a label', 'http://this.is.the.link'));
        fis.items.add(new FacebookInfoItem('This is another label', 'http://this.is.the.link'));
        tInfo.add(fis);
        return tInfo;
    }
    
    private void setupCalendar() {
        List<Event> events = [Select Subject, StartDateTime, Location, IsAllDayEvent, EndDateTime, Description, ActivityDateTime, ActivityDate From Event Where OwnerId = :System.UserInfo.getUserId()];
        for (Event e : events) {
            System.debug(LoggingLevel.INFO, e.Subject + '\n' + e.Description);// + '", link:"' + 'http://developer.salesforce.com' + '"} ]');
            //infoFields += '[ {label:"' + e.Subject + '", description:"' + e.Description + '", link:"' + 'http://developer.salesforce.com' + '"} ]';
        }
        String profileContent = '<fb:subtitle>Events</fb:subtitle><fb:narrow>This is the content</fb:narrow>';
        String profileWContent = '<fb:wide>This is the wide content</fb:wide>';
        controller.session.setInfoOptions('Labels', getOptionItems());
        controller.session.setInfoOptions('Text Items', getOptionItems2());
        controller.session.setFBML(controller.fbUserId, profileWContent, profileContent, profileContent);
        controller.session.setInfo('Platform Events', getThumbnailInfo(), controller.fbUserId, FacebookClient.INFO_TEXT_ONLY);
        //controller.session.setInfo('Platform Text Only', getTextInfo(), controller.fbUserId, FacebookClient.INFO_TEXT_ONLY);
    }
    
    public String getTContent() {
        return '<fb:tabs>' +
            '<fb:tab-item href="/ffbtoolkit" selected="true" title="Home"/>' +
            '<fb:tab-item href="gsdTask" title="To-Dos" />' +
            '<fb:tab-item href="Files" title="Files" />' +
            '<fb:tab-item href="FriendsStuff" title="Friends\' Stuff" />' +
            '</fb:tabs>';
    }
    public String getHomeTabs() {
        return '<fb:tabs>' +
            '<fb:tab-item href="/ffbtoolkit" selected="true" title="Home"/>' +
            '<fb:tab-item href="gsdTask" title="To-Dos" />' +
            '<fb:tab-item href="Files" title="Files" />' +
            '<fb:tab-item href="FriendsStuff" title="Friends\' Stuff" />' +
            '</fb:tabs>';
    }
    public String getToDoTabs() {
        return '<fb:tabs>' +
            '<fb:tab-item href="/ffbtoolkit" title="Home"/>' +
            '<fb:tab-item href="gsdTask" selected="true" title="To-Dos" />' +
            '<fb:tab-item href="Files" title="Files" />' +
            '<fb:tab-item href="FriendsStuff" title="Friends\' Stuff" />' +
            '</fb:tabs>';
    }
    public String getFilesTabs() {
        return '<fb:tabs>' +
            '<fb:tab-item href="/ffbtoolkit" title="Home"/>' +
            '<fb:tab-item href="gsdTask" title="To-Dos" />' +
            '<fb:tab-item href="Files" selected="true" title="Files" />' +
            '<fb:tab-item href="FriendsStuff" title="Friends\' Stuff" />' +
            '</fb:tabs>';
    }
    public void init() {
        //try {
            controller.session = new FacebookSession(controller.appKey, controller.appSecret, '', controller.sessionKey);
            if (controller.friends != null) {
	            List<String> myFriends = controller.friends;
	            
	            System.debug(LoggingLevel.INFO, '\n\nGet friends returned ' + controller.friends.size() + ' ids.');
	            List<IFacebookQueryResult> users = controller.session.query('SELECT current_location, name, pic FROM user WHERE uid=' + controller.friends[2] + ' OR uid=' + controller.friends[3]);
	            if (users != null) {
	                    for (IFacebookQueryResult user : users) {
	                            FacebookUserInfo u = (FacebookUserInfo)user;
	                            System.debug(LoggingLevel.INFO, '\n\nThis is from the user query \n\tName: ' + u.name + '\n\tPic Url: ' + u.pic);
	                    } 
	            }
            }
        //} catch (Exception e) {   }
        
        //setupCalendar();

        //return;



        List<IFacebookQueryResult> albums = controller.session.query('Select name, location From album Where owner=525031753');
        if (albums != null) {
                for (IFacebookQueryResult album : albums) {
                        FacebookAlbum a = (FacebookAlbum)album;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the album query \n\tName: ' + a + '\n\tLocation: ' + a);
                }
        }
        List<IFacebookQueryResult> events = controller.session.query('Select name, venue From event Where eid=24243272183');
        if (events != null) {
                for (IFacebookQueryResult event : events) {
                        FacebookEvent e = (FacebookEvent)event;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the event query \n\tName: ' + e + '\n\tVenue: ' + e);
                }
        }
        List<IFacebookQueryResult> myFriends = controller.session.query('Select uid2 From friend Where uid1=525031753');
        if (events != null) {
                for (IFacebookQueryResult friend : myFriends) {
                        FacebookFriend f = (FacebookFriend)friend;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the friend query \n\tUID2: ' + f);
                }
        }
        List<IFacebookQueryResult> friendRequests = controller.session.query('Select uid_from From friend_request Where uid_to=525031753');
        if (friendRequests != null) {
                for (IFacebookQueryResult friendRequest : friendRequests) {
                        FacebookFriendRequest fr = (FacebookFriendRequest)friendRequest;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the Friend Request query \n\tName: ' + fr.uid_from);
                }
        } 
        List<IFacebookQueryResult> friendLists = controller.session.query('Select name, flid From friendlist Where owner=525031753');
        String flid;
        if (friendLists != null) {
                for (IFacebookQueryResult friendList : friendLists) {
                        FacebookFriendList fl = (FacebookFriendList)friendList;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the Friend List query \n\tName: ' + fl.name);
                        flid = fl.flid;
                }
        }
        List<IFacebookQueryResult> friendListMembers = controller.session.query('Select uid, flid From friendlist_member Where flid=' + flid);
        System.debug(LoggingLevel.INFO, '\n\nAbout to query for friend list members.');
        if (friendListMembers != null) {
                for (IFacebookQueryResult friendListMember : friendListMembers) {
                        FacebookFriendListMember flm = (FacebookFriendListMember)friendListMember;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the Friend List Member query \n\tfriend list id: ' + flm.uid);
                }
        }
        String gid;
        List<IFacebookQueryResult> groups = controller.session.query('Select name, venue, gid FROM group WHERE gid IN (SELECT gid FROM group_member WHERE uid = \'525031753\')');
        if (groups != null) {
                for (IFacebookQueryResult agroup : groups) {
                        FacebookGroup g = (FacebookGroup)agroup;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the group query \n\tname: ' + g.name);
                        gid = g.gid;
                }
        }
        List<IFacebookQueryResult> groupMembers = controller.session.query('Select uid, gid, positions FROM group_member WHERE gid=34041182608');
        if (groupMembers != null) {
                for (IFacebookQueryResult groupMember : groupMembers) {
                        FacebookGroupMember gm = (FacebookGroupMember)groupMember;
                        if (gm.positions.size() > 0) {
                                for (FacebookGroupMember.Position pos : gm.positions) {
                                        System.debug(LoggingLevel.INFO, '\n\nThis is from the group query \n\tpositions: ' + pos.member_type);
                                }
                        }
                }
        }
        List<IFacebookQueryResult> listings = controller.session.query('SELECT listing_id, url , title, description, price, poster, update_time, category, subcategory, image_urls, condition, isbn,num_beds,num_baths,dogs,cats, smoking, square_footage, street, crossstreet, postal, rent, pay, full,intern, summer, nonprofit, pay_type FROM listing WHERE listing_id=28358621221');
        if (listings != null) {
                for (IFacebookQueryResult listing : listings) {
                        FacebookListing t = (FacebookListing)listing;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the listings query \n\tname: ' + t.title);
                        if (t.image_urls.size() > 0) {
                                for (String iu : t.image_urls) {
                                        System.debug('\n\tUrl: ' + iu);
                                }
                        }
                }
        }
        //System.debug('\n\nThere are ' + friends.size() + ' friends.');
        //getMyUserInfo(); 
    } 
     
    public PageReference getMyUserInfo() {
        //session = new FacebookSession(apiKey, API_SECRET, '', sessionKey);
        List<String> fields = new List<String>{ 'about_me', 'pic', 'education_history' };
        //List<FacebookUserInfo> uinfo = session.getUserInfo(new List<String>{ ApexPages.currentPage().getParameters().get('fuid') }, fields) ; 
        List<FacebookUserInfo> uinfo = controller.session.getUserInfo(new List<String>{ '525031753' }, controller.session.userInfoFieldList); //fields) ; 
        if (uinfo.size() > 0) {
            userInfo = uinfo[0];
        }
        return null;
    }
    
}