import { LightningElement, wire ,api } from 'lwc';
import PortfolioAssets from '@salesforce/resourceUrl/Portfolio';
import Profile_pic from '@salesforce/resourceUrl/Abhishek_Profile';
import {getRecord, getFieldValue} from 'lightning/uiRecordApi';
import FULLNAME from '@salesforce/schema/portfolio__c.Name';
import COMPANYNAME from '@salesforce/schema/portfolio__c.Comany__c';
import ROLE from '@salesforce/schema/portfolio__c.role__c';
import LOCATION from '@salesforce/schema/portfolio__c.Location_city__c';


export default class Banner extends LightningElement {

    @api recordId;
    @api linkedinUrl;
    @api twitterUrl;
    @api githubUrl;
    @api youtubeUrl;
    @api trailheadUrl;
    @api blogUrl;


    userPic = `${Profile_pic}`
    linkedin = `${PortfolioAssets}/PortfolioAssets/Social/linkedin.svg`
    youtube = `${PortfolioAssets}/PortfolioAssets/Social/youtube.svg`
    github = `${PortfolioAssets}/PortfolioAssets/Social/github.svg`
    twitter = `${PortfolioAssets}/PortfolioAssets/Social/twitter.svg`
    trailhead = `${PortfolioAssets}/PortfolioAssets/Social/trailhead1.svg`
    blog = `${PortfolioAssets}/PortfolioAssets/Social/blogger.svg`

    //recordId='a015g00000nwW0VAAU';
    @wire(getRecord,{recordId:'$recordId',fields:[FULLNAME,COMPANYNAME,ROLE,LOCATION]})
    portfolioData
    // portfolioHandler({data,error}){
    //     if(data){
    //         console.log("record data:",JSON.stringify(data));
    //     }
    //     if(error){
    //         console.log("error",error);
    //     }
    // }

    get fullName(){
        return getFieldValue(this.portfolioData.data,FULLNAME);
    }
    
    get companyName(){
        return getFieldValue(this.portfolioData.data,COMPANYNAME);
    }
    
    get role(){
        return getFieldValue(this.portfolioData.data,ROLE);
    }
    
    get location(){
        return getFieldValue(this.portfolioData.data,LOCATION);
    }



    
}