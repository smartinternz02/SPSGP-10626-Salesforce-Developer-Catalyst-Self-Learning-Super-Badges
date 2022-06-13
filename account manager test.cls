@isTest
public class AccountManagerTest {
    static testMethod void testMethod1(){
        Account objAccount = new Account(Name = 'Test Contact');
        insert objAccount;
        
        Contact objContact = new Contact(LastName = 'Test Contact', AccountId = objAccount.Id);
        insert objContact;
        
       
        Id recordId = objAccount.Id;
        RestRequest request = new RestRequest();
        request.requestUri = 
            'https://empathetic-badger-rmquep-dev-ed.my.salesforce.com/services/apexrest/Accounts/' +
            recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account thisAccount = AccountManager.getAccount();
        
        system.assert(thisAccount != null);
        system.assertEquals('Test Account', thisAccount.Name);
    }

}