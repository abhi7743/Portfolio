import { LightningElement } from 'lwc';
import PortfolioAssets from '@salesforce/resourceUrl/Portfolio';
import Profile_pic from '@salesforce/resourceUrl/Abhishek_Profile';
export default class Banner extends LightningElement {
    linkedinUrl = 'https://www.linkedin.com/in/abhishek-kumar-kr/'
    twitterUrl = 'https://twitter.com/Abhi_Kumar101'
    githubUrl = 'https://github.com/abhi7743'
    //youtubeUrl = 'https://youtube.com/salesforcetroop'
    trailheadUrl = 'https://trailblazer.me/id/akumar5916'
    blogUrl = 'https://www.salesforcetroop.com/'


    userPic = `${Profile_pic}`
    linkedin = `${PortfolioAssets}/PortfolioAssets/Social/linkedin.svg`
    youtube = `${PortfolioAssets}/PortfolioAssets/Social/youtube.svg`
    github = `${PortfolioAssets}/PortfolioAssets/Social/github.svg`
    twitter = `${PortfolioAssets}/PortfolioAssets/Social/twitter.svg`
    trailhead = `${PortfolioAssets}/PortfolioAssets/Social/trailhead1.svg`
    blog = `${PortfolioAssets}/PortfolioAssets/Social/blogger.svg`

    
}