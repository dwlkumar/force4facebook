public class FacebookQueryString {
	
	public String fb_sig {get; set;} // Request signature
	public String fb_sig_added {get; set;} // 1 if there is a sig
	public String fb_sig_api_key {get; set;} // API_KEY
	public String fb_sig_expires {get; set;} // Sesion expires
	public String fb_sig_friends {get; set { fb_sig_friends = value; parseFriends();} }// Id list of friends 202888,1109103,1211179,3321084,4804544,6816259,500044457,500071116,500078483,500093930,500104430,501314559,507986395,509054762,513439162,527006474,528292771,531443774,532805546,533772570,534378641,538155823,540152728,540271981,542867395,543164114,547508456,549161183,554707160,555977904,556066038,563899618,565958903,566601947,577431969,578695751,589813474,591698451,599967027,603581039,610912607,612121016,616020834,620081624,623391015,627831298,629603003,630062637,635872086,645063277,649887460,652688599,653975129,668287580,669086711,669560624,671941095,675454930,679224781,679472728,679717574,681476329,686751830,688252183,688956318,690071005,690200862,690454501,699748976,703129465,708427925,709783833,717810700,722012312,724439752,733962753,739715398,741649831,746647624,746811966,749144002,766292291,770410334,773111843,784584679,785797717,789353055,815149950,834242541,842450121,863735633,1388174596,1432095613
	public List<String> fb_sig_friendsList {get; set;}
	public String fb_sig_in_canvas {get; set;} // 1 if we are running in the canvas
	public String fb_sig_in_new_facebook {get; set;} // 1 if we are in a new facebook ????
	public String fb_sig_locale {get; set;}	// en_US
	public String fb_sig_position_fix {get; set;} //: 1
	public String fb_sig_profile_update_time {get; set;} //: 1219076484
	public String fb_sig_request_method {get; set;} //: GET
	public String fb_sig_session_key {get; set;} //: 3711f0b27816dcd1a77c7218-525031753
	public String fb_sig_time {get; set;} //: 1219345420.1902
	public String fb_sig_user {get; set;} //: 525031753
	
	private void parseFriends() {
		fb_sig_friendsList = fb_sig_friends.split(',');
	}
	public Boolean hasAPIKey { get; set; }
	public Boolean hasSessionKey { get; set; }
	
	public FacebookQueryString(Map<String, String> params) {
		hasAPIKey = false;
		hasSessionKey = false;
		for (String param : params.keySet()) {
			System.debug(param + ': ' + params.get(param));
			if (param == 'fb_sig') fb_sig = params.get(param);
			if (param == 'fb_sig_added') fb_sig_added = params.get(param);
			if (param == 'fb_sig_api_key') {
				fb_sig_api_key = params.get(param);
				hasAPIKey = true;
			}
			if (param == 'fb_sig_expires') fb_sig_expires = params.get(param);
			if (param == 'fb_sig_friends') fb_sig_friends = params.get(param);
			if (param == 'fb_sig_in_canvas') fb_sig_in_canvas = params.get(param);
			if (param == 'fb_sig_in_new_facebook') fb_sig_in_new_facebook = params.get(param);
			if (param == 'fb_sig_locale') fb_sig_locale = params.get(param);
			if (param == 'fb_sig_position_fix') fb_sig_position_fix = params.get(param);
			if (param == 'fb_sig_profile_update_time') fb_sig_profile_update_time = params.get(param);
			if (param == 'fb_sig_request_method') fb_sig_request_method = params.get(param);
			if (param == 'fb_sig_session_key') {
				fb_sig_session_key = params.get(param);
				hasSessionKey = true;
			}
			if (param == 'fb_sig_time') fb_sig_time = params.get(param);
			if (param == 'fb_sig_user') fb_sig_user = params.get(param);
        }
			
	}
	
	static testMethod void doTest() {
		
		FacebookQueryString fqs = new FacebookQueryString(new Map<String, String>());
		
		fqs.fb_sig= 'fb_sig'; // Request signature
		fqs.fb_sig_added= 'fb_sig_added'; // 1 if there is a sig
		fqs.fb_sig_api_key= 'fb_sig_api_key'; // API_KEY
		fqs.fb_sig_expires= 'fb_sig_expires'; // Sesion expires
		fqs.fb_sig_friends = 'fb_sig_friends,friends'; // Id list of friends 202888,1109103,1211179,3321084,4804544,6816259,500044457,500071116,500078483,500093930,500104430,501314559,507986395,509054762,513439162,527006474,528292771,531443774,532805546,533772570,534378641,538155823,540152728,540271981,542867395,543164114,547508456,549161183,554707160,555977904,556066038,563899618,565958903,566601947,577431969,578695751,589813474,591698451,599967027,603581039,610912607,612121016,616020834,620081624,623391015,627831298,629603003,630062637,635872086,645063277,649887460,652688599,653975129,668287580,669086711,669560624,671941095,675454930,679224781,679472728,679717574,681476329,686751830,688252183,688956318,690071005,690200862,690454501,699748976,703129465,708427925,709783833,717810700,722012312,724439752,733962753,739715398,741649831,746647624,746811966,749144002,766292291,770410334,773111843,784584679,785797717,789353055,815149950,834242541,842450121,863735633,1388174596,1432095613
		List<String> fl = new List<String>();
		fl.add('one');
		fl.add('two');
		fqs.fb_sig_friendsList= fl;
		fqs.fb_sig_in_canvas= 'fb_sig_in_canvas'; // 1 if we are running in the canvas
		fqs.fb_sig_in_new_facebook= 'fb_sig_in_new_facebook'; // 1 if we are in a new facebook ????
		fqs.fb_sig_locale= 'fb_sig_locale';	// en_US
		fqs.fb_sig_position_fix= 'fb_sig_position_fix'; //: 1
		fqs.fb_sig_profile_update_time= 'fb_sig_profile_update_time'; //: 1219076484
		fqs.fb_sig_request_method= 'fb_sig_request_method'; //: GET
		fqs.fb_sig_session_key= 'fb_sig_session_key'; //: 3711f0b27816dcd1a77c7218-525031753
		fqs.fb_sig_time= 'fb_sig_time'; //: 1219345420.1902
		fqs.fb_sig_user= 'fb_sig_user'; //: 525031753
		fqs.hasAPIKey = false;
		fqs.hasSessionKey = false;
		
		System.assertEquals(fqs.fb_sig, 'fb_sig'); // Request signature
		System.assertEquals(fqs.fb_sig_added, 'fb_sig_added'); // 1 if there is a sig
		System.assertEquals(fqs.fb_sig_api_key, 'fb_sig_api_key'); // API_KEY
		System.assertEquals(fqs.fb_sig_expires, 'fb_sig_expires'); // Sesion expires
		System.assertEquals(fqs.fb_sig_friends , 'fb_sig_friends,friends'); // Id list of friends 202888,1109103,1211179,3321084,4804544,6816259,500044457,500071116,500078483,500093930,500104430,501314559,507986395,509054762,513439162,527006474,528292771,531443774,532805546,533772570,534378641,538155823,540152728,540271981,542867395,543164114,547508456,549161183,554707160,555977904,556066038,563899618,565958903,566601947,577431969,578695751,589813474,591698451,599967027,603581039,610912607,612121016,616020834,620081624,623391015,627831298,629603003,630062637,635872086,645063277,649887460,652688599,653975129,668287580,669086711,669560624,671941095,675454930,679224781,679472728,679717574,681476329,686751830,688252183,688956318,690071005,690200862,690454501,699748976,703129465,708427925,709783833,717810700,722012312,724439752,733962753,739715398,741649831,746647624,746811966,749144002,766292291,770410334,773111843,784584679,785797717,789353055,815149950,834242541,842450121,863735633,1388174596,1432095613
		System.assertEquals(fqs.fb_sig_friendsList, fl);
		System.assertEquals(fqs.fb_sig_in_canvas, 'fb_sig_in_canvas'); // 1 if we are running in the canvas
		System.assertEquals(fqs.fb_sig_in_new_facebook, 'fb_sig_in_new_facebook'); // 1 if we are in a new facebook ????
		System.assertEquals(fqs.fb_sig_locale, 'fb_sig_locale');	// en_US
		System.assertEquals(fqs.fb_sig_position_fix, 'fb_sig_position_fix'); //: 1
		System.assertEquals(fqs.fb_sig_profile_update_time, 'fb_sig_profile_update_time'); //: 1219076484
		System.assertEquals(fqs.fb_sig_request_method, 'fb_sig_request_method'); //: GET
		System.assertEquals(fqs.fb_sig_session_key, 'fb_sig_session_key'); //: 3711f0b27816dcd1a77c7218-525031753
		System.assertEquals(fqs.fb_sig_time, 'fb_sig_time'); //: 1219345420.1902
		System.assertEquals(fqs.fb_sig_user, 'fb_sig_user'); //: 525031753
		System.assertEquals(fqs.hasAPIKey , false);
		System.assertEquals(fqs.hasSessionKey , false);
	
		Map<String, String> p = new Map<String, String>();
		p.put('fb_sig', '');
		p.put('fb_sig_added', 'fb_sig_added');
		p.put('fb_sig_api_key', 'fb_sig_api_key');
		p.put('fb_sig_expires', 'fb_sig_expires');
		p.put('fb_sig_friends', 'fb_sig_friends');
		p.put('fb_sig_in_canvas', 'fb_sig_in_canvas');
		p.put('fb_sig_in_new_facebook', 'fb_sig_in_new_facebook');
		p.put('fb_sig_locale', 'fb_sig_locale');
		p.put('fb_sig_position_fix', 'fb_sig_position_fix');
		p.put('fb_sig_profile_update_time', 'fb_sig_profile_update_time');
		p.put('fb_sig_request_method', 'fb_sig_request_method');
		p.put('fb_sig_session_key', 'fb_sig_session_key');
		p.put('fb_sig_time', 'fb_sig_time');
		p.put('fb_sig_user', 'fb_sig_user');
		
		fqs.parseFriends();
		fqs = new FacebookQueryString(p);
	}
}