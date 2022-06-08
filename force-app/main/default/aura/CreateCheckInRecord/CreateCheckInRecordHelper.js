({
    CheckInHelper : function(component, event) {  
        var field = event.getParam('fields');
        var checkName = field.Person_Name__c;
        var purpose = field.Purpose_Discussion_of_Visit__c;
        var person_Designations = field.Designation_of_Person__c;
           
        if(checkName === null || purpose === null || person_Designations ===null){
            console.log('INSIDE IF'+ checkName);
           
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
            title : 'Error',
            message:'Kindly Filled All the Informations...!',
            duration:' 5000',
            key: 'info_alt',
            type: 'error',
            mode: 'pester'
        });
        toastEvent.fire();
        event.preventDefault();   

        }else{
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(success,error);
                function success() {
                component.set("v.spinner", true);
                var lat = component.get("v.lat");
                var lng = component.get("v.lng");
                var fields = event.getParam('fields');
                var Comment = fields.Comment__c;
                var pageRecordID = component.get("v.recordId");
                
                //pointer to Apex method in GeolocationController
                var action = component.get("c.insertCheckInRecord");
                //set parameters for Apex method updateGeolocation
                action.setParams({
                    "pageRecordID" : pageRecordID,
                    "lat" : lat,
                    "lng" : lng,
                    "Name": checkName,
                    "Comment":Comment,
                    "Purpose":purpose,
                    "Designation": person_Designations
                });
                //set callback method
                action.setCallback(this, function(response) {
                    var state = response.getState(); //fetch the response state
                    if (state === "SUCCESS") {
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            title : 'Success',
                            message: 'Check In Done Successfully',
                            duration:' 5000',
                            key: 'info_alt',
                            type: 'success',
                            mode: 'pester'
                        });
                        toastEvent.fire();
                        component.set("v.spinner", false); 
                        $A.get("e.force:closeQuickAction").fire();    
                    }
                    else {
                    var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                        title : 'Error',
                        message:'Check In Not Saved',
                        duration:' 5000',
                        key: 'info_alt',
                        type: 'error',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                    }
                });
                //invoke the Apex method
                $A.enqueueAction(action);          
                }
             function error(err){
                if(err.message === 'User denied Geolocation'){
                var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                    title : 'Error',
                    message:'Enable Your Location to Check In',
                    duration:' 5000',
                    key: 'info_alt',
                    type: 'error',
                    mode: 'pester'
                });
                toastEvent.fire();
                }
                else {
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                    title : 'Error',
                    message:'Geolocation is not supported',
                    duration:' 5000',
                    key: 'info_alt',
                    type: 'error',
                    mode: 'pester'
                    });
                    toastEvent.fire();
                    }
                }
                event.preventDefault();
            }     
        } 
}
})