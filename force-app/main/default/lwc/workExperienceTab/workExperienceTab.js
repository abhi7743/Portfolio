import { LightningElement, wire ,api } from 'lwc';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';

export default class WorkExperienceTab extends LightningElement {
    @api recordId;
    @api p;
    @wire(getRelatedListRecords,{
        parentRecordId: 'a015g00000nwW0VAAU',
        relatedListId: 'Work_Experiences__r',
        fields:['Work_Experience__c.CompanyName__c',
        'Work_Experience__c.Description__c',
        'Work_Experience__c.Is_Current__c',
        'Work_Experience__c.Job_End_Date__c',
        'Work_Experience__c.Job_Start_Date__c',
        'Work_Experience__c.Role__c'

       ]
    })workExperienceHandler({data,error}){
        if(data){
            console.log("WorkExperience Data ", JSON.stringify(data));
            this.p=data;

        }
        if(error){
            console.log(this.error)
        }
    }
    datacheck(){
        console.log(this.p);
    }
}