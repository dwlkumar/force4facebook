public class FBTestControllerConnect {
	
	// Needs to be in the controller for Auth
    public String API_KEY { get { return 'd6dcc02a5ecdbee15b00cc0779c2683e'; } set; }  //ConnectForce
    private final String API_SECRET = '2dcfb6174736898cc063c5859814675e';
	public String sessionKey { get; set; }
	
	// Need to make this transient since it's not serializable and re-hydrate when needed using
	// API_KEY, API_SECRET and sessionKey
    private transient FacebookSession session;
    
    // Container for params sent by Facebook when on the Facebook canvas, profile etc.
    public FacebookQueryString queryString { get; set; }
    
    // NO-OP for update session key from JS
    public PageReference updateSessionKey() { return null; }
    
    // This is specific to the <fb:requestForm > tag.  Putting it on the page results in a parsing error.
    public String getFormContent() {
        return '<fb:req-choice url=\'see wiki page for fb:req-choice for details.\' label=\'Ignore the Connect test app!\' />';
    }

    public void init() {
        if (ApexPages.currentPage().getParameters().size() > 0) {
    		// We drop into here if we are on the facebook canvas, not sure it's appropriate for connect
            queryString = new FacebookQueryString(ApexPages.currentPage().getParameters());
            if (queryString.hasAPIKey) {
                    API_KEY = queryString.fb_sig_api_key;
            }
            if (queryString.hasSessionKey) {
                    sessionKey = queryString.fb_sig_session_key;
            }
        }
    }
    private void runAPITests() {
        // We need a session object if we are to do any server-side API calls
        session = new FacebookSession(API_KEY, API_SECRET, '', sessionKey);
        /*friends = session.getFriends();
        System.debug(LoggingLevel.INFO, '\n\nGet friends returned ' + friends.size() + ' ids.');
        List<IFacebookQueryResult> users = session.query('SELECT current_location, name, pic FROM user WHERE uid=' + friends[2] + ' OR uid=' + friends[3]);
        if (users != null) {
                for (IFacebookQueryResult user : users) {
                        FacebookUserInfo u = (FacebookUserInfo)user;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the user query \n\tName: ' + u.name + '\n\tPic Url: ' + u.pic);
                } 
        }
        List<IFacebookQueryResult> albums = session.query('Select name, location From album Where owner=525031753');
        if (albums != null) {
                for (IFacebookQueryResult album : albums) {
                        FacebookAlbum a = (FacebookAlbum)album;
                        System.debug(LoggingLevel.INFO, '\n\nThis is from the album query \n\tName: ' + a.name + '\n\tLocation: ' + a.location);
                }
        }
        List<IFacebookQueryResult> events = session.query('Select name, venue From event Where eid=24243272183');
        if (events != null) {
                for (IFacebookQueryResult event : events) {
                        FacebookEvent e = (FacebookEvent)event;
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
        */
    } 
     
}