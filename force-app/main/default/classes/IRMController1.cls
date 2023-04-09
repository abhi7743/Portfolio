public without sharing class IRMController1 {
    public string errortext{get; set;}
    
    public IRMController1(){
        String versionId = ApexPages.currentPage().getParameters().get('id');
        List<DownloadAccessManager__c> DMD = [select id,name,Request_Status__c,User__c,User_Name__c,FileId__c 
                                                 From DownloadAccessManager__c 
                                                 where user__c=:userinfo.getUserId() and fileId__c=:versionId
                                              AND (Request_Status__c='Cancelled' or Request_Status__c='In Progress')];
        
        Map<id,string>userIdset = new Map<id,string>();                                      
        for(DownloadAccessManager__c d: DMD){
           userIdset.put(d.User__c,d.Request_Status__c);
            if(userIdset.get(userinfo.getUserId())=='Cancelled'){
                errortext=System.Label.NoAccessCancellation;
            }
            else{
                errortext=System.Label.NoAccessPendingRequest;
            }
       }
       
        
        
        
	
    }

}