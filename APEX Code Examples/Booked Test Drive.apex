trigger TestDriveBookingTrigger on Lead (after update) {
    for (Lead lead : Trigger.new) {
        Lead oldLead = Trigger.oldMap.get(lead.Id);
        if (lead.Test_Drive_Scheduled__c != null && lead.Test_Drive_Scheduled__c && !oldLead.Test_Drive_Scheduled__c) {
            ISEvent.postEvent('assist://salescloud/testdrive/book',lead.Email,'emailkey');
        }
        else {
            System.Debug('-----] Condition Not Matched');
        }
    }
}

public class ISEvent {
    @future (callout=true)
    public static void postEvent(String eventURI, String customerKey, String customerKeyName) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://na5.thunderhead.com/one/rt/track/ONE-XXXXXXXX-XXX/events');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody('{"uri":"' + eventURI + '", "customerKey":"' + customerKey + '", "customerKeyName": "' + customerKeyName + '"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return;

    }
}