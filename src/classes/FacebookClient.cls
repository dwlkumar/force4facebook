public virtual class FacebookClient extends RestPostMethod {
    public String USER_AGENT  = 'fb4j 0.1';

    public HTTP      		   httpClient;
    public String              apiKey;
    public String              secretKey;
    public String              sessionKey { get; set; }
    public String              authToken { get; set; }
    
    public static final String INFO_TEXT_ONLY = '1';
    public static final String INFO_THUMBNAIL = '5';
    
    public FacebookClient() {}
    
    public FacebookClient( String apiKey, String secretKey )
    {
        this.httpClient = new HTTP();
        this.apiKey = apiKey;
        this.secretKey = secretKey;
    }
    
    public FacebookClient( String apiKey, String secretKey, String sessionKey )
    {
        this(apiKey, secretKey); 
        this.sessionKey = sessionKey;
    }
     
    public String openLoginPage() 
    {
        String token = createToken();
        String loginUrl = getLoginUrl( token );
        authToken = token;
        return loginUrl;
    }

    public String getSession() {
        List<String> params = new List<String>();
        params.add('auth_token');
        params.add(authToken);
        String response = callSecureMethod(new FacebookMethod('facebook.auth.getSession', 'XML'), params);
        System.debug(LoggingLevel.INFO, response);
        XMLDom r = new XMLDom(response);
        XMLDom.Element k = r.getElementsByTagName('session_key')[0];
        return k.nodeValue;
    }
    
    public String createToken() {
        List<String> params = new List<String>();
        //Get the token
        String responses = callSecureMethod(new FacebookMethod('facebook.auth.createToken', 'XML'), params);
        //System.debug(responses);
        XMLDom r = new XMLDom(responses);
        r.dumpAll();
        return r.root.getValue('auth_createToken_response');
    }
            
    public String getLoginUrl( String authToken )
    {
        return getLoginUrl( authToken, null, false, false, false );
    }

    public String getLoginUrl( String authToken, String next, boolean popup, boolean forceLogin, boolean hideSaveLoginCheckbox )
    {
        UrlBuilder url = new UrlBuilder(Server.LOGIN_URL, true);
        LoginParameters lp = new LoginParameters();
        url.append( lp.API_KEY, apiKey );
        url.append( lp.API_VERSION, Server.API_VERSION );
        url.append( lp.NEXT_URL, next );
        url.append( lp.AUTH_TOKEN, authToken );
        url.append( lp.POPUP, popup ? '1' : null );
        url.append( lp.SKIP_COOKIE, forceLogin ? '1' : null );
        url.append( lp.HIDE_CHECKBOX, hideSaveLoginCheckbox ? '1' : null );

        return url.toMyString();
    }

    
    public virtual String callMethod( FacebookMethod method, Map<String, String> params ) 
    {
        try 
        {
            ///RestPostMethod post = new RestPostMethod(Server.REST_URL, USER_AGENT);// FacebookClient.Server.REST_URL, USER_AGENT );
			request = new HttpRequest();
    		request.setEndpoint( Server.REST_URL );
    		request.setHeader( 'User-Agent', USER_AGENT );
            
            Map<String, String> preparedParams = prepareParams( method, params );

            signParameters( preparedParams );

            System.debug(LoggingLevel.INFO, '\n\n<=========== Adding params to httpRequest ===============>');

            addParameters( preparedParams );

            System.debug(LoggingLevel.INFO, '\n\n<=========== Ready to call the web service ===============>\n');
            String response = execute( httpClient );
            System.debug(LoggingLevel.INFO, '\n\n<=========== Returned from the web service ===============>\n');
			System.debug(LoggingLevel.INFO, '\n\nResponse: \n' + response + '\n\n');
            return method.parseResponse( response );
        }
        catch ( Exception e ) 
        {
            //throw new FacebookIOException( e );
            return null;
        }
    }

    public String callMethod( FaceBookMethod method) {
        return callMethod(method, new Map<String, String>());
    }
    
    public String callMethod( FacebookMethod method, List<Object> params ) 
    {
        Map<String, String> paramsMap = toMap( params );

        return callMethod( method, paramsMap );
    }
    
    public String callMethod( FacebookMethod method, String name, List<String> params ) 
    {
        Map<String, String> paramsMap = toMap( params );

        return callMethod( method, paramsMap );
    }

    public virtual String callSecureMethod( FacebookMethod method, Map<String, String> params ) 
    {
        try
        {
            //RestPostMethod post = new RestPostMethod( Server.REST_URL, USER_AGENT );
			request = new HttpRequest();
    		request.setEndpoint( Server.REST_URL );
    		request.setHeader( 'User-Agent', USER_AGENT );

            Map<String, String> preparedParams = prepareParams( method, params );

            signParameters( preparedParams );

            addParameters( preparedParams );

            String response = execute( httpClient );
            System.debug(LoggingLevel.INFO, '\n\nResponse:\n' + response);
            return response;
        }
        catch ( Exception e )
        {
            //throw new FacebookIOException( e );
            System.debug('\n\n\n<!!!!!!!!!!!!!!!! CALL SECURE METHOD ERRROR !!!!!!!!!!!!!!!>\nError: ' + e.getMessage());
            return null;
        }
    }

    public String callSecureMethod( FacebookMethod method, List<String> params ) 
    {
        Map<String, String> paramsMap = toMap( params );
        String response = callSecureMethod(method, paramsMap);
        return response;
        
    }
    
    static Map<String, String> toMap( List<Object> params )
    {
        if ( Math.mod(params.size(), 2 ) != 0 )
        {
            //throw new IllegalArgumentException( "Odd number of parameters not allowed!" );
        }
        Map<String, String> mmap = new Map<String, String>();

        for ( Integer i = 0; i < params.size(); )
        {
            String key = (String) params[i++];
            Object value = params[i++];
            String keyStr = (String) key;
            String valueStr;

            if ( value instanceof String )
            {
                valueStr = (String) value;
            }
            else if ( value == null )
            {
                valueStr = '';
            }
            /*else if ( value instanceof List<Object> )
            {
                valueStr = '';
                for (Integer j=0;j<value.size();j++) {
                    Object v = ((List<Object>)value)[j];
                    if (v instanceof Long) {
                        valueStr += String.valueOf((Long)v);
                    } else if (v instanceof String) {
                        valueStr += (String)v;
                    }
                }
            }*/
            else
            {
                valueStr = (String)value;
            }

            mmap.put( keyStr, valueStr );
        }
        return mmap;
    }

    private Map<String, String> prepareParams( FacebookMethod method, Map<String, String> params )
    {
        Map<String, String> p = new Map<String, String>();

        if ( params != null )
        {
            p.putAll( params );
        }

        p.put(RestParameters.API_KEY, apiKey );
        p.put(RestParameters.API_VERSION, Server.API_VERSION );
        p.put(RestParameters.METHOD, method.getMethodName() );
        p.put(RestParameters.FORMAT, method.getFormat() );

        if ( sessionKey != null )
        {
            p.put(RestParameters.SESSION_KEY, sessionKey );
        }
        p.put(RestParameters.CALL_ID, String.valueOf( System.currentTimeMillis() ) );

        return p;
    }

    private void signParameters( Map<String, String> params )
    {
        String sig = generateSignature( params, secretKey );
        params.put( 'sig', sig );
    }
    
    public static String generateSignature( Map<String, String> params, String secretKey )
    {
        // Prepare parameters
        String sb = '';
        List<String> keys = new List<String>( params.keySet() );
        keys.sort();
        String debugMsg = '\n\nHere is what I am signing:\n';
        for ( String key : keys )
        {
            String value = params.get( key );
            sb += key;
            sb += '=';
            sb += value;
            debugMsg += key + '=' + value + '\n';

        }
        sb += secretKey;
        debugMsg += secretKey + '\n';
        System.debug(LoggingLevel.INFO, debugMsg);
        System.debug('\n\nThis is the string value that generates the sig: \n' + sb + '\n\n');
        
        Blob mac = Crypto.generateDigest('MD5',  Blob.valueOf(sb));    
         
        String ek = EncodingUtil.convertToHex(mac);
        return ek;

    }
    
    public class LoginParameters
    {
        public String   API_KEY         { get { return 'api_key';} }
        public String   API_VERSION     { get { return 'v';} }
        public String   NEXT_URL        { get { return 'next';} }
        public String   AUTH_TOKEN      { get { return 'auth_token';} }
        public String   POPUP           { get { return 'popup';} }
        public String   SKIP_COOKIE     { get { return 'skipcookie';} }
        public String   HIDE_CHECKBOX   { get { return 'hide_checkbox';} }
        public String   CANVAS          { get { return 'canvas';} }
    }

}