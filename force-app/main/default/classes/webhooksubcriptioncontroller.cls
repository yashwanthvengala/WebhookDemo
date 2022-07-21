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
            JSONParser parser =JSON.createParser(request.requestBody.toString());
            // pusher ps;
            //  head_commit hc;
            //  String repo;
            //  while(parser.nextToken() != null){
            //     if(parser.getText()=='pusher'){
            //         System.debug('inside pusher');
            //         parser.nextToken();
            //         ps=(pusher)parser.readValueAs(pusher.class);
            //         System.debug(ps);
            //     }
            //     if(parser.getText()=='head_commit'){
            //         System.debug('inside head commit');
            //         parser.nextToken();
            //         hc=(head_commit)parser.readValueAs(head_commit.class);
            //         System.debug(hc);
            //     }
            //     if(parser.getText()=='full_name'){
            //         System.debug('inside full name');
            //         parser.nextToken();
            //         repo=parser.getText();
            //         System.debug(repo);
            //     }
             //}



        }
        Catch(Exception e){
            System.debug('Exception:' +e.getMessage());

        }
    }
}
