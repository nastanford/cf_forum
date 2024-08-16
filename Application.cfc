component{

  this.name = "CF Forum 3";
  this.applicationTimeout = createTimeSpan( 30, 0, 0, 0 );
  this.sessionStorage = true;
  this.sessionManagement = true;  
  this.sessionStorage = true;
  this.sessionTimeout = createTimeSpan( 0, 0, 60, 0 );
  this.datasource = "cfforumdb";
  this.weburl = "/cf_forum";
  this.mappings["/cfcs"] = expandPath("/cf_forum/cfcs");

  function onApplicationStart(){}
  function onApplicationEnd( struct applicationScope ) {}

  function onSessionStart() {
    session.user = new cfcs.models.User();
  }
  function onSessionEnd( struct sessionScope, struct applicationScope ) {}

  function onRequestStart( string targetPage ) {}
  function onRequest( string targetPage ) {
    include arguments.targetPage;
  }
  function onRequestEnd() {}
  function onCFCRequest( cfcname, method, struct args) { 
        return;
  } 

  function onError( any Exception, string EventName ) {}
  function onAbort( required string targetPage ) {} 
  function onMissingTemplate( required string targetPage ) {}

}
