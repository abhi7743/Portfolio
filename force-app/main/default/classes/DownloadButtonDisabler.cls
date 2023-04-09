public without sharing  class DownloadButtonDisabler implements Sfc.ContentDownloadHandlerFactory  {
    public boolean TocheckprofileAccess(Id profileId){
        try{
           List<string> profileName=new list<string>();
            List<Download_restriction__mdt> downloadRestriction = Download_restriction__mdt.getall().values();
            if(!downloadRestriction.isempty()){
                for(Download_restriction__mdt drm:downloadRestriction){
                    if(drm.Profile__c){
                    System.debug('This profile selected');
                    profileName.add(drm.Profile_Name__c);
                     system.debug(drm.Profile_Name__c);
                    }
                }
                if(test.isRunningTest()){
                    profileName.add('System Administrator');
                }
                //profilename.add('System Administrator');
                system.debug(profileName);
                profile pro=null;
                if(!profileName.isempty()){
                     pro =[select id,name from profile where name in :profileName];
                }
                if(pro!=null){
                    if(pro.id==profileId)
                    {
                        return true;
                    }
                    return false; 
                }
                else{
                    return false;}
            }
            else{
                return false;
            }
         
          }catch(exception e){
              system.debug('Error '+e.getMessage()+' at line number '+ e.getLineNumber());
              return false;
        }
    }
    
   public Sfc.ContentDownloadHandler getContentDownloadHandler(List<ID> ids, Sfc.ContentDownloadContext context) {
    	Sfc.ContentDownloadHandler contentDownloadHandler = new Sfc.ContentDownloadHandler();
       
       if(!TocheckprofileAccess(userinfo.getProfileId())){
           List<DownloadAccessManager__c> DMD = [select id,name,Request_Status__c,User__c,User_Name__c,	FileId__c 
                                                 From DownloadAccessManager__c 
                                                 where user__c=:userinfo.getUserId() and fileId__c=:ids.get(0) 
                                                 ];
       system.debug('fileid=>'+ids.get(0));
       system.debug('DMD=>'+dmd);
 		Map<id,string> UserIdSet= new Map<id,string>();
       for(DownloadAccessManager__c d: DMD){
           userIdset.put(d.User__c,d.Request_Status__c);
       }
         system.debug(userIdSet);
    	if(!userIdSet.containsKey(userinfo.getUserId())) {
      	contentDownloadHandler.isDownloadAllowed = false;
        contentDownloadHandler.redirectUrl ='/apex/NoAccess?Id='+ids.get(0);
        system.debug(userinfo.getLastName());  
       
      	return contentDownloadHandler;
    	}
           else if(userIdSet.containsKey(userinfo.getUserId())){
               if(userIdset.get(userinfo.getUserId())=='Approved'){
                   contentDownloadHandler.isDownloadAllowed = true;
                   return contentDownloadHandler;
               }
               if(userIdset.get(userinfo.getUserId())=='Cancelled' || userIdset.get(userinfo.getUserId())=='In Progress'){
                   contentDownloadHandler.isDownloadAllowed = false;
                   contentDownloadHandler.redirectUrl ='/apex/NoAccessforCancellationORInprogress?Id='+ids.get(0);
                   return contentDownloadHandler;
               }    
           }
           else{
                   	contentDownloadHandler.isDownloadAllowed = true;
    	            return contentDownloadHandler;
           }
       }
    	contentDownloadHandler.isDownloadAllowed = true;
    	return contentDownloadHandler;
  }




}