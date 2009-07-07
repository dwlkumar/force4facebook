public with sharing class SourceController {

	public String getSource { 
		get {
			return Apexpages.currentPage().getContent().toString();
		}
	}
}