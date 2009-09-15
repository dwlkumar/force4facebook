public class FacebookMethod {
    private String  format;
    private String  methodName;

    public FacebookMethod( String methodName, String format )
    {
        this.methodName = methodName;
        this.format = format;
    }

    public String parseResponse( String response ) {
        return response;
    }

    public String getFormat()
    {
        return format;
    }

    public String getMethodName()
    {
        return methodName;
    }

    public String toStringx()
    {
        return methodName;
    }

    public static String Auth_GET_SESSION     			= 'facebook.auth.getSession';
    public static String Auth_CREATE_TOKEN    			= 'facebook.auth.createToken';
    public static String Auth_REVOKE_AUTHORIZATION 		= 'facebook.auth.revokeAuthorization';
    
    public static String Application_GET_PUBLIC_INFO 	= 'facebook.application.getPublicInfo';

    public static String  Users_GET_INFO            		= 'facebook.users.getInfo';
    public static String  Users_GET_LOGGED_IN_USER  		= 'facebook.users.getLoggedInUser';
    public static String  Users_IS_APP_ADDED        		= 'facebook.users.isAppAdded';
    public static String  Users_HAS_APP_PERMISSION  		= 'facebook.users.hasAppPermission';
    public static String  Users_SET_STATUS          		= 'facebook.users.setStatus';

    public static String Fql_QUERY   = 'facebook.fql.query';

    public static String Events_GET = 'facebook.events.get';
    public static String Events_GET_MEMBERS = 'facebook.events.getMembers';
    public static String Events_CREATE = 'facebook.events.create';
    public static String Events_EDIT = 'facebook.events.edit';
    public static String Events_CANCEL = 'facebook.events.cancel';
    
    public static String  Friends_GET             = 'facebook.friends.get';
    public static String  Friends_GET_APP_USERS   = 'facebook.friends.getAppUsers';
    public static String  Friends_GET_REQUESTS    = 'facebook.friends.getRequests';
    public static String  Friends_ARE_FRIENDS     = 'facebook.friends.areFriends';

    public static String Pages_GET_INFO     = 'facebook.pages.getInfo';
    public static String Pages_IS_APP_ADDED = 'facebook.pages.isAppAdded';
    public static String Pages_IS_ADMIN     = 'facebook.pages.isAdmin';
    public static String Pages_IS_FAN       = 'facebook.pages.isFan';

    public static String  Photos_GET             = 'facebook.photos.get';
    public static String  Photos_GET_ALBUMS      = 'facebook.photos.getAlbums';
    public static String  Photos_GET_TAGS        = 'facebook.photos.getTags';
    public static String  Photos_CREATE_ALBUM    = 'facebook.photos.createAlbum';
    public static String  Photos_ADD_TAG         = 'facebook.photos.addTag';
    public static String  Photos_UPLOAD          = 'facebook.photos.upload';

    public static String  Notifications_GET             = 'facebook.notifications.get';
    public static String  Notifications_SEND            = 'facebook.notifications.send';
    public static String  Notifications_SEND_EMAIL      = 'facebook.notifications.sendEmail';

    public static String  Groups_GET         = 'facebook.groups.get';
    public static String  Groups_GET_MEMBERS = 'facebook.groups.getMembers';

    public static String  Profile_SET_FBML    = 'facebook.profile.setFBML';
    public static String  Profile_GET_FBML    = 'facebook.profile.getFBML';

    public static String  Fbml_REFRESH_REF_URL = 'facebook.fbml.refreshRefUrl';
    public static String  Fbml_REFRESH_IMG_SRC = 'facebook.fbml.refreshImgSrc';
    public static String  Fbml_SET_REF_HANDLE  = 'facebook.fbml.setRefHandle';
    
    public static String Feed_REGISTER_TEMPLATE_BUNDLE = 'facebook.feed.registerTemplateBundle';
    public static String Feed_PUBLISH_USER_ACTION = 'facebook.feed.publishUserAction';

    public static String  Feed_PUBLISH_ACTION_OF_USER      = 'facebook.feed.publishActionOfUser';
    public static String  Feed_PUBLISH_STORY_TO_USER       = 'facebook.feed.publishStoryToUser';
    public static String  Feed_PUBLISH_TEMPLATIZED_ACTION  = 'facebook.feed.publishTemplatizedAction';

    public static String  Marketplace_CREATE_LISTING      = 'facebook.marketplace.createListing';
    public static String  Marketplace_GET_CATEGORIES      = 'facebook.marketplace.getCategories';
    public static String  Marketplace_GET_SUBCATEGORIES   = 'facebook.marketplace.getSubcategories';
    public static String  Marketplace_GET_LISTINGS        = 'facebook.marketplace.getListings';
    public static String  Marketplace_SEARCH              = 'facebook.marketplace.search';
    public static String  Marketplace_REMOVE_LISTING      = 'facebook.marketplace.removeListing';
    
    public static String Profile_SET_INFO = 'profile.setInfo';
    public static String Profile_SET_INFO_OPTIONS = 'profile.setInfoOptions';
    
    public static String UIF_ABOUT_ME = 'about_me';
    public static String UIF_PIC = 'pic';
    
    public static String Status_SET = 'facebook.status.set';
    
    public static String Error_BAD_METHOD = 'facebook.bad.method';
    
    static testMethod void doTest() {
    	FacebookMethod fm = new FacebookMethod(FacebookMethod.Status_SET, 'test');
    	fm.getFormat();
    	fm.getMethodName();
    	fm.toStringx();
    	fm.parseResponse('my response');
    }
}