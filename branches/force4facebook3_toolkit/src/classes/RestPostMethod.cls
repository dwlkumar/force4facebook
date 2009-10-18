public virtual class RestPostMethod {
    public transient HttpRequest request;
    private String body = '';
    
    //public RestPostMethod( String url, String userAgent )
    //{
    //    request = new HttpRequest();
    //    request.setEndpoint( url );
    //    request.setHeader( 'User-Agent', userAgent );
    //}
  
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
    }
    
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

	public virtual HTTPResponse doExecute(HTTP httpClient) {
		return httpClient.send(request);
	}
	public virtual String getResponseBody(HTTPResponse response) {
		return response.getBody();
	}
	public virtual String getResponseStatus(HTTPResponse response) {
		return response.getStatus();
	}
	public virtual Integer getResponseCode(HTTPResponse response) {
		return response.getStatusCode();
	}
	public virtual String getResponseHeader(HTTPResponse response, String header) {
		return response.getHeader(header);
	}
	public virtual List<String> getResponseHeaderKeys(HTTPResponse response) {
		return response.getHeaderKeys();
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
            HTTPResponse resp = doExecute(httpClient);
            String buffer = getResponseBody(resp);
            System.debug(LoggingLevel.INFO, '\n\nRESPONSE:\n\n' + buffer + '\n\n\n');
            
            return ( buffer );
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, '\n\n\n<!!!!!!!!!!!!!!!! REST POST EXECUTE ERRROR !!!!!!!!!!!!!!!>\nError: ' + e.getMessage());
            return null;
        } finally {
        }
    }

	static testMethod void dotests() {
		RestPostMethod rpm = new RestPostMethod();
		rpm.setMultipart(new Map<String, String>());
		rpm.getResponseBody(new HTTPResponse());
		rpm.getResponseStatus(new HTTPResponse());
		rpm.getResponseCode(new HTTPResponse());
		rpm.getResponseHeader(new HTTPResponse(), 'oops');
		rpm.getResponseHeaderKeys(new HTTPResponse());
		rpm.execute(null);
		try {
			rpm.doExecute(null);
		} catch(Exception ex) {}
	}
}