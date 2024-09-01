
<div id="loginScreen" class="rounded p-3 mb-1">
  <cfif session.isLoggedIn>
    <cfinclude template="dsp_user_details.cfm">
  <cfelse>
    <cfinclude template="dsp_user_login.cfm">
  </cfif>
</div>      
