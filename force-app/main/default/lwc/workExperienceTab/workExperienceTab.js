import { LightningElement, wire ,api } from 'lwc';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';

export default class WorkExperienceTab extends LightningElement {
    @api recordId;
    @api p;
    workExperience=[]
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
            this.formatExperience(data)

        }
        if(error){
            console.log(this.error)
        }
    }
    datacheck(){
        console.log(this.p);
    }
    formatExperience(data){
        this.workExperience=[...data.records].reverse().map(item=>{
            let id =item.id;
            const {Job_End_Date__c, Job_Start_Date__c, Role__c,
                CompanyName__c, Description__c, Is_Current__c }=item.fields
            let JobStartDate = this.getValue(Job_Start_Date__c);
            let JobEndDate = this.getValue(Job_End_Date__c);
            let Role = this.getValue(Role__c);
            let CompanyName = this.getValue(CompanyName__c);
            let Description = this.getValue(Description__c);
            let IsCurrent= this.getValue(Is_Current__c);

            return {id,JobStartDate,JobEndDate,Role,CompanyName,Description,IsCurrent}
        })
        
    }
    
    getValue(data){
        return data && (data.displayValue || data.value);
    }
}