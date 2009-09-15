public class UrlBuilder
{
    private String          sb = '';
    private boolean         isFirst = true;
    private boolean         ignoreIfNull;

    public UrlBuilder( String url, boolean ignoreIfNull )
    {
        this.sb = url;
        this.ignoreIfNull = ignoreIfNull;
    }

    public UrlBuilder append( String key, String value )
    {
        if ( value == null && ignoreIfNull )
        {
            return this;
        }

        if ( isFirst )
        {
            sb += '?';
            isFirst = false;
        }
        else
        {
            sb += '&';
        }

        sb += EncodingUtil.urlEncode( key, 'UTF-8' );
        sb += '=';
        sb += EncodingUtil.urlEncode( value, 'UTF-8' );

        return this;
    }

    public String toMyString()
    {
        return sb;
    }

    /*public void appendAll(Map<String, String> parameterMap)
    {
        Set<Map.Entry<String,String[]>> entries = parameterMap.entrySet();
        for ( Map.Entry<String,String[]> entry : entries ) 
        {
            appendAll( entry.getKey(), entry.getValue() );
        }
    }*/

     public void appendAll(String key, List<String> values) 
     {
        for ( String value : values ) 
        {
            append( key, value );
        }
    }
    
    static testMethod void doTest() {
    	UrlBuilder ub = new UrlBuilder('some', true);
    	ub.append('test', 'one');
    	ub.toMyString();
    	List<String> more = new List<String>();
    	more.add('two');
    	more.add('three');
    	ub.appendAll('multi', more);
    	ub.append('four', null);
    }
}