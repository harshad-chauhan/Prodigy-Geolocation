/****************************************************************************************************
* Create By : Harshad Chauhan
* Create Date : 27/05/2022
* Description : This Test class use to get coverage of CheckinController Class.
* Modification Log:
*  -------------------------------------------------------------------------------------------------
*  * Developer                         Date                   Description
*  *------------------------------------------------------------------------------------------------
*  *   -                                -                         -
*****************************************************************************************************/
@isTest
public class CheckInController_Test{
    @isTest static void insertCheckInRecord() {
        
        Lead newleaddata = new Lead();
        newleaddata.Title = 'Recriuter';
        newleaddata.FirstName = 'murli';
        newleaddata.LastName = 'lastname';
        newleaddata.Email = 'abc@gmail.com';
        newleaddata.Company = 'Tata';
        newleaddata.Phone = '9852367411';
        newleaddata.State__c = 'Gujarat';
        newleaddata.City__c = 'Ahmedabad';
        newleaddata.LeadSource = 'FaceBook';
        newleaddata.Status = 'Unqualified';
        
        insert newleaddata;     
        CheckInController.insertCheckInRecord(newleaddata.Id,38.8951,77.0364,'xyz','You logged a call','Collection','Admin');    
    }
    @isTest static void insertConsultRecord() {
        
        Consultant__c newConsultantdata = new Consultant__c();
        newConsultantdata.Name = 'john';
        newConsultantdata.Stages__c = 'Qualified';
        newConsultantdata.Email__c = 'abc@gmail.com';
        newConsultantdata.Consultant_Profile__c = 'Academic Consultant';
        newConsultantdata.Ed_Tech_Industry_Experienced_Years__c = 2;
        newConsultantdata.No_of_School_Handled__c = 5;
        newConsultantdata.Organization_Name__c = 'tata';
        newConsultantdata.Phone__c = '9852367411';
        newConsultantdata.State__c = 'Gujarat';
        
        insert newConsultantdata;
        CheckInController.insertCheckInRecord(newConsultantdata.Id,38.8951,77.0364,'xyz','You logged a call','Collection','Admin');
    }
    @isTest static void insertChannelPartnerRecord() {
        
        Channel_Partner__c newChannelPartnerdata = new Channel_Partner__c();
        newChannelPartnerdata.Name = 'abd';
        newChannelPartnerdata.Stages__c = 'Identified';
        newChannelPartnerdata.Organization_Name__c = 'tata';
        newChannelPartnerdata.Phone__c = '9852367411';
        newChannelPartnerdata.State__c = 'Goa';
        
        insert newChannelPartnerdata;
        CheckInController.insertCheckInRecord(newChannelPartnerdata.Id,38.8951,77.0364,'xyz','You logged a call','Collection','Admin');
    }
    @isTest static void insertOpportunityRecord() {
        
        Opportunity newOpportunitydata = new Opportunity();
        newOpportunitydata.Name = 'abuburj';
        newOpportunitydata.StageName = 'Trial';
        newOpportunitydata.LeadSource = 'Consultant';
        newOpportunitydata.CloseDate = system.Today()+3;
        newOpportunitydata.Trial_Sign_Up_date__c = system.Today();
        newOpportunitydata.Trial_Start_Date__c = system.Today()+1;
        newOpportunitydata.Trial_End_Date__c = system.Today()+2;
        newOpportunitydata.Trial_Implementation_Method__c = 'At Home';
        newOpportunitydata.Trial_Grades__c = 'pass';
        
        insert newOpportunitydata;
        CheckInController.insertCheckInRecord(newOpportunitydata.Id,38.8951,77.0364,'xyz','You logged a call','Collection','Admin');
       
    }
}