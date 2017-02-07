$(document).ready(function() {
		bindEvents();
		clearText();
//	alert("!!!");
	});
	
	function bindEvents(){
		$('.btnTest').bind({
			click:submitInternetSetting
		})
		
		$('.btnClear').bind({
			click:clearText
		})
	}
	
	function clearText(){
		
	}
	
	function submitInternetSetting(){
		alert("!!!");
		
	}
	
	
//
//jQuery(document).ready(function($) {
//
//	alert("!!!");
//
//});