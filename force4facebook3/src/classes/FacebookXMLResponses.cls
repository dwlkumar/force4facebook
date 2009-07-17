public with sharing class FacebookXMLResponses {
	
	public static final String FEED_PUBLISH_USER_ACTION_RESPONSE =
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<feed_publishUserAction_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd" list="true">' +
			'<feed_publishUserAction_response_elt>1</feed_publishUserAction_response_elt>' +
			'</feed_publishUserAction_response>';
				
	public static final String FEED_REGISTER_TEMPLATE_BUNDLE_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<feed_registerTemplateBundle_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">110632321385</feed_registerTemplateBundle_response>';

	public static final String USER_INFO_RESPONSE =
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<users_getInfo_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd" list="true">' +
			  '<user>' +
			    '<uid>525031753</uid>' +
			    '<about_me/>' +
			    '<pic>http://profile.ak.fbcdn.net/v224/76/92/s525031753_3959.jpg</pic>' +
			    '<uid>525031753</uid>' +
			    '<activities/>' +
			    '<birthday>October 6, 1961</birthday>' +
			    '<books/>' +
			    '<first_name>Dave</first_name>' +
			    '<is_app_user>1</is_app_user>' +
			    '<has_added_app>1</has_added_app>' +
			    '<interests/>' +
			    '<last_name>Carroll</last_name>' +
			    '<locale>en_US</locale>' +
			    '<movies/>' +
			    '<music/>' +
			    '<name>Dave Carroll</name>' +
			    '<notes_count xsi:nil="true"/>' +
			    '<pic_big>http://profile.ak.fbcdn.net/v224/76/92/n525031753_3959.jpg</pic_big>' +
			    '<pic_small>http://profile.ak.fbcdn.net/v224/76/92/t525031753_3959.jpg</pic_small>' +
			    '<pic_square>http://profile.ak.fbcdn.net/v224/76/92/q525031753_3959.jpg</pic_square>' +
			    '<political>Republican Party</political>' +
			    '<profile_update_time>0</profile_update_time>' +
			    '<quotes>&quot;Sport doesn\'t build character, it reveals it.&quot;</quotes>' +
			    '<relationship_status>Married</relationship_status>' +
			    '<religion>Christian</religion>' +
			    '<sex>male</sex>' +
			    '<significant_other_id/>' +
			    '<timezone>-7</timezone>' +
			    '<tv/>' +
			    '<wall_count>41</wall_count>' +
			    '<affiliations list="true">' +
			      '<affiliation>' +
			        '<nid>67108896</nid>' +
			        '<name>Silicon Valley, CA</name>' +
			        '<type>region</type>' +
			        '<status/>' +
			        '<year>0</year>' +
			      '</affiliation>' +
			      '<affiliation>' +
			        '<nid>50432592</nid>' +
			        '<name>salesforce.com, inc.</name>' +
			        '<type>work</type>' +
			        '<status/>' +
			        '<year>0</year>' +
			      '</affiliation>' +
			    '</affiliations>' +
			    '<current_location>' +
			      '<city>Redwood City</city>' +
			      '<state>California</state>' +
			      '<country>United States</country>' +
			      '<zip>94062</zip>' +
			    '</current_location>' +
			    '<education_history list="true">' +
			      '<education_info>' +
			        '<name>CSU Chico</name>' +
			        '<year>1988</year>' +
			        '<concentrations list="true">' +
			          '<concentration>Computer Information Systems</concentration>' +
			        '</concentrations>' +
			        '<degree/>' +
			      '</education_info>' +
			    '</education_history>' +
			    '<hometown_location>' +
			      '<city>Redwood City</city>' +
			      '<state>California</state>' +
			      '<country>United States</country>' +
			      '<zip/>' +
			    '</hometown_location>' +
			    '<hs_info>' +
			      '<hs1_name>Sequoia High</hs1_name>' +
			      '<hs2_name/>' +
			      '<grad_year>1979</grad_year>' +
			      '<hs1_id>2498</hs1_id>' +
			      '<hs2_id>0</hs2_id>' +
			    '</hs_info>' +
			    '<meeting_for list="true">' +
			      '<seeking>Networking</seeking>' +
			    '</meeting_for>' +
			    '<meeting_sex list="true">' +
			      '<sex>female</sex>' +
			    '</meeting_sex>' +
			    '<status>' +
			      '<message/>' +
			      '<time>1247174601</time>' +
			      '<status_id>0</status_id>' +
			    '</status>' +
			    '<work_history list="true">' +
			      '<work_info>' +
			        '<location>' +
			          '<city>San Francisco</city>' +
			          '<state>CA</state>' +
			          '<country>United States</country>' +
			        '</location>' +
			        '<company_name>salesforce.com, inc.</company_name>' +
			        '<position>Principal Developer Evangelist</position>' +
			        '<description>I get to work with the latest technologies that come out of salesforce.com and other companies.  I then go out into the world and talk about these technologies.</description>' +
			        '<start_date>2003-03</start_date>' +
			        '<end_date/>' +
			      '</work_info>' +
			    '</work_history>' +
			  '</user>' +
			'</users_getInfo_response>';

	public static final String EVENT_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
		'<events_get_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd" list="true">' +
		  '<event>' +
		    '<eid>104407574239</eid>' +
		    '<name>Private Event</name>' +
		    '<tagline>Testing the Toolkit</tagline>' +
		    '<nid>50432592</nid>' +
		    '<pic_small/>' +
		    '<pic_big/>' +
		    '<pic/>' +
		    '<host>Dave Carroll</host>' +
		    '<description/>' +
		    '<event_type>Other</event_type>' +
		    '<event_subtype>Carnival</event_subtype>' +
		    '<start_time>1248292800</start_time>' +
		    '<end_time>1248303600</end_time>' +
		    '<creator>525031753</creator>' +
		    '<update_time>1247758774</update_time>' +
		    '<location>In my head</location>' +
		    '<venue>' +
		      '<street/>' +
		      '<city/>' +
		      '<state/>' +
		      '<country/>' +
		    '</venue>' +
		    '<privacy>OPEN</privacy>' +
		    '<hide_guest_list>0</hide_guest_list>' +
		  '</event>' +
		'</events_get_response>';

	public static final String NOTIFICATIONS_GET_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
		'<notifications_get_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">' +
		  '<messages>' +
		    '<unread>0</unread>' +
		    '<most_recent>1245862110</most_recent>' +
		  '</messages>' +
		  '<pokes>' +
		    '<unread>1</unread>' +
		    '<most_recent>1235610498</most_recent>' +
		  '</pokes>' +
		  '<shares>' +
		    '<unread>0</unread>' +
		    '<most_recent>0</most_recent>' +
		  '</shares>' +
		  '<friend_requests list="true">' +
		    '<uid>545381219</uid>' +
		  '</friend_requests>' +
		  '<group_invites list="true"/>' +
		  '<event_invites list="true"/>' +
		'</notifications_get_response>';
		
	public static final String USERS_SET_STATUS_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<status_set_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">1</status_set_response>';	

	public static final String FRIENDS_GET_APP_USERS_RESPONSE =
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<friends_getAppUsers_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd" list="true">' +
				'<uid>23804798</uid>' +
			'</friends_getAppUsers_response>';
	
	public static final String FRIENDS_GET_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<friends_get_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd" list="true">' +
			  '<uid>202888</uid>' +
			  '<uid>209495</uid>' +
			  '<uid>416295</uid>' +
			  '<uid>418997</uid>' +
			  '<uid>1756635449</uid>' +
			  '<uid>100000092280731</uid>' +
			'</friends_get_response>';
  
  	public static final String APP_GET_PUBLIC_INFO = 
  		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<application_getPublicInfo_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">' +
			  '<app_id>104052781385</app_id>' +
			  '<api_key>d5ad3c34b635e2a2f1206900e837b310</api_key>' +
			  '<canvas_name>myfbtestthree</canvas_name>' +
			  '<display_name>My Test App 3</display_name>' +
			  '<icon_url>http://photos-b.ak.fbcdn.net/photos-ak-sf2p/v43/161/104052781385/app_2_104052781385_6041.gif</icon_url>' +
			  '<logo_url>http://photos-b.ak.fbcdn.net/photos-ak-sf2p/v43/161/104052781385/app_1_104052781385_7970.gif</logo_url>' +
			  '<developers list="true"/>' +
			  '<company_name>salesforce.com</company_name>' +
			  '<description/>' +
			  '<daily_active_users>1</daily_active_users>' +
			  '<weekly_active_users>1</weekly_active_users>' +
			  '<monthly_active_users>1</monthly_active_users>' +
			'</application_getPublicInfo_response>';
			
	public static final String FQL_QUERY_ALBUM_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<fql_query_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" list="true">' +
			  '<album>' +
			    '<name>Profile Pictures</name>' +
			    '<location/>' +
			  '</album>' +
			  '<album>' +
			    '<name>Sunrise Over San Francisco Bay</name>' +
			    '<location>Redwood City, CA</location>' +
			  '</album>' +
			'</fql_query_response>';

	public static final String FQL_QUERY_COOKIES_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<fql_query_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" list="true">' +
			  '<cookies>' +
			    '<name>test</name>' +
			    '<value>testvalue</value>' +
			  '</cookies>' +
			'</fql_query_response>';
	
	public static final String FQL_QUERY_EVENT_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<fql_query_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" list="true">' +
			  '<event>' +
			    '<name>Private Event</name>' +
			  '</event>' +
			'</fql_query_response>';

	public static final String FQL_QUERY_USER_RESPONSE =
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<fql_query_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" list="true">' +
			  '<user>' +
			    '<first_name>Dave</first_name>' +
			  '</user>' +
			'</fql_query_response>';			

	public static final String FQL_QUERY_EVENT_MEMBER_RESPONSE =
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<fql_query_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" list="true">' +
			  '<event_member>' +
			    '<uid>525031753</uid>' +
			  '</event_member>' +
			'</fql_query_response>';
	public static final String FQL_QUERY_STANDARD_FRIEND_INFO_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<fql_query_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" list="true">' +
			  '<friend_info>' +
			    '<uid2>202888</uid2>' +
			  '</friend_info>' +
			  '<friend_info>' +
			    '<uid2>209495</uid2>' +
			  '</friend_info>' +
			  '<friend_info>' +
			    '<uid2>416295</uid2>' +
			    '</fql_query_response>';
			    
	public static final String FQL_QUERY_FRIENDLIST_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<fql_query_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" list="true">' +
			  '<friendlist>' +
			    '<flid>75839161753</flid>' +
			    '<name>salesforce.com</name>' +
			  '</friendlist>' +
			  '<friendlist>' +
			    '<flid>31802296753</flid>' +
			    '<name>Some Friends</name>' +
			  '</friendlist>' +
			'</fql_query_response>';

	public static final String FQL_QUERY_FRIENDLIST_MEMBER_RESPONSE =
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<fql_query_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" list="true">' +
			  '<friendlist_member>' +
			    '<flid>75839161753</flid>' +
			    '<uid>834242541</uid>' +
			  '</friendlist_member>' +
			  '<friendlist_member>' +
			    '<flid>75839161753</flid>' +
			    '<uid>746647624</uid>' +
			  '</friendlist_member>' +
			'</fql_query_response>';
  
  	public static final String FQL_QUERY_GROUP_RESPONSE = 
  		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<fql_query_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" list="true">' +
			  '<group>' +
			    '<name>Test Group</name>' +
			  '</group>' +
			'</fql_query_response>';

	public static final String FQL_QUERY_GROUP_MEMBER_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<fql_query_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" list="true">' +
			  '<group_member>' +
			    '<uid>525031753</uid>' +
			    '<positions list="true">' +
			      '<member_type>OWNER</member_type>' +
			      '<member_type>ADMIN</member_type>' +
			    '</positions>' +
			  '</group_member>' +
			'</fql_query_response>';

	public static final String EVENTS_CREATE_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
		'<events_create_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">211928720580</events_create_response>';

	public static final String EVENTS_EDIT_RESPONSE =
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<events_edit_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">1</events_edit_response>';
	
	public static final String EVENTS_CANCEL_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<events_cancel_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">1</events_cancel_response>';
	
	public static final String PROFILE_SET_INFO_OPTIONS_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<profile_setInfoOptions_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">1</profile_setInfoOptions_response>';
	
	public static final String PROFILE_SET_FBML_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<profile_setFBML_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">1</profile_setFBML_response>';
	
	public static final String PROFILE_SET_INFO_RESPONSE =
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<profile_setInfo_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">1</profile_setInfo_response>';
	
	public static final String USERS_GET_LOGGED_IN_USER_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<users_getLoggedInUser_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">525031753</users_getLoggedInUser_response>';
	
	public static final String AUTH_REVOKE_AUTHORIZATION_RESPONSE = 
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<auth_revokeAuthorization_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">1</auth_revokeAuthorization_response>';
	
	public static final String EVENT_GET_MEMBERS_RESPONSE =
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<events_getMembers_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">' +
			  '<attending list="true">' +
			    '<uid>525031753</uid>' +
			  '</attending>' +
			  '<unsure list="true"/>' +
			  '<declined list="true"/>' +
			  '<not_replied list="true"/>' +
			'</events_getMembers_response>';
			
	public static final String ERROR_BAD_METHOD_RESPONSE =
		'<?xml version="1.0" encoding="UTF-8"?>' +
			'<error_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd">' +
			  '<error_code>3</error_code>' +
			  '<error_msg>Unknown method</error_msg>' +
			  '<request_args list="true">' +
			    '<arg>' +
			      '<key>v</key>' +
			      '<value>1.0</value>' +
			    '</arg>' +
			    '<arg>' +
			      '<key>api_key</key>' +
			      '<value>d5ad3c34b635e2a2f1206900e837b310</value>' +
			    '</arg>' +
			    '<arg>' +
			      '<key>method</key>' +
			      '<value>facebook.bad.method</value>' +
			    '</arg>' +
			    '<arg>' +
			      '<key>format</key>' +
			      '<value>XML</value>' +
			    '</arg>' +
			    '<arg>' +
			      '<key>call_id</key>' +
			      '<value>1247851657920</value>' +
			    '</arg>' +
			    '<arg>' +
			      '<key>session_key</key>' +
			      '<value>ba0d52f87d4f67213931c0d9-525031753</value>' +
			    '</arg>' +
			    '<arg>' +
			      '<key>sig</key>' +
			      '<value>91c584d852cb5a9b1495f773cd728668</value>' +
			    '</arg>' +
			  '</request_args>' +
			'</error_response>';

	public static Map<String, String> responses = new Map<String, String> {
		FacebookMethod.Events_GET => FacebookXMLResponses.EVENT_RESPONSE,
		FacebookMethod.Users_GET_INFO => FacebookXMLResponses.USER_INFO_RESPONSE,
		FacebookMethod.Feed_REGISTER_TEMPLATE_BUNDLE => FacebookXMLResponses.FEED_REGISTER_TEMPLATE_BUNDLE_RESPONSE,
		FacebookMethod.Feed_PUBLISH_USER_ACTION => FacebookXMLResponses.FEED_PUBLISH_USER_ACTION_RESPONSE,
		FacebookMethod.Notifications_GET => FacebookXMLResponses.NOTIFICATIONS_GET_RESPONSE,
		FacebookMethod.Users_SET_STATUS => FacebookXMLResponses.USERS_SET_STATUS_RESPONSE,
		FacebookMethod.Friends_GET_APP_USERS => FacebookXMLResponses.FRIENDS_GET_APP_USERS_RESPONSE,
		FacebookMethod.Friends_GET => FacebookXMLResponses.FRIENDS_GET_RESPONSE,
		FacebookMethod.Application_GET_PUBLIC_INFO => FacebookXMLResponses.APP_GET_PUBLIC_INFO,
		FacebookMethod.Events_CREATE => FacebookXMLResponses.EVENTS_CREATE_RESPONSE,
		FacebookMethod.Events_EDIT => FacebookXMLResponses.EVENTS_EDIT_RESPONSE,
		FacebookMethod.Events_CANCEL => FacebookXMLResponses.EVENTS_CANCEL_RESPONSE,
		FacebookMethod.Profile_SET_INFO_OPTIONS => FacebookXMLResponses.PROFILE_SET_INFO_OPTIONS_RESPONSE,
		FacebookMethod.Profile_SET_FBML => FacebookXMLResponses.PROFILE_SET_FBML_RESPONSE,
		FacebookMethod.Profile_SET_INFO => FacebookXMLResponses.PROFILE_SET_INFO_RESPONSE,
		FacebookMethod.Users_GET_LOGGED_IN_USER => FacebookXMLResponses.USERS_GET_LOGGED_IN_USER_RESPONSE,
		FacebookMethod.Auth_REVOKE_AUTHORIZATION => FacebookXMLResponses.AUTH_REVOKE_AUTHORIZATION_RESPONSE,
		FacebookMethod.Events_GET_MEMBERS => FacebookXMLResponses.EVENT_GET_MEMBERS_RESPONSE,
		FacebookMethod.Error_BAD_METHOD => FacebookXMLResponses.ERROR_BAD_METHOD_RESPONSE
	};
	
	public static Map<String, String> queryResponses = new Map<String, String> {
		'album' => FacebookXMLResponses.FQL_QUERY_ALBUM_RESPONSE,
		'cookies' => FacebookXMLResponses.FQL_QUERY_COOKIES_RESPONSE,
		'event' => FacebookXMLResponses.FQL_QUERY_EVENT_RESPONSE,
		'user' => FacebookXMLResponses.FQL_QUERY_USER_RESPONSE,
		'event_member' => FacebookXMLResponses.FQL_QUERY_EVENT_MEMBER_RESPONSE,
		'standard_friend_info' => FacebookXMLResponses.FQL_QUERY_STANDARD_FRIEND_INFO_RESPONSE,
		'friendlist' => FacebookXMLResponses.FQL_QUERY_FRIENDLIST_RESPONSE,
		'friendlist_member' => FacebookXMLResponses.FQL_QUERY_FRIENDLIST_MEMBER_RESPONSE,
		'group' => FacebookXMLResponses.FQL_QUERY_GROUP_RESPONSE,
		'group_member' => FacebookXMLResponses.FQL_QUERY_GROUP_MEMBER_RESPONSE
	};

}