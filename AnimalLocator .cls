public class AnimalLocator {
    
    public static string getAnimalNameById(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+ id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        string strResp = '';
        system.debug('******response ' + response.getStatusCode());
        system.debug('******response ' + response.getBody());
        if (response.getStatusCode() == 200)
        {
            Map<string, Object> results = (Map<string, Object>) JSON.deserializeUntyped(response.getBody());
            Map<string, Object> animals = (Map<string, object>) results.get('animal');
            system.debug('Recieved the following animals:' + animals);
            strResp = string.valueof(animals.get('name'));
            system.debug('strResp >' + strResp);
        }
        return strResp;
        
    }

}