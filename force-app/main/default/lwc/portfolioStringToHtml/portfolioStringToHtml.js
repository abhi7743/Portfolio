import { LightningElement,api } from 'lwc';

export default class PortfolioStringToHtml extends LightningElement {
    @api content;
    isLoaded=false;
    renderedCallback(){
        if(this.isLoaded){
            return false;
        }
        if(this.content){
            this.isloaded=true;
            const container=this.template.querySelector('.htmlContainer');
            console.log(this.content)
            console.log(container);
            container.innerHTML=this.content;
        }
    }


}