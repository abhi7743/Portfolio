import { LightningElement,api } from 'lwc';

export default class PortfolioUserDetails extends LightningElement {
    @api recordId
    @api objectApiName

    downloadResume(){
        window.open("https://github.com/abhi7743/AbhishekResumePDF/raw/main/Abhishek_Resume__.pdf","_blank");
    }


}