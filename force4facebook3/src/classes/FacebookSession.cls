public class FacebookSession {
	public class FacebookClientException extends Exception {}
	
    public static final List<String> RSVP_TYPES = new List<String> { 'attending', 'unsure', 'declined', 'not_replied' };
    
    public FacebookClient  fbClient;
    private long            loggedInUserId  = 0;
    public List<String> userInfoFieldList = new List<String> { 'about_me', 'pic', 'uid', 'activities', 'birthday', 'books', 'first_name', 'is_app_user', 'has_added_app', 'interests', 'last_name', 'locale', 'movies', 'music', 'name', 'notes_count', 'pic_big', 'pic_small', 'pic_square', 'political', 'profile_update_time', 'quotes', 'relationship_status', 'religion', 'sex', 'significant_other_id', 'timezone', 'tv', 'wall_count', 'affiliations', 'current_location', 'education_history', 'hometown_location', 'hs_info', 'meeting_for', 'meeting_sex', 'status', 'work_history' };
 
	public FacebookSession(FBCAuthenticator fba) {
		this(fba.APIKey, fba.secret, fba.sessionKey);
	} 
	
    // First time constructor
    /*public FacebookSession(String apiKey, String secretKey) {
        fbClient = new FacebookClient(apiKey, secretKey);
    }*/ 
    
    // Second time to get the session
    /*public FacebookSession( String apiKey, String secretKey, String authToken ){
        fbClient = new FacebookClient( apiKey, secretKey, authToken );
    } */
     
    // Third time now that we have a session
    public FacebookSession(String apiKey, String secretKey, String sessionKey) {
        fbClient = new FacebookClient( apiKey, secretKey, sessionKey );
    }
    
    /*public FacebookSession( String apiKey, String secretKey, String sessionKey, long loggedInUserId )
    {
        this( apiKey, secretKey, sessionKey );
        this.loggedInUserId = loggedInUserId;
    }*/
    public String getSessionKey() {
        return fbClient.sessionKey;
    }
    public String getAuthToken() {
        return fbClient.authToken;
    }
    /////////////////////////////////////
    //////// facebook.events.xxx ////////
    /////////////////////////////////////

    public String getLoginPage() {
        return fbClient.openLoginPage();
    }
    public List<FacebookEvent> getEvents( Long userId, List<Long> eventIds, Long startTime, Long endTime, String rsvpStatus ) //throws FacebookClientException
    {
        List<Object> params = new List<Object>();
        params.add('uid');
        params.add(String.valueOf(userId));
        params.add('eids');
        params.add(FacebookUtils.listToString(eventIds));
        params.add('start_time');
        params.add(String.valueOf(startTime));
        params.add('end_time');
        params.add(String.valueOf(endTime));
        params.add('rsvp_status'); 
        params.add(String.valueOf(rsvpStatus)); 
        String resp = fbClient.callMethod( new FaceBookMethod(FaceBookMethod.Events_GET, 'XML'), params);
        List<FacebookEvent> result = new List<FacebookEvent>();
        XMLDom r = new XMLDom(resp);
        List<XMLDom.Element> events = r.getElementsByTagName('event');
        for (XMLDom.Element event : events) {
            System.debug(LoggingLevel.INFO, 'Adding an event...');
            result.add(new FacebookEvent(event));
        }
        return result; 
        // "uid", userId, "eids", eventIds,     "start_time", startTime, "end_time", endTime, "rsvp_status", rsvpStatus.toString() ) );
    }
 
    public List<FacebookEvent> getEvents( List<Long> eventIds ) //throws FacebookClientException
    {
        String resp = fbClient.callMethod( new FaceBookMethod(FaceBookMethod.Events_GET, 'XML'), new List<String> { 'eids', FacebookUtils.listToString(eventIds) });
        List<FacebookEvent> result = new List<FacebookEvent>();
        System.debug('Get event responded '+resp);
        XMLDom r = new XMLDom(resp);
        List<XMLDom.Element> events = r.getElementsByTagName('event');
        for (XMLDom.Element event : events) {
            result.add(new FacebookEvent(event));
        }
        return result; 
    }

    public FacebookEvent getEvent( Long eventId ) //throws FacebookClientException
    {
    	List<FacebookEvent> events = getEvents( new List<Long>{ eventId } ); 
        return (events != null && events.size()>0)?events[0]:null;
    }
    
    public String registerTemplateBundle(String oneLineStoryTemplates, String shortStoryTemplates) {
        List<String> params = new List<String> { 'one_line_story_templates', oneLineStoryTemplates, 'short_story_templates', '' }; //shortStoryTemplates };
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Feed_REGISTER_TEMPLATE_BUNDLE, 'XML'), params);    
        XMLDom r = new XMLDom(resp);
        System.debug('\n\nRegister Bundle Result:\n\n' + resp + '\n\n');
        return r.root.childNodes[0].nodeValue;
    }
    
    public String publishUserAction(String bundleId, String jsonData) {
        List<String> params = new List<String> { 'template_bundle_id', bundleId, 'template_data', jsonData };
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Feed_PUBLISH_USER_ACTION, 'XML'), params); 
        XMLDom r = new XMLDom(resp);
        return resp;
    }

    public List<FacebookEvent> getEvents() //throws FacebookClientException
    { 
        String resp = fbClient.callMethod( new FaceBookMethod(FaceBookMethod.Events_GET, 'XML') );
        List<FacebookEvent> result = new List<FacebookEvent>();
        XMLDom r = new XMLDom(resp);
        List<XMLDom.Element> events = r.getElementsByTagName('event');
        for (XMLDom.Element event : events) {
            result.add(new FacebookEvent(event));
        }
        return result;
    }
 
    public List<String> getNotifications() {
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Notifications_GET, 'XML') );
        System.debug(LoggingLevel.INFO, '\n\nGetNotifications:\n' + resp);
        List<String> result = new List<String>();
        XMLDom r = new XMLDom(resp);
        List<XMLDom.Element> notifications = r.getElementsByTagName('notification');
        for (XMLDom.Element notification : notifications) {
            System.debug(LoggingLevel.INFO, 'Adding an notification...');
            result.add(notification.getValue('name'));
        }
        return result;
    }

	public void setStatus(String userId, String status) {
		List<String> params = new List<String>();
		params.add('status');
		params.add(status);
		if (userId != null) {
			params.add('uid');
			params.add(userId);
		}
		String resp = fbClient.callMethod(new FacebookMethod(FacebookMethod.Status_SET, 'XML'), params );
		
	}
	
 	public List<String> getAppUsers() {
        String resp = fbClient.callMethod( new FaceBookMethod(FacebookMethod.Friends_GET_APP_USERS, 'XML'));
        List<String> result = new List<String>();
        System.debug('Get app users responded '+resp);
        XMLDom r = new XMLDom(resp);
        checkResponse(r.root);
        List<XMLDom.Element> friends = r.getElementsByTagName('uid');
        for (XMLDom.Element friend : friends) {
            System.debug(LoggingLevel.INFO, 'Adding an friend...' + friend);
            result.add(friend.nodeValue);
        }
        return result; 
 	}

    public List<String> getFriends() {
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Friends_GET, 'XML') );
        System.debug(LoggingLevel.INFO, '\n\nGetFriends:\n' + resp);
        List<String> result = new List<String>();
        XMLDom r = new XMLDom(resp);
        checkResponse(r.root);
        List<XMLDom.Element> friends = r.getElementsByTagName('uid');
        for (XMLDom.Element friend : friends) {
            System.debug(LoggingLevel.INFO, 'Adding an friend...');
            result.add(friend.nodeValue);
        }
        return result;
    }

    public FacebookPublicApplicationInfo getAppPublicInfo(String appKey) {
        List<String> params = new List<String>();
        params.add('application_api_key');
        params.add(appKey);
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Application_GET_PUBLIC_INFO, 'XML'), params );
        System.debug(LoggingLevel.INFO, '\n\nApplication.GetPublicInfo:\n' + resp);
        XMLDom r = new XMLDom(resp);
        return new FacebookPublicApplicationInfo(r.root.childNodes[0]);
    }

    public List<IFacebookQueryResult> query(String fql) {
        List<String> params = new List<String>();
        params.add('query');
        params.add(fql);
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Fql_QUERY, 'XML'), params );
        System.debug(LoggingLevel.INFO, '\n\nQuery:\n' + resp);
        List<String> result = new List<String>();
        XMLDom r = new XMLDom(resp);
        
        return parseQueryResponse(r.root);
    }

	public static void checkResponse(XMLDom.Element root) {
        if ( root.childNodes[0].nodeName.equals('error_response') )
        {
        	String error_code = root.childNodes[0].getElementByTagName('error_code').nodeValue;
        	String error_message = root.childNodes[0].getElementByTagName('error_msg').nodeValue;
        	
        	throw new FacebookClientException(error_code + ': ' + error_message);
        }
	}
	
    private List<IFacebookQueryResult> parseQueryResponse(XMLDom.Element root) {
    	checkResponse(root);
        List<IFacebookQueryResult> results = new List<IFacebookQueryResult>();
        List<XMLDom.Element> items = root.childNodes[0].childNodes;
        for (XMLDom.Element item : items) {
            results.add(newQueryResult(item));
        }
        return results;
    }
    
    private IFacebookQueryResult newQueryResult(XMLDom.Element item) {
        String resultType = item.nodeName;
        IFacebookQueryResult result;
        if (resultType == 'user') {
            result = new FacebookUserInfo(item);
        } else if (resultType == 'album') {
            result =  new FacebookAlbum(item);
        } else if (resultType == 'cookies') {
            result = new FacebookCookies(item);
        } else if (resultType == 'event') {
            result = new FacebookEvent(item);
        } else if (resultType == 'event_member') {
            result = new FacebookEventMember(item);
        } else if (resultType == 'friend_info') {
            result = new FacebookFriend(item);
        } else if (resultType == 'friendlist') {
            result = new FacebookFriendList(item);
        } else if (resultType == 'friendlist_member') {
            result = new FacebookFriendListMember(item);
        } else if (resultType == 'group') {
            result = new FacebookGroup(item);
        } else if (resultType == 'group_member') {
            result = new FacebookGroupMember(item);
        } else if (resultType == 'listing') {
            result = new FacebookListing(item);
        }
        return result;
    }
        
    public Long createEvent(FacebookEvent event) {
    	FBJSONObject eventJsonObject = event.toJSON(true);
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Events_CREATE, 'XML'), new List<String> { 'event_info', eventJsonObject.dump() } );
        List<String> result = new List<String>();
        XMLDom r = new XMLDom(resp);
        checkResponse(r.root);
        return Long.valueOf(r.root.getValue('events_create_response'));
    }

    public Integer editEvent(Long eid, FacebookEvent event) {
    	FBJSONObject eventJsonObject = event.toJSON(true);
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Events_EDIT, 'XML'), new List<String> { 'eid', String.valueOf(eid), 'event_info', eventJsonObject.dump() } );
        List<String> result = new List<String>();
        XMLDom r = new XMLDom(resp);
        checkResponse(r.root);
        return Integer.valueOf(r.root.getValue('events_edit_response'));
    }

    public Integer cancelEvent(Long eid) {
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Events_CANCEL, 'XML'), new List<String> { 'eid', String.valueOf(eid) } );
        List<String> result = new List<String>();
        XMLDom r = new XMLDom(resp);
        checkResponse(r.root);
        return Integer.valueOf(r.root.getValue('events_cancel_response'));
    }
     
    public List<String> setInfo(String title, List<FacebookInfoSection> itemInfo, String userId, String pageType) {
        String jsonInfo = '[';
        for (FacebookInfoSection fis : itemInfo) {
            jsonInfo += fis.toJSON() + ',';
        }
        if (itemInfo.size() > 0) {
            jsonInfo = jsonInfo.substring(0, jsonInfo.length() - 1) ;
        }
        jsonInfo += ']';
        List<String> params = new List<String> { 'title', title, 'type', pageType, 'info_fields', jsonInfo, 'uid', userId };
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Profile_SET_INFO, 'XML'), params );
        System.debug(LoggingLevel.INFO, '\n\nSet Info:\n' + resp);
        List<String> result = new List<String>();
        XMLDom r = new XMLDom(resp);
        checkResponse(r.root);
        return null;
    }

    public List<String> setInfoOptions(String field, List<FacebookInfoItem> itemInfo) {
        String jsonInfo = '[';
        for (FacebookInfoItem fii : itemInfo) {
            jsonInfo += fii.toJSON() + ',';
        }
        if (itemInfo.size() > 0) {
            jsonInfo = jsonInfo.substring(0, jsonInfo.length() - 1) ;
        }
        jsonInfo += ']';
        List<String> params = new List<String> { 'field', field, 'options', jsonInfo };
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Profile_SET_INFO_OPTIONS, 'XML'), params );
        System.debug(LoggingLevel.INFO, '\n\nSet Info Options:\n' + resp);
        List<String> result = new List<String>();
        XMLDom r = new XMLDom(resp);
        checkResponse(r.root);
        return null;
    }

    public List<String> setFBML(String uid, String profile, String profile_main, String mobile_profile) {
        List<String> params = new List<String> { 'uid', uid };
        if (profile != null) { params.add('profile'); params.add(profile); }
        if (profile_main != null) { params.add('profile_main'); params.add(profile_main); }
        if (mobile_profile != null) { params.add('mobile_profile'); params.add(mobile_profile); }
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Profile_SET_FBML, 'XML'), params );
        System.debug(LoggingLevel.INFO, '\n\nSet FBML:\n' + resp);
        List<String> result = new List<String>();
        XMLDom r = new XMLDom(resp);
        checkResponse(r.root);
        return null;
    }

	public String getLoggedInUser()
	{
		String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Users_GET_LOGGED_IN_USER, 'XML'), new List<String> {} );
		XMLDom r = new XMLDom(resp);
		checkResponse(r.root);
		return r.root.getValue('users_getLoggedInUser_response');
	}
	
	public void revokeAuthorization() {
		String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Auth_REVOKE_AUTHORIZATION, 'XML') );	
	}
	
    public List<FacebookUserInfo> getUserInfo(List<String> uids, List<String> fieldNames) {
        List<String> params = new List<String>();
        params.add('uids');
        String suids = '';
        for (String uid : uids) {
            suids += uid + ',';
        }
        params.add(suids.substring(0, suids.length() - 1));
        params.add('fields');
        String sfields = '';
        for (String fieldName : fieldNames) {
            sfields += fieldName + ',';
        }
        params.add(sfields.substring(0, sfields.length() - 1));
        
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Users_GET_INFO, 'XML'), params );
        System.debug(LoggingLevel.INFO, '\n\nGet User Info:\n' + resp);
        List<FacebookUserInfo> result = new List<FacebookUserInfo>();
        XMLDom r = new XMLDom(resp);
        checkResponse(r.root);
        
        List<XMLDom.Element> infos = r.getElementsByTagName('user');
        for (XMLDom.Element info : infos) {
            System.debug(LoggingLevel.INFO, 'Getting info...');
            result.add(new FacebookUserInfo(info));
        }
        return result;
    }
    
    public List<FacebookEventMember> getEventMembers( long eventId ) //throws FacebookClientException
    {
        String resp = fbClient.callMethod( new FacebookMethod(FacebookMethod.Events_GET_MEMBERS, 'XML'), new List<String> { 'eid', String.valueOf(eventId) } );
        List<FacebookEventMember> result = new List<FacebookEventMember>();
        System.debug(resp);
        XMLDom r = new XMLDom(resp);
        checkResponse(r.root);
        
        for ( String rsvpType: RSVP_TYPES )
        {
        	XMLDom.Element rsvpGroup = r.getElementByTagName(rsvpType);
        	
        	if ( rsvpGroup != null )
        	{
        		List<XMLDom.Element> members = rsvpGroup.getElementsByTagName('uid');
        		
		        for (XMLDom.Element member : members) {
		        	FacebookEventMember eventMember = new FacebookEventMember();
		        	eventMember.rsvp_status = rsvpType;
		        	eventMember.eid = String.valueOf(eventId);
		        	eventMember.uid = member.textContent();
		        	System.debug('Adding attendee '+member.textContent()+' for event ' + eventId + ' as ' + rsvpType);
		            result.add(eventMember);
		        }
        	}
        }
        
        return result;
    }

}