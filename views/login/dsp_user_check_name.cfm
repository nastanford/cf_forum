<cfsetting showDebugOutput = "no" >
<!--- Check if the username exists --->
<cfquery name="checkUsernameExists">
  SELECT *
  FROM members
  WHERE username = <cfqueryparam value="#url.username#" cfsqltype="cf_sql_varchar">
</cfquery>
<!--- 
  Pass either an error back or nothing back and disable button 
  if it already exists. 
--->
<cfif checkUsernameExists.recordcount gt 0>
  <cfoutput>
    <div class="alert alert-danger" role="alert">
      #url.username# already exists! 
    </div>        
  </cfoutput>

  <button type="submit" id="register_button" hx-swap-oob="true" class="btn btn-secondary text-center disabled">Register</button>
<cfelse>
  <button type="submit" id="register_button" hx-swap-oob="true" class="btn btn-primary text-center">Register</button>
</cfif>