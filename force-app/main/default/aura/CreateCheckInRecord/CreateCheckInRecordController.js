({
    doinit: function(component, event, helper){

        var lat ;
        var lng ;

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(success,error);
        
            function success(position){
                component.set("v.isDisabled", false);
                
                 lat = position.coords.latitude;
                 lng = position.coords.longitude;  
               
                component.set("v.lat",lat);
                component.set("v.lng",lng);
                component.set("v.show",false);
               
            }
            function error() {
              
                var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                    title : 'Error',
                    message:'Enable Your Location to Check In',
                    duration:'10000',
                    key: 'info_alt',
                    type: 'error',
                    mode: 'pester'
                });
                toastEvent.fire();
               
              }
        
        }


    } ,   
    CheckIn : function(component, event, helper) {
        
        helper.CheckInHelper(component, event);  
        
    }
})