@RESTResource(urlMapping='/api/webhooks/pushdetails/*')
global with sharing class webhooksubcriptioncontroller {
    @HTTPPost
    global static void handlechangenotification(){
        try{
            RestRequest request =RestContext.request;
            RestResponse response=RestContext.response;

        }
        Catch(Exception e){
            System.debug('Exception:' +e.getMessage());

        }
    }
}
