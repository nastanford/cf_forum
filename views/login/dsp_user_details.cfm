<cfoutput>
  <div id="userInfo" class="container-fluid">
    <div class="row">
      <div class="col-10">
        <cfoutput><div class="h4">#session.username#</div></cfoutput>
        ColdFusion
      </div>
      <div class="col-2 text-center">
        <a 
          hx-post="#this.weburl#/views/login/act_user_logout.cfm" 
          hx-target="##loginScreen"
          hx-swap="innerHTML"
          class="btn btn-sm btn-secondary"          
          >Logout</a>
      </div>
    </div>
  </div>
</cfoutput>