public class FacebookSessionTester extends FacebookSession {
		
	public FacebookSessionTester(FBCAuthenticator fba) {
		this(fba.APIKey, fba.secret, fba.sessionKey);
	}
    public FacebookSessionTester(String apiKey, String secretKey, String sessionKey) {
    	super(apiKey, secretKey, sessionKey);
    }
	public FacebookSessionTester() {
		super();
	}
    public FacebookSessionTester( String apiKey, String secretKey )
    {
    	super(apiKey, secretKey); 
    }
	
	public override String callMethod(FacebookMethod method, Map<String, String> params) {
		return super.callMethod(method, params);
	}
	
	public override HTTPResponse doExecute(HTTP httpClient) {
		return new HTTPResponse();
	} 
	
	public override String getResponseBody(HTTPResponse response) {
		System.debug('\n\nLOOKING FOR METHOD USING ' + parseCurrentMethodFromRequest() + '\n\n');
		String method = parseCurrentMethodFromRequest();
		String responseBody;
		if (method.equals(FacebookMethod.FQL_QUERY)) {
			System.debug('\n\nGETTING QUERY RESPONSE\n');
			List<String> bodyParts = request.getBody().split('&');
			System.debug('\n\nbodyParts\n' + bodyParts + '\n\n');
			for (String bodyPart : bodyParts) {
				System.debug('\n\nBody Part\n' + bodyPart + '\n\n');
				if (bodyPart.startsWith('query')) {
					String query = bodyPart.split('=')[1];
					System.debug('\n\nquery is: ' + query + '\n\n');
					String fqlTable = query.toLowerCase().split(' from ')[1].trim().split(' ')[0].trim();
					System.debug('\n\nTable is: ' + fqlTable + '\n\n');
					responseBody = FacebookXMLResponses.queryResponses.get(fqlTable);
					break;
				} 
			}
		} else {
			responseBody = FacebookXMLResponses.responses.get(parseCurrentMethodFromRequest()); 
		}
		return responseBody; 
/*			String currentMethod = parseCurrentMethodFromRequest();
			String responseBody; 
			if (currentMethod.equals(FacebookMethod.Events_GET)) {
				responseBody = FacebookXMLResponses.EVENT_RESPONSE;
			}
			return responseBody;*/
	}
	private String parseCurrentMethodFromRequest() {
		String reqBody = request.getBody();
		System.debug('\n\nPARSE CURRENT METHOD FROM REQUEST: BODY\n' + reqBody);
		String method;
		List<String> params = reqBody.split('&');
		for (String param : params) {
			if (param.startsWith('method=')) {
				method = param.split('=')[1];
			}
		}
		return method;
	}
	
}