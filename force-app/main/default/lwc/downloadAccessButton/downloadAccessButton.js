import { LightningElement,api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord } from 'lightning/uiRecordApi';
import {CurrentPageReference} from 'lightning/navigation';
import { getFieldValue } from 'lightning/uiRecordApi';
export default class DownloadAccessButton extends LightningElement {
    error
    currentUserId=USER_ID;
    request=true;
    currentuserName
    channelName = '/event/GettingFileId__e';
    isSubscribeDisabled = false;
    isUnsubscribeDisabled = !this.isSubscribeDisabled;

    DownloadManagerObject= DOWNLOADACCESSMANAGER;
    myFields=[REASON_FIELD];
    @api recordId;
    @wire(getRecord, {
        recordId:USER_ID,
        fields: [USER_NAME_FIELD]
    })wireUser({error,data}){
        if(error){
            this.error=error;
        }
        else if(data){
            this.currentuserName=data.fields.Name.value;
        }
    }
    @wire(CurrentPageReference)pageRef;
    connectedCallback(){
        console.log('@@@PageRef'+ pageRef);
    }   
     

    
   
  

}