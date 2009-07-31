public class FacebookUserInfo implements IFacebookQueryResult {
    
    private Map<String, String> data = new Map<String, String>();
    
    public String aboutMe { get { return data.get('about_me'); } set; }
    public String pic { get { return data.get('pic'); } set; }
    public String uid { get { return data.get('uid'); } set; }
    public String activities { get { return data.get('activities'); } set; }

    public String birthday { get { return data.get('birthday'); } set; }
    public String books { get { return data.get('books'); } set; }
    public String first_name { get { return data.get('first_name'); } set; }
    public String is_app_user { get { return data.get('is_app_user'); } set; }
    public String has_added_app { get { return data.get('has_added_app'); } set; }
    public String interests { get { return data.get('interests'); } set; }
    public String last_name { get { return data.get('last_name'); } set; }
    public String locale { get { return data.get('locale'); } set; }
    public String movies { get { return data.get('movies'); } set; }
    public String music { get { return data.get('music'); } set; }
    public String name { get { return data.get('name'); } set; }
    public String notes_count { get { return data.get('notes_count'); } set; }
    public String pic_big { get { return data.get('pic_big'); } set; }
    public String pic_small { get { return data.get('pic_small'); } set; }
    public String pic_square { get { return data.get('pic_square'); } set; }
    public String political { get { return data.get('political'); } set; }
    public String profile_update_time { get { return data.get('profile_update_time'); } set; }
    public String quotes { get { return data.get('quotes'); } set; }
    public String relationship_status { get { return data.get('relationship_status'); } set; }
    public String religion { get { return data.get('religion'); } set; }
    public String sex { get { return data.get('sex'); } set; }
    public String significant_other_id { get { return data.get('significant_other_id'); } set; }
    public String timezone { get { return data.get('timezone'); } set; }
    public String tv { get { return data.get('tv'); } set; }
    public String wall_count { get { return data.get('wall_count'); } set; }

    public List<Affiliation> affiliations { get; set; }
    public UserLocation current_location { get; set; }
    public List<EducationInfo> education_history { get; set;}
    public UserLocation hometown_location { get; set; }
    public HighSchoolInfo hs_info { get; set; }
    public List<MeetingFor> meeting_for { get; set; }
    public List<MeetingSex> meeting_sex { get; set; }
    public UserStatus status { get; set; }
    public List<WorkInfo> work_history { get; set; }
    
    public FacebookUserInfo(XMLDom.Element xmlInfo) {
        parseSource(xmlInfo);
    }
    
    public String getResultType() {
        return 'user';
    }

    private Datetime getDateTime(String fieldName) {
        if (data.get(fieldName) != null) {
            return FacebookUtils.epochToDatetime(Long.valueOf(data.get(fieldName)));
        } else {
            return null;
        }
    }
     
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
        public String company_name { get { return data.get('company_name'); } set; }
        public String position { get { return data.get('position'); } set; }
        public String description { get { return data.get('description'); } set; }
        public String start_date { get { return data.get('start_date'); } set; }
        public String end_date { get { return data.get('end_date'); } set; }
        
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
        
        public String message { get { return data.get('message'); } set; }
        public String f_time { get { return data.get('time'); } set; }
        
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
        
        public String hs1_name { get { return data.get('hs1_name'); } set; }
        public String hs2_name { get { return data.get('hs2_name'); } set; }
        public String grad_year { get { return data.get('grad_year'); } set; }
        public String hs1_id { get { return data.get('hs1_id'); } set; }
        public String hs2_id { get { return data.get('hs2_id'); } set; }
        
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
        
        public String name { get { return data.get('name'); } set; }
        public String year { get { return data.get('year'); } set; }
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
        
        public String city { get { return data.get('city'); } set; }
        public String state { get { return data.get('state'); } set; }
        public String country { get { return data.get('country'); } set; }
        public String zip { get { return data.get('zip'); } set; }
        
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

        public String nid { get { return data.get('nid'); } set; }
        public String name { get { return data.get('name'); } set; }
        public String a_type { get { return data.get('type'); } set; }
        public String status { get { return data.get('status'); } set; }
        public String year { get { return data.get('year'); } set; }

        public Affiliation(XMLDom.Element xmlInfo) {
            parseSource(xmlInfo);
        }
        public void parseSource(XMLDom.Element xmlInfo) {
            for (XMLDom.Element c: xmlInfo.childNodes) {
                data.put(c.nodeName, c.nodeValue);
            }
        }
    }       
}