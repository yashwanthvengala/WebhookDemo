@RESTResource(urlMapping='/api/webhooks/pushdetails/*')
global with sharing class webhooksubcriptioncontroller {
    @HTTPPost
    global static void handlechangenotification(){
        try{
            RestRequest request =RestContext.request;
            RestResponse response=RestContext.response;

             String requestdata=request.headers.get('X-Hub-Signature-256');
             System.debug('requestdata@@::' +requestdata);
             Blob bb=request.requestBody;
             System.debug(bb.toString());

        }
        Catch(Exception e){
            System.debug('Exception:' +e.getMessage());

        }
    }
}
