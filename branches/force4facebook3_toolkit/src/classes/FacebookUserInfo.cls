public class FacebookUserInfo implements IFacebookQueryResult {
    
    private Map<String, String> data = new Map<String, String>();
    
    public String aboutMe { get { return data.get('about_me'); } set {data.put('about_me', value); } }
    public String pic { get { return data.get('pic'); } set { data.put('pic', value); } }
    public String uid { get { return data.get('uid'); } set { data.put('uid', value); } }
    public String activities { get { return data.get('activities'); } set { data.put('activities', value); } }

    public String birthday { get { return data.get('birthday'); } set { data.put('birthday', value); } }
    public String books { get { return data.get('books'); } set { data.put('books', value); } }
    public String first_name { get { return data.get('first_name'); } set { data.put('first_name', value); } }
    public String is_app_user { get { return data.get('is_app_user'); } set { data.put('is_app_user', value); } }
    public String has_added_app { get { return data.get('has_added_app'); } set { data.put('has_added_app', value); } }
    public String interests { get { return data.get('interests'); } set { data.put('interests', value); } }
    public String last_name { get { return data.get('last_name'); } set { data.put('last_name', value); } }
    public String locale { get { return data.get('locale'); } set { data.put('locale', value); } }
    public String movies { get { return data.get('movies'); } set { data.put('movies', value); } }
    public String music { get { return data.get('music'); } set { data.put('music', value); } }
    public String name { get { return data.get('name'); } set { data.put('name', value); } }
    public String notes_count { get { return data.get('notes_count'); } set { data.put('notes_count', value); } }
    public String pic_big { get { return data.get('pic_big'); } set { data.put('pic_big', value); } }
    public String pic_small { get { return data.get('pic_small'); } set { data.put('pic_small', value); } }
    public String pic_square { get { return data.get('pic_square'); } set { data.put('pic_square', value); } }
    public String political { get { return data.get('political'); } set { data.put('political', value); } }
    public String profile_update_time { get { return data.get('profile_update_time'); } set { data.put('profile_update_time', value); } }
    public String quotes { get { return data.get('quotes'); } set { data.put('quotes', value); } }
    public String relationship_status { get { return data.get('relationship_status'); } set { data.put('relationship_status', value); } }
    public String religion { get { return data.get('religion'); } set { data.put('religion', value); } }
    public String sex { get { return data.get('sex'); } set { data.put('sex', value); } }
    public String significant_other_id { get { return data.get('significant_other_id'); } set { data.put('significant_other_id', value); } }
    public String timezone { get { return data.get('timezone'); } set { data.put('timezone', value); } }
    public String tv { get { return data.get('tv'); } set { data.put('tv', value); } }
    public String wall_count { get { return data.get('wall_count'); } set { data.put('wall_count', value); } }

    public List<Affiliation> affiliations { get; set; }
    public UserLocation current_location { get; set; }
    public List<EducationInfo> education_history { get; set;}
    public UserLocation hometown_location { get; set; }
    public HighSchoolInfo hs_info { get; set; }
    public List<MeetingFor> meeting_for { get; set; }
    public List<MeetingSex> meeting_sex { get; set; }
    public UserStatus status { get; set; }
    public List<WorkInfo> work_history { get; set; }
     
    public FacebookUserInfo() { }
    
    public FacebookUserInfo(XMLDom.Element xmlInfo) {
        parseSource(xmlInfo);
    }
    
    public String getResultType() {
        return 'user';
    }

/*    private Datetime getDateTime(String fieldName) {
        if (data.get(fieldName) != null) {
            return FacebookUtils.epochToDatetime(Long.valueOf(data.get(fieldName)));
        } else {
            return null;
        }
    }*/
     
    public void parseSource(XMLDom.Element source) {
        for (XMLDom.Element c: source.childNodes) { 
            String nodeName = c.nodeName.toUpperCase();
            if (nodeName == 'AFFILIATIONS') {
                affiliations = new List<Affiliation>();
                List<XMLDom.Element> affs = c.getElementsByTagName('affiliation');
                for (XMLDom.Element a : affs) {
                    affiliations.add(new Affiliation(a));
                }
            } else if (nodeName == 'CURRENT_LOCATION') {
                current_location = new UserLocation(c);
            } else if (nodeName == 'EDUCATION_HISTORY') {
                education_history = new List<EducationInfo>();
                List<XMLDom.Element> histys = c.getElementsByTagName('education_info');
                for (XMLDom.Element hist : histys) {
                    education_history.add(new EducationInfo(hist));
                }
            } else if (nodeName == 'HOMETOWN_LOCATION') {
                hometown_location = new UserLocation(c);
            } else if (nodeName == 'HS_INFO') {
                hs_info = new HighSchoolInfo(c);
            } else if (nodeName == 'MEETING_FOR') {
                meeting_for = new List<MeetingFor>();
                List<XMLDom.Element> mfs = c.getElementsByTagName('meeting_for');
                for (XMLDom.Element mf : mfs) {
                    meeting_for.add(new MeetingFor(mf.nodeValue));
                }
            } else if (nodeName == 'MEETING_SEX') {
                meeting_sex = new List<MeetingSex>();
                List<XMLDom.Element> mfs = c.getElementsByTagName('meeting_sex');
                for (XMLDom.Element mf : mfs) {
                    meeting_sex.add(new MeetingSex(mf.nodeValue));
                }
            } else if (nodeName == 'STATUS') {
                status = new UserStatus(c);
            } else if (nodeName == 'WORK_HISTORY') {
                work_history = new List<WorkInfo>();
                List<XMLDom.Element> whs = c.getElementsByTagName('work_info');
                for (XMLDom.Element wh : whs) {
                    work_history.add(new WorkInfo(wh));
                }
            } else {
                data.put(c.nodeName, c.nodeValue);
            }
        }
    }       

    public class WorkInfo {
        private Map<String, String> data = new Map<String, String>();
        
        public UserLocation location { get; set; }
        public String company_name { get { return data.get('company_name'); } set { data.put('company_name', value); } }
        public String position { get { return data.get('position'); } set { data.put('position', value); } }
        public String description { get { return data.get('description'); } set { data.put('description', value); } }
        public String start_date { get { return data.get('start_date'); } set { data.put('start_date', value); } }
        public String end_date { get { return data.get('end_date'); } set { data.put('end_date', value); } }
        
        public WorkInfo(XMLDom.Element xmlInfo) {
            parseSource(xmlInfo);
        }
        public void parseSource(XMLDom.Element xmlInfo) {
            for (XMLDom.Element c: xmlInfo.childNodes) {
                if (c.nodeName == 'location') {
                    location = new UserLocation(c);
                } else {
                    data.put(c.nodeName, c.nodeValue);
                }
            }
        }
    }
            
    public class UserStatus {
        private Map<String, String> data = new Map<String, String>();
        
        public String message { get { return data.get('message'); } set { data.put('message', value); } }
        public String f_time { get { return data.get('time'); } set { data.put('time', value); } }
        
        public UserStatus(XMLDom.Element xmlInfo) {
            parseSource(xmlInfo);
        }
        public void parseSource(XMLDom.Element xmlInfo) {
            for (XMLDom.Element c: xmlInfo.childNodes) {
                data.put(c.nodeName, c.nodeValue);
            }
        }
    }
        
    public class MeetingSex {
        public MeetingSex(String sexval) { sex = sexval; }
        public String sex { get;  set; }
    }

    public class MeetingFor {
        public MeetingFor(String seekingval) { seeking = seekingval; }
        public String seeking { get;  set; }
    }
    
    public class HighSchoolInfo {

        private Map<String, String> data = new Map<String, String>();
        
        public String hs1_name { get { return data.get('hs1_name'); } set { data.put('hs1_name', value); } }
        public String hs2_name { get { return data.get('hs2_name'); } set { data.put('hs2_name', value); } }
        public String grad_year { get { return data.get('grad_year'); } set { data.put('grad_year', value); } }
        public String hs1_id { get { return data.get('hs1_id'); } set { data.put('hs1_id', value); } }
        public String hs2_id { get { return data.get('hs2_id'); } set { data.put('hs2_id', value); } }
        
        public HighSchoolInfo(XMLDom.Element xmlInfo) {
            parseSource(xmlInfo);
        }
        public void parseSource(XMLDom.Element xmlInfo) {
            for (XMLDom.Element c: xmlInfo.childNodes) {
                data.put(c.nodeName, c.nodeValue);
            }
        }
    }

    public class EducationInfo {
        private Map<String, String> data = new Map<String, String>();
        
        public String name { get { return data.get('name'); } set { data.put('name', value); } }
        public String year { get { return data.get('year'); } set { data.put('year', value); } }
        public List<String> concentrations { get; set; }
        
        public EducationInfo(XMLDom.Element xmlInfo) {
            parseSource(xmlInfo);
        }
        public void parseSource(XMLDom.Element xmlInfo) {
            for (XMLDom.Element c: xmlInfo.childNodes) {
                if (c.nodeName == 'concentrations') {
                    concentrations = new List<String>();
                    List<XMLDom.Element> concs = c.getElementsByTagName('concentration');
                    for (XMLDom.Element conc : concs) {
                        concentrations.add(conc.nodeValue);
                    }
                } else {
                    data.put(c.nodeName, c.nodeValue);
                }
            }
        }
    }

    public class UserLocation {
        private Map<String, String> data = new Map<String, String>();
        
        public String city { get { return data.get('city'); } set { data.put('city', value); } }
        public String state { get { return data.get('state'); } set { data.put('state', value); } }
        public String country { get { return data.get('country'); } set { data.put('country', value); } }
        public String zip { get { return data.get('zip'); } set { data.put('zip', value); } }
        
        public UserLocation(XMLDom.Element xmlInfo) {
            parseSource(xmlInfo);
        }
        public void parseSource(XMLDom.Element xmlInfo) {
            for (XMLDom.Element c: xmlInfo.childNodes) {
                data.put(c.nodeName, c.nodeValue);
            }
        }
    }
    public class Affiliation {
        
        private Map<String, String> data = new Map<String, String>();

        public String nid { get { return data.get('nid'); } set { data.put('nid', value); } }
        public String name { get { return data.get('name'); } set { data.put('name', value); } }
        public String a_type { get { return data.get('type'); } set { data.put('type', value); } }
        public String status { get { return data.get('status'); } set { data.put('status', value); } }
        public String year { get { return data.get('year'); } set { data.put('year', value); } }

        public Affiliation(XMLDom.Element xmlInfo) {
            parseSource(xmlInfo);
        }
        public void parseSource(XMLDom.Element xmlInfo) {
        	System.debug('\n\nparse affiliation: \n child nodes: ' + xmlInfo.childNodes.size());
            for (XMLDom.Element c: xmlInfo.childNodes) {
                data.put(c.nodeName, c.nodeValue);
            }
        }
    }
    
    static testMethod void doTest() {
    	FacebookUserInfo fui = new FacebookUserInfo();

	    fui.aboutMe = 'about_me';
	    fui.pic = 'pic'; 
	    fui.uid = 'uid';
	    fui.activities = 'activities';
	    fui.birthday = 'birthday';
	    fui.books = 'books';
	    fui.first_name = 'first_name';
	    fui.is_app_user = 'is_app_user';
	    fui.has_added_app = 'has_added_app';
	    fui.interests = 'interests';
	    fui.last_name = 'last_name';
	    fui.locale = 'locale';
	    fui.movies = 'movies';
	    fui.music = 'music';
	    fui.name = 'name';
	    fui.notes_count = 'notes_count';
	    fui.pic_big = 'pic_big';
	    fui.pic_small = 'pic_small';
	    fui.pic_square = 'pic_square';
	    fui.political = 'political';
	    fui.profile_update_time = 'profile_update_time';
	    fui.quotes = 'quotes';
	    fui.relationship_status = 'relationship_status';
	    fui.religion = 'religion';
	    fui.sex = 'sex';
	    fui.significant_other_id = 'significant_other_id';
	    fui.timezone = 'timezone';
	    fui.tv = 'tv';
	    fui.wall_count = 'wall_count';
    	
	    System.assertEquals(fui.aboutMe, 'about_me');
	    System.assertEquals(fui.pic, 'pic'); 
	    System.assertEquals(fui.uid, 'uid');
	    System.assertEquals(fui.activities, 'activities');
	    System.assertEquals(fui.birthday, 'birthday');
	    System.assertEquals(fui.books, 'books');
	    System.assertEquals(fui.first_name, 'first_name');
	    System.assertEquals(fui.is_app_user, 'is_app_user');
	    System.assertEquals(fui.has_added_app, 'has_added_app');
	    System.assertEquals(fui.interests, 'interests');
	    System.assertEquals(fui.last_name, 'last_name');
	    System.assertEquals(fui.locale, 'locale');
	    System.assertEquals(fui.movies, 'movies');
	    System.assertEquals(fui.music, 'music');
	    System.assertEquals(fui.name, 'name');
	    System.assertEquals(fui.notes_count, 'notes_count');
	    System.assertEquals(fui.pic_big, 'pic_big');
	    System.assertEquals(fui.pic_small, 'pic_small');
	    System.assertEquals(fui.pic_square, 'pic_square');
	    System.assertEquals(fui.political, 'political');
	    System.assertEquals(fui.profile_update_time, 'profile_update_time');
	    System.assertEquals(fui.quotes, 'quotes');
	    System.assertEquals(fui.relationship_status, 'relationship_status');
	    System.assertEquals(fui.religion, 'religion');
	    System.assertEquals(fui.sex, 'sex');
	    System.assertEquals(fui.significant_other_id, 'significant_other_id');
	    System.assertEquals(fui.timezone, 'timezone');
	    System.assertEquals(fui.tv, 'tv');
	    System.assertEquals(fui.wall_count, 'wall_count');
 
		fui.affiliations = new List<Affiliation>();
		System.assertEquals(fui.affiliations.size(), 0);
		XMLDom afDom = new XMLDom('<affiliation>' +
			        '<nid>67108896</nid>' +
			        '<name>Silicon Valley, CA</name>' +
			        '<type>region</type>' +
			        '<status>status</status>' +
			        '<year>0</year>' +
			      '</affiliation>');
		fui.affiliations.add(new Affiliation(afDom.root.firstChild()));
		System.debug('\n\nAffiliation: \n\t' + fui.affiliations.get(0) + '\n\nXMLDom: \n\t' + afDom.root);
		fui.affiliations.get(0).nid = '67108896';
		fui.affiliations.get(0).a_type = 'region';
		fui.affiliations.get(0).name = 'Silicon Valley, CA';
		fui.affiliations.get(0).status = 'status';
		fui.affiliations.get(0).year = '0';

		System.assertEquals(fui.affiliations.get(0).nid, '67108896');
		System.assertEquals(fui.affiliations.get(0).a_type, 'region');
		System.assertEquals(fui.affiliations.get(0).name, 'Silicon Valley, CA');
		System.assertEquals(fui.affiliations.get(0).status, 'status');
		System.assertEquals(fui.affiliations.get(0).year, '0');
		
		XMLDom ulDom = new XMLDom('<current_location><city>city</city><state>state</state><country>country</country><zip>zip</zip></current_location>');
	    fui.current_location = new UserLocation(ulDom.root.firstChild());
		fui.current_location.city = 'city';
		fui.current_location.state = 'state';
		fui.current_location.country = 'country';
		fui.current_location.zip = 'zip';

		System.assertEquals(fui.current_location.city, 'city');
		System.assertEquals(fui.current_location.state, 'state');
		System.assertEquals(fui.current_location.country, 'country');
		System.assertEquals(fui.current_location.zip, 'zip');
		
	    
	    XMLDom edDom = new XMLDom('<education_info><name>name</name><year>90</year><concentrations>one</concentrations><concentrations>two</concentractions></education_info>');
	    fui.education_history = new List<EducationInfo>();
	    System.assertEquals(fui.education_history.size(), 0);
	    fui.education_history.add(new EducationInfo(edDom.root.firstChild()));
	    fui.education_history.get(0).name = 'name';
	    fui.education_history.get(0).year = '90';

	    System.assertEquals(fui.education_history.get(0).name, 'name');
	    System.assertEquals(fui.education_history.get(0).year, '90');
	    System.assertEquals(fui.education_history.get(0).concentrations.size(), 0);
	    
	    fui.hometown_location = new UserLocation(ulDom.root);
	    System.assertNotEquals(fui.hometown_location	, null);
	    
	    XMLDom hsDom = new XMLDom('<high_school_info>' +
	    							'<hs1_name>hs1_name</hs1_name>' +
	    							'<hs2_name>hs2_name</hs2_name>' +
	    							'<grad_year>90</grad_year>' +
	    							'<hs1_id>hs1_id</hs1_id>' +
	    							'<hs2_id>hs2_id</hs2_id>' +
	    						'</high_school_info>');
	    fui.hs_info = new HighSchoolInfo(hsDom.root.firstChild());
	    fui.hs_info.hs1_name = 'hs1_name';
	    fui.hs_info.hs2_name = 'hs2_name';
	    fui.hs_info.grad_year = '90';
	    fui.hs_info.hs1_id = 'hs1_id';
	    fui.hs_info.hs2_id = 'hs2_id';

	    System.assertEquals(fui.hs_info.hs1_name, 'hs1_name');
	    System.assertEquals(fui.hs_info.hs2_name, 'hs2_name');
	    System.assertEquals(fui.hs_info.grad_year, '90');
	    System.assertEquals(fui.hs_info.hs1_id, 'hs1_id');
	    System.assertEquals(fui.hs_info.hs2_id, 'hs2_id');
	    
	    fui.meeting_for = new List<MeetingFor>();
	    System.assertEquals(fui.meeting_for.size(), 0);
	    fui.meeting_for.add(new MeetingFor('seeking'));
	    fui.meeting_for.get(0).seeking = 'seeking';
	    
	    System.assertEquals(fui.meeting_for.get(0).seeking, 'seeking');
	    
	    fui.meeting_sex = new List<MeetingSex>();
	    System.assertEquals(fui.meeting_sex.size(), 0);
	    fui.meeting_sex.add(new MeetingSex('sex'));
	    fui.meeting_sex.get(0).sex = 'sex';
	    
	    System.assertEquals(fui.meeting_sex.get(0).sex, 'sex');
	    
	    XMLDom usDom = new XMLDom('<user_status><message>message</message><time>f_time</time></user_status>');
	    fui.status = new UserStatus(usDom.root.firstChild());
	    fui.status.message = 'message';
	    fui.status.f_time = 'f_time';

	    System.assertEquals(fui.status.message, 'message');
	    System.assertEquals(fui.status.f_time, 'f_time');
	    
	    XMLDom wiDom = new XMLDom('<work_info><company_name>company_name</company_name><position>position</position><description>description</description><start_date>2000</start_date><end_date>2001</end_date></work_info>');
	    fui.work_history = new List<WorkInfo>();
	    System.assertEquals(fui.work_history.size(), 0);
	    fui.work_history.add(new WorkInfo(wiDom.root.firstChild()));
	    fui.work_history.get(0).company_name = 'company_name';
	    fui.work_history.get(0).position = 'position';
	    fui.work_history.get(0).description = 'description';
	    fui.work_history.get(0).start_date = '2000';
	    fui.work_history.get(0).end_date = '2001';

	    System.assertEquals(fui.work_history.get(0).company_name, 'company_name');
	    System.assertEquals(fui.work_history.get(0).position, 'position');
	    System.assertEquals(fui.work_history.get(0).description, 'description');
	    System.assertEquals(fui.work_history.get(0).start_date, '2000');
	    System.assertEquals(fui.work_history.get(0).end_date, '2001');
	    
	    fui.work_history.get(0).location = new UserLocation(ulDom.root.firstChild());
	    System.assertEquals(fui.work_history.get(0).location.city, 'city');
    	
    	System.assertEquals(fui.getResultType(), 'user');
    	
    }
}