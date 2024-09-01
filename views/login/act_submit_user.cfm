<cfsetting showdebugoutput="false">

<cfset session.isLoggedIn = true>

<cfdump var="#form#">

<cfoutput>
  <div id="userInfo" class="container-fluid">
    <div class="row">
      <div class="col-10">
        <div class="h4"></div>
      </div>
      <div class="col-2 text-center">
        <button class="btn btn-sm btn-secondary">Logout</button>
      </div>
    </div>
  </div>
</cfoutput>
