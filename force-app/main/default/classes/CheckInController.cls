/****************************************************************************************************
* Create By : Harshad Chauhan
* Create Date : 17/05/2022
* Description : This class is a use as controller for Capture Geolocation of Users.
* Modification Log:
*  -------------------------------------------------------------------------------------------------
*  * Developer                         Date                   Description
*  *------------------------------------------------------------------------------------------------
*  *   -                                -                         -
*****************************************************************************************************/
public with sharing class CheckInController {
/****************************************************************************************************
* Create By : Harshad Chauhan
* Create Date : 17/05/2022
* Method Name : InsertCheckInRecord
* Description : This Method is a use for Insert Geolocation Record.
* Modification Log:
*  -------------------------------------------------------------------------------------------------
*  * Developer                         Date                   Description
*  *------------------------------------------------------------------------------------------------
*  *   -                                -                         -
*****************************************************************************************************/
    @AuraEnabled
    public static void insertCheckInRecord(Id pageRecordID, Decimal lat, Decimal lng, String Name, String Comment, String Purpose, String Designation){
        String sObjName = pageRecordID.getSObjectType().getDescribe().getName();
        //GeoLocation__c CheckInRecord ;
        System.debug('The following exception has occurred: ' + Name + lat +lng+ Purpose+Designation);
            try{
            GeoLocation__c   CheckInRecord = new GeoLocation__c();    
            CheckInRecord.Person_Name__c = Name;
            CheckInRecord.Check_In_Location__Latitude__s = lat;
            CheckInRecord.Check_In_Location__Longitude__s = lng;
            CheckInRecord.Comment__c= Comment;
            CheckInRecord.Purpose_Discussion_of_Visit__c = Purpose;
            CheckInRecord.Designation_of_Person__c = Designation;
            
            if(sObjName == 'Lead'){
            CheckInRecord.Lead__c = pageRecordID;
            }
            else if(sObjName == 'Consultant__c'){
                CheckInRecord.Consultant__c = pageRecordID;              
            }
            else if(sObjName == 'Channel_Partner__c'){
                CheckInRecord.Channel_Partner__c = pageRecordID;             
            }
            else{
                CheckInRecord.Opportunity__c = pageRecordID;             
            }        
            insert CheckInRecord;
            }catch(Exception e) {
                System.debug('The following exception has occurred: ' + e.getMessage());
            }
        }
}