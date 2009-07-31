public interface IFacebookController {

	AbsAuthenticator getAuthenticator();
	void setAuthenticator(AbsAuthenticator auth);
}