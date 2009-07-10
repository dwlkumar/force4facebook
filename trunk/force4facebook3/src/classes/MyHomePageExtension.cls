public with sharing class MyHomePageExtension extends AbsSocialController {
	
	public Integer userCount { get; set; }
	
	public MyHomePageExtension(Apexpages.StandardSetController controller) {
		userCount = controller.getResultSize();
	}
}