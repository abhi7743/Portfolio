({
	doInit: function(component, event, helper) {
        component.find("articleURL").set("v.value",window.location.pathname);
		
	}
})