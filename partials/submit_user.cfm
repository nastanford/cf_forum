<cfsetting showdebugoutput=false>
<cfscript>
  passwordHasher = new cfcs.utils.PasswordHasher();
  hashedPassword = passwordHasher.hashPassword( "#form.password#" );
</cfscript>
<cftry>
  <cfquery name="insert">
    insert into member
    (
      username, 
      email, 
      password,
      join_date,
      last_activity,
      post_count
    )
    values
    (
      <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#hashedPassword#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">,
      <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">,
      0
    )
  </cfquery>

  <cfcatch type="any">
      Error: <cfoutput>#cfcatch.message#</cfoutput>
  </cfcatch>
</cftry>

<!---
<cfquery name="getLastID">
  select LAST_INSERT_ID() AS newID
</cfquery>

--->

<cfquery name="getUserInfo">
  select * from member
  where member_id = 5
</cfquery>

<cfscript>
  session.user.setId(5);
  session.user.setUsername(getUserInfo.username);
  session.user.setEmail(getUserInfo.email);
  session.user.setIsAuthenticated(True);
    
</cfscript>


<!---


id
username	
password	
email	
created_at	
login_at	
isAuthenticated	
roles	

--->
<!--- Display Username --->
<cfoutput><div class="h4">#username#</div></cfoutput>
