public class fbComponentController {
        
    public nametag aNameTag { get { if (aNameTag == null) { aNameTag = new nametag(); } return aNameTag; } set; }
    //public nametag aUserTag { get { if (aNameTag == null) { aNameTag = new nametag(); } return aNameTag; } set; }
  
/* =>=>=>=>=>=> fb:name =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> nameTagMap = new Map<String, String>();

    public String  f_uid              {get; set { nameTagMap.put('uid', value); f_uid = value;} }
    public Boolean f_firstnameonly    {get; set { nameTagMap.put('firstnameonly', String.valueOf(value)); f_firstnameonly = value;} }
    public Boolean f_linked           {get; set { nameTagMap.put('linked', String.valueOf(value)); f_linked = value;} }
    public Boolean f_lastnameonly     {get; set { nameTagMap.put('lastnameonly', String.valueOf(value)); f_lastnameonly = value;} }
    public Boolean f_possessive       {get; set { nameTagMap.put('possessive', String.valueOf(value)); f_possessive = value;} }
    public Boolean f_reflexive        {get; set { nameTagMap.put('reflexive', String.valueOf(value)); f_reflexive = value;} }
    public Boolean f_shownetwork      {get; set { nameTagMap.put('shownetwork', String.valueOf(value)); f_shownetwork = value;} }
    public Boolean f_useyou           {get; set { nameTagMap.put('useyou', String.valueOf(value)); f_useyou = value;} }
    public String  f_ifcantsee        {get; set { nameTagMap.put('ifcantsee', value); f_ifcantsee = value;} }
    public Boolean f_capitalize       {get; set { nameTagMap.put('capitalize', String.valueOf(value)); f_capitalize = value;} }
    public String  f_subjectid        {get; set { nameTagMap.put('subjectid', value); f_subjectid = value;} }
    
    public String getFBNameTag() { return '<fb:name ' + mapToAttributeString(nameTagMap) + ' >'; }
    public String getFBNameTagEnd() { return '</fb:name>'; }
/* =>=>=>=>=>=> end fb:name =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:user =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> userTagMap = new Map<String, String>();
        
    public String  f_uid1              {get; set { userTagMap.put('uid', value); f_uid1 = value;} }

    public String getFBUserTag() { return '<fb:user ' + mapToAttributeString(userTagMap) + ' >'; }
    public String getFBUserTagEnd() { return '</fb:user>'; }
/* =>=>=>=>=>=> end fb:user =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:wallpost =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> wallPostTagMap = new Map<String, String>();
        
    public String  f_uid2              {get; set { wallPostTagMap.put('uid', value); f_uid2 = value;} }

    public String f_t {get; set { wallPostTagMap.put('t', value); f_t = value;} }
    
    public String getFBWallPostTag() { return '<fb:wallpost ' + mapToAttributeString(wallPostTagMap) + ' >'; }
    public String getFBWallPostTagEnd() { return '</fb:wallpost>'; }
/* =>=>=>=>=>=> end fb:wallpost =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:pronoun =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> pronounTagMap = new Map<String, String>();
        
    public String  f_uid3              {get; set { pronounTagMap.put('uid', value); f_uid3 = value;} }

    public Boolean f_useyou1 {get; set { pronounTagMap.put('useyou', String.valueOf(value)); f_useyou1 = value;} }
    public Boolean f_possessive1 {get; set { pronounTagMap.put('possessive', String.valueOf(value)); f_possessive1 = value;} }
    public Boolean f_reflexive1 {get; set { pronounTagMap.put('reflexive', String.valueOf(value)); f_reflexive1 = value;} }
    public Boolean f_objective {get; set { pronounTagMap.put('objective', String.valueOf(value)); f_objective = value;} }
    public Boolean f_usethey {get; set { pronounTagMap.put('usethey', String.valueOf(value)); f_usethey = value;} }
    public Boolean f_capitalize1 {get; set { pronounTagMap.put('capitalize', String.valueOf(value)); f_capitalize1 = value;} }
    
    public String getFBPronounTag() { return '<fb:pronoun ' + mapToAttributeString(pronounTagMap) + ' >'; }
    public String getFBPronounTagEnd() { return '</fb:pronoun>'; }
/* =>=>=>=>=>=> end fb:pronoun =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:profile-pic =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> profilePicTagMap = new Map<String, String>();
        
    public String  f_uid4              {get; set { profilePicTagMap.put('uid', value); f_uid4 = value;} }

    public String f_size {get; set { profilePicTagMap.put('size', value); f_size = value;} }
    public Boolean f_linked1 {get; set { profilePicTagMap.put('linked', String.valueOf(value)); f_linked1 = value;} }
    public Boolean f_facebookLogo {get; set { profilePicTagMap.put('facebook-logo', String.valueOf(value)); f_facebookLogo = value;} }
    public Boolean f_shownetwork1 {get; set { profilePicTagMap.put('shownetwork1', String.valueOf(value)); f_shownetwork = value;} }
    
    public Integer f_width1 {get; set { profilePicTagMap.put('width', String.valueOf(value) + 'px'); f_width1 = value;} }
    public Integer f_height1 {get; set { profilePicTagMap.put('height', String.valueOf(value) + 'px'); f_height1 = value;} }
    
    public String getFBProfilePicTag() { return '<fb:profile-pic ' + mapToAttributeString(profilePicTagMap) + ' >'; }
    public String getFBProfilePicTagEnd() { return '</fb:profile-pic>'; }
/* =>=>=>=>=>=> end fb:profile-pic =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
 
/* =>=>=>=>=>=> fb:grouplink =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> groupLinkTagMap = new Map<String, String>();
        
    public String  f_gid              {get; set { groupLinkTagMap.put('gid', value); f_gid = value;} }

    public String getFBGroupLinkTag() { return '<fb:grouplink ' + mapToAttributeString(groupLinkTagMap) + ' >'; }
    public String getFBGroupLinkTagEnd() { return '</fb:grouplink>'; }
/* =>=>=>=>=>=> end fb:grouplink =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:eventlink =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> eventLinkTagMap = new Map<String, String>();
        
    public String  f_eid              {get; set { eventLinkTagMap.put('eid', value); f_eid = value;} }

    public String getFBEventLinkTag() { return '<fb:eventlink ' + mapToAttributeString(eventLinkTagMap) + ' >'; }
    public String getFBEventLinkTagEnd() { return '</fb:eventlink>'; }
/* =>=>=>=>=>=> end fb:grouplink =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:userlink =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> userLinkTagMap = new Map<String, String>();
        
    public String  f_uid5              {get; set { userLinkTagMap.put('uid', value); f_uid5 = value;} }

    public String f_ifcantsee1 {get; set { userLinkTagMap.put('ifcantsee', value); f_ifcantsee1 = value;} }
    public Boolean f_shownetwork2 {get; set { userLinkTagMap.put('shownetwork', String.valueOf(value)); f_shownetwork2 = value;} }

    public String getFBUserLinkTag() { return '<fb:userlink ' + mapToAttributeString(userLinkTagMap) + ' >'; }
    public String getFBUserLinkTagEnd() { return '</fb:userlink>'; }
/* =>=>=>=>=>=> end fb:userlink =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:user-status =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> userStatusTagMap = new Map<String, String>();
        
    public String  f_uid6              {get; set { userStatusTagMap.put('uid', value); f_uid6 = value;} }

    public Boolean f_linked2 {get; set { userStatusTagMap.put('linked', String.valueOf(value)); f_linked2 = value;} }

    public String getFBUserStatusTag() { return '<fb:user-status ' + mapToAttributeString(userStatusTagMap) + ' >'; }
    public String getFBUserStatusTagEnd() { return '</fb:user-status>'; }
/* =>=>=>=>=>=> end fb:user-status =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:login-button =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> loginButtonTagMap = new Map<String, String>();
        
    public String  f_condition              {get; set { loginButtonTagMap.put('condition', value); f_condition = value;} }
    public String  f_size1              {get; set { loginButtonTagMap.put('size', value); f_size1 = value;} }
    public Boolean f_autologoutlink {get; set { loginButtonTagMap.put('autologoutlink', String.valueOf(value)); f_autologoutlink = value;} }

    public String getFBLoginButtonTag() { return '<fb:login-button ' + mapToAttributeString(loginButtonTagMap) + ' >'; }
    public String getFBLoginButtonTagEnd() { return '</fb:login-button>'; }
/* =>=>=>=>=>=> end fb:login-button =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:serverfbml =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> serverFBMLTagMap = new Map<String, String>();
        
    public String  f_condition1  {get; set { serverFBMLTagMap.put('condition', value); f_condition1 = value;} }
    public String  f_style  {get; set { serverFBMLTagMap.put('style', value); f_style = value;} }

    public String getFBServerFBMLTag() { return '<fb:serverfbml ' + mapToAttributeString(serverFBMLTagMap) + ' >'; }
    public String getFBServerFBMLTagEnd() { return '</fb:serverfbml>'; }
/* =>=>=>=>=>=> end fb:serverfbml =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:fbml =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> fbmlTagMap = new Map<String, String>();
        
    public Double  f_version  {get; set { fbmlTagMap.put('version', String.valueOf(value)); f_version = value;} }

    public String getFBFBMLTag() { return '<fb:fbml ' + mapToAttributeString(fbmlTagMap) + ' >'; }
    public String getFBFBMLTagEnd() { return '</fb:fbml>'; }
/* =>=>=>=>=>=> end fb:fbml =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:request-form =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> requestFormTagMap = new Map<String, String>();
        
    public String  f_type  {get; set { requestFormTagMap.put('type', value); f_type = value;} }
    public String  f_content  {get; set { requestFormTagMap.put('content', value); f_content = value;} }
    public Boolean  f_invite  {get; set { requestFormTagMap.put('invite', String.valueOf(value)); f_invite = value;} }
    public String  f_action  {get; set { requestFormTagMap.put('action', String.valueOf(value)); f_action = value;} }
    public String  f_method  {get; set { requestFormTagMap.put('method', String.valueOf(value)); f_method = value;} }

    public String getFBRequestFormTag() { return '<fb:request-form ' + mapToAttributeString(requestFormTagMap) + ' >'; }
    public String getFBRequestFormTagEnd() { return '</fb:request-form>'; }
/* =>=>=>=>=>=> end fb:request-form =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:req-choice =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> reqChoiceTagMap = new Map<String, String>();
        
    public String  f_url  {get; set { reqChoiceTagMap.put('url', value); f_url = value;} }
    public String  f_label  {get; set { reqChoiceTagMap.put('label', value); f_label = value;} }

    public String getFBReqChoiceTag() { return '<fb:req-choice ' + mapToAttributeString(reqChoiceTagMap) + ' >'; }
    public String getFBReqChoiceTagEnd() { return '</fb:req-choice>'; }
/* =>=>=>=>=>=> end fb:req-choice =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:mult-friend-selector =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> multiFriendSelectorTagMap = new Map<String, String>();
        
    public String  f_actiontext  {get; set { multiFriendSelectorTagMap.put('actiontext', value); f_actiontext = value;} }
    public Boolean  f_showborder  {get; set { multiFriendSelectorTagMap.put('showborder', String.valueOf(value)); f_showborder = value;} }
    public Integer  f_rows  {get; set { multiFriendSelectorTagMap.put('rows', String.valueOf(value)); f_rows = value;} }
    public Integer  f_max  {get; set { multiFriendSelectorTagMap.put('max', String.valueOf(value)); f_max = value;} }
    public String  f_exclude_ids  {get; set { multiFriendSelectorTagMap.put('exclude_ids', value); f_exclude_ids = value;} }
    public String  f_bypass  {get; set { multiFriendSelectorTagMap.put('bypass', value); f_bypass = value;} }

    public String getFBMultiFriendSelectorTag() { return '<fb:multi-friend-selector ' + mapToAttributeString(multiFriendSelectorTagMap) + ' >'; }
    public String getFBMultiFriendSelectorTagEnd() { return '</fb:multi-friend-selector>'; }
/* =>=>=>=>=>=> end fb:mult-friend-selector =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:photo =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> photoTagMap = new Map<String, String>();
        
    public String  f_pid  {get; set { photoTagMap.put('pid', value); f_pid = value;} }
    public String  f_uid7  {get; set { photoTagMap.put('uid', value); f_uid7 = value;} }
    public String  f_size2  {get; set { photoTagMap.put('size', value); f_size2 = value;} }
    public String  f_align  {get; set { photoTagMap.put('align', value); f_align = value;} }

    public String getFBPhotoTag() { return '<fb:photo ' + mapToAttributeString(photoTagMap) + ' >'; }
    public String getFBPhotoTagEnd() { return '</fb:photo>'; }
/* =>=>=>=>=>=> end fb:photo =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:unconnected-friends-count =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> unconnectedFriendsCountTagMap = new Map<String, String>();
        
    public String  f_condition2  {get; set { unconnectedFriendsCountTagMap.put('condition', value); f_condition2 = value;} }

    public String getFBUnconnectedFriendsCountTag() { return '<fb:unconnected-friends-count ' + mapToAttributeString(unconnectedFriendsCountTagMap) + ' >'; }
    public String getFBUnconnectedFriendsCountTagEnd() { return '</fb:unconnected-friends-count>'; }
/* =>=>=>=>=>=> end fb:unconnected-friends-count =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:board =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> boardTagMap = new Map<String, String>();
        
    public String  f_xid  {get; set { boardTagMap.put('xid', value); f_xid = value;} }
    public Boolean f_canpost {get; set { boardTagMap.put('canpost', String.valueOf(value)); f_canpost = value; } }
    public Boolean f_canmark {get; set { boardTagMap.put('canmark', String.valueOf(value)); f_canmark = value; } }
    public Boolean f_candelete {get; set { boardTagMap.put('candelete', String.valueOf(value)); f_candelete = value; } }
    public Boolean f_cancreatetopic {get; set { boardTagMap.put('cancreatetopic', String.valueOf(value)); f_cancreatetopic = value; } }
    public Integer f_numtopics {get; set { boardTagMap.put('numtopics', String.valueOf(value)); f_numtopics = value; } }
    public String f_callbackurl {get; set { boardTagMap.put('callbackurl', value); f_callbackurl = value; } }
    public String f_returnurl {get; set { boardTagMap.put('returnurl', value); f_returnurl = value; } }

    public String getFBBoardTag() { return '<fb:board ' + mapToAttributeString(boardTagMap) + ' >'; }
    public String getFBBoardTagEnd() { return '</fb:board>'; }
/* =>=>=>=>=>=> end fb:board =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:title =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    public String getFBTitleTag() { return '<fb:title>'; }
    public String getFBTitleTagEnd() { return '</fb:title>'; }
/* =>=>=>=>=>=> end fb:title =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:wall =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    public String getFBWallTag() { return '<fb:wall>'; }
    public String getFBWallTagEnd() { return '</fb:wall>'; }
/* =>=>=>=>=>=> end fb:wall =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:prompt-permission =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> promptPermissionTagMap = new Map<String, String>();
        
    public String  f_perms  {get; set { promptPermissionTagMap.put('perms', value); f_perms = value;} }
    public String f_next_fbjs  {get; set { promptPermissionTagMap.put('next_fbjs ', value); f_next_fbjs = value; } }

    public String getFBPromptPermissionTag() { return '<fb:prompt-permission ' + mapToAttributeString(promptPermissionTagMap) + ' >'; }
    public String getFBPromptPermissionTagEnd() { return '</fb:prompt-permission>'; }
/* =>=>=>=>=>=> end fb:prompt-permission =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:add-section-button =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> addSectionButtonTagMap = new Map<String, String>();
        
    public String  f_section  {get; set { addSectionButtonTagMap.put('section', value); f_section = value;} }

    public String getFBAddSectionButtonTag() { return '<fb:add-section-button ' + mapToAttributeString(addSectionButtonTagMap) + ' >'; }
    public String getFBAddSectionButtonTagEnd() { return '</fb:add-section-button>'; }
/* =>=>=>=>=>=> end fb:add-section-button =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:tabs =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> tabsTagMap = new Map<String, String>();
        
    public String getFBTabsTag() { return '<fb:tabs> />'; }
    public String getFBTabsTagEnd() { return '</fb:tabs>'; }
/* =>=>=>=>=>=> end fb:tabs =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:tab-item =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> tabItemTagMap = new Map<String, String>();

    public String  f_href  {get; set { tabItemTagMap.put('href', value); f_href = value;} }
    public String  f_title  {get; set { tabItemTagMap.put('title', value); f_title = value;} }
    public String  f_align1  {get; set { tabItemTagMap.put('align', value); f_align1 = value;} }
    public Boolean f_selected  {get; set { tabItemTagMap.put('selected', String.valueOf(value)); f_selected = value;} }
        
    public String getFBTabItemTag() { return '<fb:tab-item ' + mapToAttributeString(tabItemTagMap) + ' >'; }
    public String getFBTabItemTagEnd() { return '</fb:tab-item>'; }
/* =>=>=>=>=>=> end fb:tab-item =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:editor-text =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> editorTextTagMap = new Map<String, String>();

    public String  f_label1  {get; set { editorTextTagMap.put('label', value); f_label1 = value;} }
    public String  f_name  {get; set { editorTextTagMap.put('name', value); f_name = value;} }
    public String  f_value  {get; set { editorTextTagMap.put('value', value); f_value = value;} }
    public Integer f_maxlength  {get; set { editorTextTagMap.put('maxlength', String.valueOf(value)); f_maxlength = value;} }
        
    public String getFBEditorTextTag() { return '<fb:editor-text ' + mapToAttributeString(editorTextTagMap) + ' >'; }
    public String getFBEditorTextTagEnd() { return '</fb:editor-text>'; }
/* =>=>=>=>=>=> end fb:editor-text =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:friend-selector =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> friendSelectorTagMap = new Map<String, String>();

    public String  f_uid8  {get; set { friendSelectorTagMap.put('uid', value); f_uid8 = value;} }
    public String  f_name2  {get; set { friendSelectorTagMap.put('name', value); f_name2 = value;} }
    public String  f_idname  {get; set { friendSelectorTagMap.put('value', value); f_value = value;} }
    public Boolean f_include_me  {get; set { friendSelectorTagMap.put('include_me', String.valueOf(value)); f_include_me = value;} }
    public String f_exclude_ids1  {get; set { friendSelectorTagMap.put('exclude_ids', String.valueOf(value)); f_exclude_ids1 = value;} }
    public Boolean f_include_lists  {get; set { friendSelectorTagMap.put('include_lists', String.valueOf(value)); f_include_lists = value;} }
        
    public String getFBFriendSelectorTag() { return '<fb:friend-selector ' + mapToAttributeString(friendSelectorTagMap) + ' >'; }
    public String getFBFriendSelectorTagEnd() { return '</fb:friend-selector>'; }
/* =>=>=>=>=>=> end fb:friend-selector =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:typeahead-input =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> typeaheadInputTagMap = new Map<String, String>();

    public String  f_name3  {get; set { typeaheadInputTagMap.put('name', value); f_name3 = value;} }
    public String  f_style1  {get; set { typeaheadInputTagMap.put('style', value); f_style1 = value;} }
    public String  f_title1  {get; set { typeaheadInputTagMap.put('title', value); f_title1 = value;} }
       
    public String getFBTypeaheadInputTag() { return '<fb:typeahead-input ' + mapToAttributeString(typeaheadInputTagMap) + ' >'; }
    public String getFBTypeaheadInputTagEnd() { return '</fb:typeahead-input>'; }
/* =>=>=>=>=>=> end fb:typeahead-input =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:typeahead-option =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> typeaheadOptionTagMap = new Map<String, String>();

    public String  f_value1  {get; set { typeaheadOptionTagMap.put('value', value); f_value1 = value;} }
        
    public String getFBTypeaheadOptionTag() { return '<fb:typeahead-option ' + mapToAttributeString(typeaheadOptionTagMap) + ' >'; }
    public String getFBTypeaheadOptionTagEnd() { return '</fb:typeahead-option>'; }
/* =>=>=>=>=>=> end fb:typeahead-option =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:js-string =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> jsStringTagMap = new Map<String, String>();

    public String  f_var  {get; set { jsStringTagMap.put('var', value); f_var = value;} }
        
    public String getFBJSStringTag() { return '<fb:js-string ' + mapToAttributeString(jsStringTagMap) + ' >'; }
    public String getFBJSStringTagEnd() { return '</fb:js-string>'; }
/* =>=>=>=>=>=> end fb:js-string =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:iframe =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> iFrameTagMap = new Map<String, String>();

    public String  f_src  {get; set { iFrameTagMap.put('src', value); f_src = value;} }
    public Boolean  f_smartsize  {get; set { iFrameTagMap.put('smartsize', String.valueOf(value)); f_smartsize = value;} }
    public Integer  f_frameborder  {get; set { iFrameTagMap.put('frameborder', String.valueOf(value)); f_frameborder = value;} }
    public String  f_scrolling  {get; set { iFrameTagMap.put('scrolling', value); f_scrolling = value;} }
    public String  f_style2  {get; set { iFrameTagMap.put('style', value); f_style2 = value;} }
    public Integer  f_width  {get; set { iFrameTagMap.put('width', String.valueOf(value)); f_width = value;} }
    public Integer  f_height  {get; set { iFrameTagMap.put('height', String.valueOf(value)); f_height = value;} }
    public Boolean  f_resizable  {get; set { iFrameTagMap.put('resizable', String.valueOf(value)); f_resizable = value;} }
    public String  f_name1  {get; set { iFrameTagMap.put('name', value); f_name1 = value;} }
        
    public String getFBIFrameTag() { return '<fb:iframe ' + mapToAttributeString(iFrameTagMap) + ' >'; }
    public String getFBIFrameTagEnd() { return '</fb:iframe>'; }
/* =>=>=>=>=>=> end fb:iframe =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */

/* =>=>=>=>=>=> fb:redirect =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */
    private Map<String, String> redirectTagMap = new Map<String, String>();

