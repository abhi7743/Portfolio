trigger DAMTrigger on DownloadAccessManager__c (before insert) {
    
    if(Trigger.isInsert){
        set<id> versionsId = new set<id>();
        for(DownloadAccessManager__c DAM:Trigger.new){
            versionsId.add(DAM.FileId__c);
            
    
        }
    }

}