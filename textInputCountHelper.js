({
    
    handleClick : function(component, event, helper) 
    {
        var action = component.get("c.countValuesFromString");
        var inputValue = component.find("inputValue").get("v.value");
        component.set("v.showInputValue", inputValue);
        action.setParams({
            inputValue : inputValue
        });

        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {

                var response = response.getReturnValue();
                var stringifyResult = JSON.stringify(response);
                component.set("v.result", stringifyResult);
                var resTab = [];
                for(var key in response){
                    resTab.push({value:response[key], key:key});
                }
                component.set("v.mapToIterate", resTab);
                component.set("v.showBool", true);

            } else {
                component.set("v.errorMessage", 'Something went wrong. Please try again.');
                component.set("v.showError", true);
            }
        });
        $A.enqueueAction(action);
    }

})
