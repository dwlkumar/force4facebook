public class startHereController {

    public PageReference initPageAction() {
        if (this.theXMlDom == null) {
            PageReference homePage= new PageReference('/home/home.jsp');
            homePage.setRedirect(true);  
            return homePage;
        } else {
            return null;
        }
    }

    // Class variables
    XmlStreamReader reader;
    xmldom theXMLDom;        

    // Constructor
    public startHereController () {
        init(); 
    }
    
    public void init() {
        String lang = UserInfo.getLanguage();
        lang = lang.subString(0, 2);
        
        //Get the XML document from the external server 
        Http http       = new Http(); 
        HttpRequest req = new HttpRequest(); 

        try {        
            req.setEndpoint('http://www.apexdevnet.com/ootbe/starthere/catalog_'+lang+'.xml'); 
            req.setMethod('GET'); 
            
            HttpResponse res = http.send(req); 
            
            if (res.getStatusCode() == 404) {
                // Default to English if language doesn't exist
                req.setEndpoint('http://www.apexdevnet.com/ootbe/starthere/catalog_en.xml'); 
                req.setMethod('GET'); 
            
                res = http.send(req); 
            }
            this.theXMLDom = new xmldom(res.getBody());
            //This will generate an exception if we are not able to access the document. Though assumes that htmlheader will always be specified.
            String testDomAccess = this.theXMLDom.getElementsByTagName('htmlheader')[0].nodeValue;
        } catch (Exception e) {
            this.theXMLDom = null;
        }
    } 
    
    public String getHTMLHeader() {
        if (this.theXMLDom != null && this.theXMLDom.getElementsByTagName('htmlheader') != null) {
        try{
            String htmlHeader = this.theXMLDom.getElementsByTagName('htmlheader')[0].nodeValue;
            return htmlHeader;
            }catch(Exception e) {
               return '';
            }
        } else {
            return '';
        }
    }

    public String getBannerURL() {
        if (this.theXMLDom != null && this.theXMLDom.getElementsByTagName('bannerURL') != null) {
            try{
                String bannerURL = this.theXMLDom.getElementsByTagName('bannerURL')[0].nodeValue;
                return bannerURL;
                }catch(Exception e) {
               return '';
            }
        } else {
            return '';
        }
    }

    public String getBannerImageURL() {
        if (this.theXMLDom != null && this.theXMLDom.getElementsByTagName('bannerImageURL') != null) {
        try{
            String bannerImageURL = this.theXMLDom.getElementsByTagName('bannerImageURL')[0].nodeValue;
            return bannerImageURL;
            }catch(Exception e) {
               return '';
            }
        } else {
            return '';
        }
    }
    
    public String getMainBody() {
        if (this.theXMLDom != null && this.theXMLDom.getElementsByTagName('main') != null) {
        try{
            String mainBody = this.theXMLDom.getElementsByTagName('main')[0].nodeValue;
            return mainBody;
            }catch(Exception e) {
               return '';
            }
        } else {
            return '';
        }
    }
        
    public String getSideBar() {
        if (this.theXMLDom != null && this.theXMLDom.getElementsByTagName('sidebar') != null) {
        try{
            String sideBar = this.theXMLDom.getElementsByTagName('sidebar')[0].nodeValue;
            return sideBar;
            }catch(Exception e) {
               return '';
            }
        } else {
            return '';
        }        
    }
    
    public String getFooter() {
        if (this.theXMLDom != null && this.theXMLDom.getElementsByTagName('footer') != null) {
            try{
                String footer = this.theXMLDom.getElementsByTagName('footer')[0].nodeValue;
                return footer;
            }catch(Exception e) {
               return '';
            }
        } else {
            return '';
        }
    }
    
    public String getTracker() {
        if (this.theXMLDom != null && this.theXMLDom.getElementsByTagName('tracker') != null) {
        try{
            String tracker = this.theXMLDom.getElementsByTagName('tracker')[0].nodeValue;
            return tracker;
            }catch(Exception e) {
               return '';
            }
        } else {
            return '';
        }
    }    
}