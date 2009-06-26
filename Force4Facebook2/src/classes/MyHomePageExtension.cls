public with sharing class MyHomePageExtension extends AbsFacebookController {
	
	public Integer userCount { get; set; }
	
	public MyHomePageExtension(Apexpages.StandardSetController controller) {
		userCount = controller.getResultSize();
	}
}