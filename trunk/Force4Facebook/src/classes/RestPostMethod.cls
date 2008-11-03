public class RestPostMethod {
    private HttpRequest request;
    private String body = '';
    
    public RestPostMethod( String url, String userAgent )
    {
        request = new HttpRequest();
        request.setEndpoint( url );
        request.setHeader( 'User-Agent', userAgent );
        //setFollowRedirects( false );
    }
  
    // utility to join up a list of strings
    public string joinstr(list<string> s,string sep) { 
        string ret = '';
        for (string a:s) { ret += a + sep; }
        if ( sep != '') {
            ret = ret.substring(0, ret.length()-1);
        }
        return ret; 
    }   
    public List<String> mapToList(Map<String, String> m) {
        List<String> r = new List<String>();
        for (String key : m.keySet()) {
            r.add(key + '=' + m.get(key));
        }
        return r;
    }
    
    public void addParameters( Map<String, String> params )
    {
        System.debug('\n\n<============  Adding parameters to Post =============>');
        body = joinstr(mapToList(params), '&');
        /*String cSymbol = '?';
        for ( String name : params.keySet() )
        {
            String value = params.get( name );
            System.debug('\tparam name: ' + name + ' - ' + value);
            addParameter(cSymbol, name, value );
            cSymbol = '&';
        }*/
        //System.debug('\n\tREST Url: ' + request.getEndpoint());
    }
    
    private void addParameter(String concatSymbol, String name, String value) {
        request.setEndpoint(request.getEndpoint() + concatSymbol + name + '=' + value);
    }  

/*    public void addParameters( List<String> params ) 
    {
        if ( Math.mod(params.size(), 2) != 0 )
        {  
            //throw new IllegalArgumentException( 'Invalid number of parameters; each name must have a corresponding value!' );
        }
        for ( Integer i = 0; i < params.size(); )
        {
            String name = params[i++];
            String value = params[i++];
            if (i == 0) {
                addParameter('?', name, value);
            } else {
                addParameter('&', name, value );
            }
        }
    }*/

    public void setMultipart( Map<String, String> params) //, FilePart[] files )
    {
        /*Part[] parts = new Part[ params.size() + files.length ];
        int i = 0;
        for ( String name : params.keySet() )
        {
            String value = params.get( name );
            parts[i++] = new StringPart( name, value );
        }
        for ( FilePart file : files )
        {
            parts[i++] = file;
        }

        setRequestEntity( new MultipartRequestEntity( parts, getParams() ) );*/
    }

    public String execute( HTTP httpClient ) 
    {
        try
        {
            System.debug(LoggingLevel.INFO, '\n\nSending request to: ' + request.getEndpoint() + '\n');
            System.debug(LoggingLevel.INFO, '\n\nBODY\n' + body + '\n\n');
            request.setMethod('POST');
            request.setHeader('Content-Type', 'application/x-www-form-urlencoded' );
            integer len = body.length();
            request.setHeader('Content-Length',string.valueof(len));
            request.setBody(body);
            HTTPResponse resp = httpClient.send(request);
            String buffer = resp.getBody();
            //System.debug(LoggingLevel.INFO, '\n\nRESPONSE:\n\n' + buffer);
            
            return ( buffer );
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, '\n\n\n<!!!!!!!!!!!!!!!! REST POST EXECUTE ERRROR !!!!!!!!!!!!!!!>\nError: ' + e.getMessage());
            return null;
        } finally {
        }
    }

}