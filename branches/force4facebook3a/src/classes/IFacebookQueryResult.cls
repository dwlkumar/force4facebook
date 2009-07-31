public interface IFacebookQueryResult {

    String getResultType();
    void parseSource(XMLDom.Element source);
    
}