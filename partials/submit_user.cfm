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


<!--- Display Username --->
<cfoutput><div class="h4">#username#</div></cfoutput>