    public String  f_url1  {get; set { redirectTagMap.put('url', value); f_url1 = value;} }
        
    public String getFBRedirectTag() { return '<fb:redirect ' + mapToAttributeString(redirectTagMap) + ' >'; }
    public String getFBRedirectTagEnd() { return '</fb:redirect>'; }
/* =>=>=>=>=>=> end fb:redirect =>=>=>=>=>=>=>=>=>=>=>=>=>=>=> */




    private String mapToAttributeString(Map<String, String> themap) {
        String result = '';
        for (String key : themap.keySet()) {
            if (themap.get(key) != null) result += ' ' + key + '="' + themap.get(key) + '"';
        }
        return result;
    }
    
    
    
    public class nametag {
        
        public Map<String, String> tagMap {get; set;}
        
        public String  f_uid              {get; set { tagMap.put('uid', value); f_uid = value;} }
        public Boolean f_firstnameonly    {get; set { tagMap.put('firstnameonly', String.valueOf(value)); f_firstnameonly = value;} }
        public Boolean f_linked           {get; set { tagMap.put('linked', String.valueOf(value)); f_linked = value;} }
        public Boolean f_lastnameonly     {get; set { tagMap.put('lastnameonly', String.valueOf(value)); f_lastnameonly = value;} }
        public Boolean f_possessive       {get; set { tagMap.put('possessive', String.valueOf(value)); f_possessive = value;} }
        public Boolean f_reflexive        {get; set { tagMap.put('reflexive', String.valueOf(value)); f_reflexive = value;} }
        public Boolean f_shownetwork      {get; set { tagMap.put('shownetwork', String.valueOf(value)); f_shownetwork = value;} }
        public Boolean f_useyou           {get; set { tagMap.put('useyou', String.valueOf(value)); f_useyou = value;} }
        public String  f_ifcantsee        {get; set { tagMap.put('ifcantsee', value); f_ifcantsee = value;} }
        public Boolean f_capitalize       {get; set { tagMap.put('capitalize', String.valueOf(value)); f_capitalize = value;} }
        public String  f_subjectid        {get; set { tagMap.put('subjectid', value); f_subjectid = value;} }
        
        public nametag() {
            tagMap = new Map<String, String>();
        }
        
        public String mapToAttributeString() {
            String result = '';
            for (String key : tagmap.keySet()) {
                if (tagmap.get(key) != null) result += ' ' + key + '="' + tagmap.get(key) + '"';
            }
            return result;
        }
            
    }
}