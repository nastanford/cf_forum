
<!---
<cfquery name="qryUserInfo">
  select * from member
  where member_id = 8
</cfquery>

<cfdump var="#qryUserInfo#" expand="false">

<cfscript>
  session.user.setId(qryUserInfo.member_id);
  session.user.setUsername(qryUserInfo.username);
  session.user.setEmail(qryUserInfo.email);
  session.user.setIsAuthenticated(qryUserInfo.isAuthenticated);
  session.user.setCreated_at(qryUserInfo.created_at) 
  session.user.setLogin_at(qryUserInfo.updated_at)
</cfscript>

--->


<cfinclude template="./includes/header.cfm">
<cfinclude template="./includes/navbar.cfm">

<div class="container mt-4">
  <div class="row">
    <div class="col-md-8">
      <cfdump var="#session#">

      <h1 class="mb-4">Welcome to CF Forum</h1>
      <cfinclude template="./partials/card1.cfm">
      <cfinclude template="./partials/card2.cfm">
    </div>
    <div class="col-md-4">
    <cfoutput>
      #session.user.getIsAuthenticated()#
      #session.user.getUsername()#
    </cfoutput>
      <div id="loginScreen" class="rounded p-3 mb-1">
        <cfinclude template="./partials/login.cfm">
      </div>      
      <cfinclude template="./partials/card3.cfm">
      <cfinclude template="./partials/card4.cfm">
      <cfinclude template="./partials/card5.cfm">
    </div>
  </div>
</div>


<cfinclude template="./includes/footer.cfm">

