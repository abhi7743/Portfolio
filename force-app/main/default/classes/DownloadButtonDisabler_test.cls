@isTest
public class DownloadButtonDisabler_test {
    
    @testSetup static void testCase_Upload() {
        Account testAccount = new Account(Name='TestAccount');
        insert testAccount;
        Attachment testAttachment = new Attachment(
            Name='test12345',
            Description='testDescription',
            ParentId=testAccount.Id);
        Blob bodyBlob = Blob.valueOf('Unit Test Attachment Body');
        testAttachment.body=bodyBlob;
        insert testAttachment;
        
        ContentVersion testContent = new ContentVersion(
            Title='test12345',
            Description='testDescription',
            ContentLocation = 'S',
            PathOnClient = 'test12345',
            VersionData = bodyBlob);
        insert testContent;
        
        User u = new User(
     ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
     LastName = 'last',
     Email = 'puser000@amamama.com',
     Username = 'puser000@amamama.com' + System.currentTimeMillis(),
     CompanyName = 'TEST',
     Title = 'title',
     Alias = 'alias',
     TimeZoneSidKey = 'America/Los_Angeles',
     EmailEncodingKey = 'UTF-8',
     LanguageLocaleKey = 'en_US',
     LocaleSidKey = 'en_US'
     //UserRoleId = r.Id
);
        insert u;
                User u1 = new User(
     ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
     LastName = 'last2',
     Email = 'puser1000@amamama.com',
     Username = 'puser1000@amamama.com' + System.currentTimeMillis(),
     CompanyName = 'TEST',
     Title = 'title',
     Alias = 'alias',
     TimeZoneSidKey = 'America/Los_Angeles',
     EmailEncodingKey = 'UTF-8',
     LanguageLocaleKey = 'en_US',
     LocaleSidKey = 'en_US'
     //UserRoleId = r.Id
);
        insert u1;

                User u3 = new User(
     ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
     LastName = 'last3',
     Email = 'puser1000@amamama.com',
     Username = 'puser1000@amamama.com' + System.currentTimeMillis(),
     CompanyName = 'TEST',
     Title = 'title',
     Alias = 'alias',
     TimeZoneSidKey = 'America/Los_Angeles',
     EmailEncodingKey = 'UTF-8',
     LanguageLocaleKey = 'en_US',
     LocaleSidKey = 'en_US'
     //UserRoleId = r.Id
);
        insert u3;
         User u4 = new User(
     ProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id,
     LastName = 'last4',
     Email = 'puser1000@amamama.com',
     Username = 'puser1000@amamama.com' + System.currentTimeMillis(),
     CompanyName = 'TEST',
     Title = 'title',
     Alias = 'alias',
     TimeZoneSidKey = 'America/Los_Angeles',
     EmailEncodingKey = 'UTF-8',
     LanguageLocaleKey = 'en_US',
     LocaleSidKey = 'en_US'
     //UserRoleId = r.Id
);
        insert u4;
        ContentDocumentLink testLink = new ContentDocumentLink(
            ContentDocumentId = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id =:testContent.Id].ContentDocumentId,
            LinkedEntityId = testAccount.Id,
            ShareType = 'V');
        insert testLink;
        DownloadAccessManager__c DAM= new  DownloadAccessManager__c();
        DAM.Request_Status__c='Approved';
        DAM.User__c=u1.id;
        DAM.Reason__c='Test Reason';
        DAM.FileId__c=testLink.id;
        System.debug('@@@DAM=>'+DAM);
         DownloadAccessManager__c DAM2= new  DownloadAccessManager__c();
        DAM2.Request_Status__c='Cancelled';
        DAM2.User__c=u3.id;
        DAM2.Reason__c='Test Reason';
        DAM2.FileId__c=testLink.id;
        System.debug('@@@DAM=>'+DAM2);
        Database.SaveResult[] sr = Database.insert(new List<SObject>{DAM2,DAM},false);
        system.debug('@@@sr=>'+sr);
        
        
    }
 @istest
  static void test1(){
        user u1=[select id from user where lastname='last'];
        Account acct=[select id,name from Account where name='TestAccount' limit 1];
        ContentDocumentLink testLink=[SELECT Id, ContentDocumentId FROM  ContentDocumentLink WHERE LinkedEntityId = :acct.Id];
        system.debug('userid='+u1.id);
		system.runas(u1){
        DownloadButtonDisabler f = new DownloadButtonDisabler() ;
        f.getContentDownloadHandler(new List<Id>{testLink.Id}, null);
        }
    
    }
    @istest
  static void test2(){
        user u1=[select id from user where lastname='last2'];
        Account acct=[select id,name from Account where name='TestAccount' limit 1];
        ContentDocumentLink testLink=[SELECT Id, ContentDocumentId FROM  ContentDocumentLink WHERE LinkedEntityId = :acct.Id];
        system.debug('userid='+u1.id);
		system.runas(u1){
        DownloadButtonDisabler f = new DownloadButtonDisabler() ;
        f.getContentDownloadHandler(new List<Id>{testLink.Id}, null);
        }
    
    }
     @istest
  static void test3(){
        user u1=[select id from user where lastname='last3'];
        Account acct=[select id,name from Account where name='TestAccount' limit 1];
        ContentDocumentLink testLink=[SELECT Id, ContentDocumentId FROM  ContentDocumentLink WHERE LinkedEntityId = :acct.Id];
        system.debug('userid='+u1.id);
		system.runas(u1){
        DownloadButtonDisabler f = new DownloadButtonDisabler() ;
        f.getContentDownloadHandler(new List<Id>{testLink.Id}, null);
        }
    
    }
    
     @istest
  static void test4(){
        user u1=[select id from user where lastname='last4'];
        Account acct=[select id,name from Account where name='TestAccount' limit 1];
        ContentDocumentLink testLink=[SELECT Id, ContentDocumentId FROM  ContentDocumentLink WHERE LinkedEntityId = :acct.Id];
        system.debug('userid='+u1.id);
		system.runas(u1){
        DownloadButtonDisabler f = new DownloadButtonDisabler() ;
        f.getContentDownloadHandler(new List<Id>{testLink.Id}, null);
        }
    
    }

    
}