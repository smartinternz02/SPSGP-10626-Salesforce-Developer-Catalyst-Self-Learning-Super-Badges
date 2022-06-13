@isTest
private class DailyLeadProcessorTest {
    @testsetup
    static void setup(){
        List<lead> lstOfLead = new List<lead>();
        for(Integer i = 1; i<=200; i++){
            Lead ld = new Lead(Company ='comp' + i, LastName = 'LN' + i ,status ='working -contacted');
            lstOfLead.add(ld);
        }
        
        insert lstOfLead;
    }

    static testmethod void testDailyLeadProcessorScheduledJob(){
        string sch = '0 5 12 * * ?';
        Test.startTest();
        string jobId = system.Schedule('scheduledApexTest',sch, new DailyLeadProcessor());
        
        List<Lead> lstOfLead = [SELECT iD from lEAD where LeadSource = null limit 200];
        system.assertEquals(200,lstOfLead.size());
        
        Test.stopTest();
    }
}