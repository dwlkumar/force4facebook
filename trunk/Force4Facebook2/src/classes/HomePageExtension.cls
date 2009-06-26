public with sharing class HomePageExtension extends AbsFacebookController {
	
	public Integer userCount { get; set; }
	
	public HomePageExtension(Apexpages.StandardSetController controller) {
		userCount = controller.getResultSize();
	}
}