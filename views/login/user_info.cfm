
<div id="loginScreen" class="rounded p-3 mb-1">
  <cfif session.isLoggedIn>
    <cfinclude template="user_details.cfm">
  <cfelse>
    <cfinclude template="login_form.cfm">
  </cfif>
</div>      
