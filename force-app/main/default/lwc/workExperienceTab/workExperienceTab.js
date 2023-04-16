import { LightningElement, wire ,api } from 'lwc';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';

export default class WorkExperienceTab extends LightningElement {
    @api recordId

    @wire(getRelatedListRecords,{
        parentRecordId: '$recordId',
        relatedListId: 'Work_Experience__r',
        fields:['WorkExperience_c.Job_Start_Date__c',
        'WorkExperience_c.Job_End_Date__c',
        'WorkExperience_c.Is_Current__c',
        'WorkExperience_c.Role__c',
        'WorkExperience_c.CompanyName__c',
        'WorkExperience_c.Description__c',
       ]
    })workExperienceHandler({data,error}){
        if(data){
            console.log(this.data)

        }
        if(error){
            console.log(this.error)
        }
    }
}