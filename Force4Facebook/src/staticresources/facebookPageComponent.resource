	window.api_key = "{!apiKey}";
	/*
	* API key, this should be initialized before any another function in this file is called.
	*/
	var is_initialized = false;

	/*
	* Ensure Facebook app is initialized and call callback afterward
	*
	*/
	function ensure_init(callback) {
		if(!window.api_key) {
			window.alert("api_key is not set");
			document.getElementById("{!$Component.params}").style.display = "block";
		}
		
		if(window.is_initialized) {
			callback();
		} else {
			FB_RequireFeatures(["XFBML", "CanvasUtil"], function() {
				FB.FBDebug.LogLevel = 4;
				FB.Facebook.init(window.api_key, "xd_receiver");
				window.is_initialized = true;
				callback();
			}); 
		}
	}
	
	function facebook_onload(already_logged_into_facebook) {
		ensure_init(function() 
		{
			FB.Connect.requireSession();
			FB.Facebook.get_sessionState().waitUntilReady(function(session) {
					var is_now_logged_into_facebook = session ? true : false;
				document.getElementById("{!$Component.login}").style.display = "none";
				document.getElementById("{!$Component.wrapper}").style.display = "block";
				if (is_now_logged_into_facebook == already_logged_into_facebook) {
					return;
				}
	
				updateValues = '"' + session.session_key + '","' + session.uid + '","' + session.sig + '","' + session.secret + '","' + session.expires + '"';
				window.setTimeout('sendSessionKey(' + updateValues + ')', 1000);
			});
		});
	} 
	
	/*
	* Prompts the user to grant a permission to the application.
	*/
	function facebook_prompt_permission(permission) {
		ensure_init(function() {
			FB.Connect.showPermissionDialog(permission);
		});
	}
	
	//facebook_onload("false");
