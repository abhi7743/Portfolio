public without sharing class IRMController {
    public ContentVersion versionDetails{get;set;}
    public string reason{get; set;}
    public boolean isEnabled{get; set;}
    public boolean btndis{get; set;}
    
    public IRMController() {
        String versionId = ApexPages.currentPage().getParameters().get('id');
        versionDetails = [Select Id ,VersionNumber,Description ,SharingOption,SharingPrivacy,Title,contentUrl from ContentVersion where id=:versionId] ;
		isEnabled=false;
        btndis=true;
    }
    public PageReference save(){
        DownloadAccessManager__c DAM = new DownloadAccessManager__c();
        system.debug(versionDetails.title);
        id userid= userinfo.getUserId();
        DAM.Name='Access for '+userinfo.getName()+'for '+versionDetails.Title;
        DAM.User__c=userid;
        DAM.FileId__c =ApexPages.currentPage().getParameters().get('id');
        DAM.User__c=userinfo.getUserId();
        DAM.FileName__c=versionDetails.Title;
        DAM.FileURL__c=versionDetails.ContentUrl;
        DAM.Reason__c=reason;
        System.debug('@@@Reason=>'+ reason);
        system.debug('@@@ContentUrl=>'+versionDetails.ContentUrl);
        isEnabled=true;
       btndis=false;
        system.debug(isEnabled);
        Database.SaveResult[] sr = Database.insert(new List<SObject>{DAM});
        System.debug(sr[0]);
        return null;
    }
    
}