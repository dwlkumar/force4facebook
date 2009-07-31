public class FBTestControllerSDK {

    public PageReference getUserInfo() {
        return null;
    }
        
    //public String API_KEY { get { return 'd6dcc02a5ecdbee15b00cc0779c2683e'; } }  //ConnectForce
    public String API_KEY { get { return 'bd157275efff039604c464b3a0f41254'; } }
    //public String API_KEY { get { return '1ddde354953f8a3d5d927868039cc50e'; } }  //ConnectForce2
    
    private final String API_SECRET = '2dcfb6174736898cc063c5859814675e';
    private final String userInfoFieldList = 'aboutMe,picUrl,uid,activities,birthday,books,first_name,is_app_user,has_added_app,interests,last_name,locale,movies,music,name,notes_count,pic_big,pic_small,pic_square,political,profile_update_time,quotes,relationship_status,religion,sex,significant_other_id,timezone,tv,wall_count,affiliations,current_location,education_history,hometown_location,hs_info,meeting_for,meeting_sex,status,work_history';
    
    private String apiKey = 'bd157275efff039604c464b3a0f41254';
    
    private String sessionKey = 'ba909ca44c3b22faa458019d-525031753';
    
    private transient FacebookSession session;
    public FacebookQueryString queryString { get; set; }
    
    public String myUid { get { return '500071116'; } set; }
    public List<String> friends {get; set;}
    public FacebookUserInfo UserInfo { get; set; }
    public String getMySessionKey() { return sessionKey; }
    public String getMyAPIKey() { return apiKey; }
    
    public List<FacebookUserInfo> myFriends { get; set; }
    public List<FacebookEvent> myEvents { get; set; }
     
    public String loginDisplay { get; set; }
    
    public String getFormContent() {
        return '<fb:req-choice url=\'see wiki page for fb:req-choice for details.\' label=\'Ignore the Connect test app!\' />';
    }
    public FBTestControllerSDK() {
    }

    public void init() {
    	myEvents = new List<FacebookEvent>();
        loginDisplay = 'none';
        if (ApexPages.currentPage().getParameters().size() > 0) {
                queryString = new FacebookQueryString(ApexPages.currentPage().getParameters());
                if (queryString.hasAPIKey) {
                        apiKey = queryString.fb_sig_api_key;
                }
                if (queryString.hasSessionKey) {
                        sessionKey = queryString.fb_sig_session_key;
                }
        } 
        session = new FacebookSession(apiKey, API_SECRET, '', sessionKey);
        friends = session.getFriends();
        System.debug(LoggingLevel.INFO, '\n\nGet friends returned ' + friends.size() + ' ids.');
        List<IFacebookQueryResult> users = session.query('SELECT uid, pic, name FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1=525031753)');
//        List<IFacebookQueryResult> users = session.query('SELECT current_location, name, pic FROM user WHERE uid=' + friends[2] + ' OR uid=' + friends[3]);
        if (users != null) {
		    	myFriends = new List<FacebookUserInfo>(); 
                for (IFacebookQueryResult xuser : users) {
                        FacebookUserInfo u = (FacebookUserInfo)xuser;
                        
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the user query \n\tName: ' + u.name + '\n\tPic Url: ' + u.pic + '\n');
                        if (myFriends == null || u == null) {
                        	System.debug(LoggingLevel.INFO, '\n\n**********ERRORERRORERROR');
                        } else {
	                        myFriends.add(u);
                        }
                } 
        }
 /*       List<IFacebookQueryResult> albums = session.query('Select name, location From album Where owner=525031753');
        if (albums != null) {
                for (IFacebookQueryResult album : albums) {
                        FacebookAlbum a = (FacebookAlbum)album;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the album query \n\tName: ' + a.name + '\n\tLocation: ' + a.location);
                }
        } 
 */       //myEvents = session.getEvents();
        List<IFacebookQueryResult> events = session.query('Select name, venue, start_time, end_time, pic, event_type From event Where eid=15525522426');
        if (events != null) {
                for (IFacebookQueryResult event : events) {
                        FacebookEvent e = (FacebookEvent)event;
                        myEvents.add((FacebookEvent)event);
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the event query \n\tName: ' + e.name + '\n\tVenue: ' + e.venue);
                }
        }
        List<IFacebookQueryResult> myFriends = session.query('Select uid2 From friend Where uid1=525031753');
        if (events != null) {
                for (IFacebookQueryResult friend : myFriends) {
                        FacebookFriend f = (FacebookFriend)friend;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the friend query \n\tUID2: ' + f.uid2);
                }
        }
        List<IFacebookQueryResult> friendRequests = session.query('Select uid_from From friend_request Where uid_to=525031753');
        if (friendRequests != null) {
                for (IFacebookQueryResult friendRequest : friendRequests) {
                        FacebookFriendRequest fr = (FacebookFriendRequest)friendRequest;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the Friend Request query \n\tName: ' + fr.uid_from);
                }
        } 
        List<IFacebookQueryResult> friendLists = session.query('Select name, flid From friendlist Where owner=525031753');
        String flid;
        if (friendLists != null) {
                for (IFacebookQueryResult friendList : friendLists) {
                        FacebookFriendList fl = (FacebookFriendList)friendList;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the Friend List query \n\tName: ' + fl.name);
                        flid = fl.flid;
                }
        }
        List<IFacebookQueryResult> friendListMembers = session.query('Select uid, flid From friendlist_member Where flid=' + flid);
        System.debug(LoggingLevel.INFO, '\n\nAbout to query for friend list members.');
        if (friendListMembers != null) {
                for (IFacebookQueryResult friendListMember : friendListMembers) {
                        FacebookFriendListMember flm = (FacebookFriendListMember)friendListMember;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the Friend List Member query \n\tfriend list id: ' + flm.uid);
                }
        }
        String gid;
        List<IFacebookQueryResult> groups = session.query('Select name, venue, gid FROM group WHERE gid IN (SELECT gid FROM group_member WHERE uid = \'525031753\')');
        if (groups != null) {
                for (IFacebookQueryResult agroup : groups) {
                        FacebookGroup g = (FacebookGroup)agroup;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the group query \n\tname: ' + g.name);
                        gid = g.gid;
                }
        }
        List<IFacebookQueryResult> groupMembers = session.query('Select uid, gid, positions FROM group_member WHERE gid=34041182608');
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
        List<IFacebookQueryResult> listings = session.query('SELECT listing_id, url , title, description, price, poster, update_time, category, subcategory, image_urls, condition, isbn,num_beds,num_baths,dogs,cats, smoking, square_footage, street, crossstreet, postal, rent, pay, full,intern, summer, nonprofit, pay_type FROM listing WHERE listing_id=28358621221');
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
        List<FacebookUserInfo> uinfo = session.getUserInfo(new List<String>{ '525031753' }, session.userInfoFieldList); //fields) ; 
        if (uinfo.size() > 0) {
            userInfo = uinfo[0];
        }
        return null;
    }
    
    public String getUserId() {
        return myUid;
    }
}