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

    public class Auth
    {
        public String  CREATE_TOKEN    = 'facebook.auth.createToken';
        public String  GET_SESSION     = 'facebook.auth.getSession';
    }
    public static String Application_GET_PUBLIC_INFO = 'facebook.application.getPublicInfo';

    public static String  Users_GET_INFO            = 'facebook.users.getInfo';
    public static String  Users_GET_LOGGED_IN_USER  = 'facebook.users.getLoggedInUser';
    public static String  Users_IS_APP_ADDED        = 'facebook.users.isAppAdded';
    public static String  Users_HAS_APP_PERMISSION  = 'facebook.users.hasAppPermission';
    public static String  Users_SET_STATUS          = 'facebook.users.setStatus';

    public static String Fql_QUERY   = 'facebook.fql.query';

    public static String Events_GET = 'facebook.events.get';
    public static String Events_GET_MEMBERS = 'facebook.events.getMembers';
    public static String Events_CREATE = 'facebook.events.create';
    

    public static String  Friends_GET             = 'facebook.friends.get';
    public static String  Friends_GET_APP_USERS   = 'facebook.friends.getAppUsers';
    public static String  Friends_GET_REQUESTS    = 'facebook.friends.getRequests';
    public static String  Friends_ARE_FRIENDS     = 'facebook.friends.areFriends';

    public class Photos
    {
        public String  GET             = 'facebook.photos.get';
        public String  GET_ALBUMS      = 'facebook.photos.getAlbums';
        public String  GET_TAGS        = 'facebook.photos.getTags';
        public String  CREATE_ALBUM    = 'facebook.photos.createAlbum';
        public String  ADD_TAG         = 'facebook.photos.addTag';
        public String  UPLOAD          = 'facebook.photos.upload';
    }

    public static String  Notifications_GET             = 'facebook.notifications.get';
    public static String  Notifications_SEND            = 'facebook.notifications.send';
    public static String  Notifications_SEND_EMAIL      = 'facebook.notifications.sendEmail';

    public class Groups
    {
        public String  GET         = 'facebook.groups.get';
        public String  GET_MEMBERS = 'facebook.groups.getMembers';
    }

    public static String  Profile_SET_FBML    = 'facebook.profile.setFBML';
    public static String  Profile_GET_FBML    = 'facebook.profile.getFBML';

    public class Fbml
    {
        public String  REFRESH_REF_URL = 'facebook.fbml.refreshRefUrl';
        public String  REFRESH_IMG_SRC = 'facebook.fbml.refreshImgSrc';
        public String  SET_REF_HANDLE  = 'facebook.fbml.setRefHandle';
    }
    
    public static String Feed_REGISTER_TEMPLATE_BUNDLE = 'facebook.feed.registerTemplateBundle';
    public static String Feed_PUBLISH_USER_ACTION = 'facebook.feed.publishUserAction';

    public class Feed
    {
        public String  PUBLISH_ACTION_OF_USER      = 'facebook.feed.publishActionOfUser';
        public String  PUBLISH_STORY_TO_USER       = 'facebook.feed.publishStoryToUser';
        public String  PUBLISH_TEMPLATIZED_ACTION  = 'facebook.feed.publishTemplatizedAction';
    }

    public class Marketplace
    {
        public String  CREATE_LISTING      = 'facebook.marketplace.createListing';
        public String  GET_CATEGORIES      = 'facebook.marketplace.getCategories';
        public String  GET_SUBCATEGORIES   = 'facebook.marketplace.getSubcategories';
        public String  GET_LISTINGS        = 'facebook.marketplace.getListings';
        public String  SEARCH              = 'facebook.marketplace.search';
        public String  REMOVE_LISTING      = 'facebook.marketplace.removeListing';
    }
    
    public class Pages
    {
        public String GET_INFO     = 'facebook.pages.getInfo';
        public String IS_APP_ADDED = 'facebook.pages.isAppAdded';
        public String IS_ADMIN     = 'facebook.pages.isAdmin';
        public String IS_FAN       = 'facebook.pages.isFan';
    }
    
    public static String Profile_SET_INFO = 'profile.setInfo';
    public static String Profile_SET_INFO_OPTIONS = 'profile.setInfoOptions';
    
    public static String UIF_ABOUT_ME = 'about_me';
    public static String UIF_PIC = 'pic';
    
    
}