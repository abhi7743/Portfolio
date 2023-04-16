import { LightningElement,api } from 'lwc';

export default class SummaryTab extends LightningElement {
    @api recordId;
    @api objectApiName;

}