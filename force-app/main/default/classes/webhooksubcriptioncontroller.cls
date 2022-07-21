@RESTResource(urlMapping='/api/webhooks/pushdetails/*')
global with sharing class webhooksubcriptioncontroller {
    @HTTPPost
    global static void handlechangenotification(){
        try{
            RestRequest request =RestContext.request;
            system.debug('request@@@:' +request);
            RestResponse response=RestContext.response;
            System.debug('response@@@:' +response);

         //    String requestdata=request.headers.get('X-Hub-Signature-256');
         //    System.debug('requestdata@@::' +requestdata);
         //    Blob bb=request.requestBody;
             System.debug(bb.toString());
            JSONParser parser =JSON.createParser(request.requestBody.toString());
            System.debug('parser@@@@' +parser);
            pusher ps;
             head_commit hc;
             String repo;
             while(parser.nextToken() != null){
                if(parser.getText()=='pusher'){
                    System.debug('inside pusher');
                    parser.nextToken();
                
                    ps=(pusher)parser.readValueAs(pusher.class);
                    System.debug(ps);
                }
                if(parser.getText()=='head_commit'){
                    System.debug('inside head commit');
                    parser.nextToken();
                    hc=(head_commit)parser.readValueAs(head_commit.class);
                    System.debug(hc);
                }
                if(parser.getText()=='full_name'){
                    System.debug('inside full name');
                    parser.nextToken();
                    repo=parser.getText();
                    System.debug(repo);
                }
             }
             Github__c detail= new Github__c();
             detail.Committer_Name__c=ps!=null?ps.name:'';
             detail.Committer_Email__c=ps!=null?ps.email:'';
             detail.Commit_Message__c=hc!=null?hc.message:'';
             detail.Commit_Timestamp__c=hc!=null?hc.timestamp:'';
             detail.Committed_URL__c=hc!=null?hc.url:'';
             detail.Repository_Name__c=repo;
 insert detail;
 response.statusCode=200;
 response.responseBody=Blob.valueOf(JSON.serialize(NEW SFDCResponse('Success','Processed successfully')));
 System.debug('response.responseBody@@@@:'+response.responseBody);

        }
        Catch(Exception e){
            System.debug('Exception:' +e.getMessage());

        }
    }
    public class SFDCResponse{
        String response;
        String message;
        public SFDCResponse(String resp, String msg){
            response=resp;
            message=msg;
        }
    }
    public class pusher{
        public String name;
        public String email;
        public pusher(String name, String email){
            name=name;
            email=email;
        }
    }
    public class head_commit{
        // String timestamp;
        String Url;
        String message;
        String timestamp;
        public head_commit(String msg, String url,String tmstamp){
            message=msg;
            Url=url;
            timestamp=tmstamp;

        }
    }
}
