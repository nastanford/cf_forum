<cfsetting showdebugoutput="false">

TEST AAA
<!---
<cfscript>
  var userDAO = new cfcs.dao.userDAO();
  var result = userDAO.createUser(form);
</cfscript>
<cfdump var="#result#">

  passwordHasher = new cfcs.utils.PasswordHasher();
  hashedPassword = passwordHasher.hashPassword("#form.password#");
<cftry>
  <cfquery name="insert" result="queryResult">
    INSERT INTO members
    (
      username, 
      email, 
      password,
      created_at,
      updated_at,
      post_count,
      IsAuthenticated
    )
    VALUES
    (
      <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#hashedPassword#" cfsqltype="cf_sql_varchar">,
      <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">,
      <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">,
      0,
      'True'
    )
  </cfquery>

  <!--- Retrieve the last inserted ID --->
  <cfset newMemberID = queryResult.generatedKey>
  <cfset session.user.setID(newMemberID)>

  <cfcatch type="any">
    Error: <cfoutput>#cfcatch.message#</cfoutput>
  </cfcatch>
</cftry>



<cfquery name="getUserInfo">
  select * 
  from memberss
  where 
    member_id = <cfqueryparam value="#newMemberID#" cfsqltype="cf_sql_integer">
</cfquery>

<cfscript>
  session.user.setId(getUserInfo.id);
  session.user.setUsername(getUserInfo.username);
  session.user.setEmail(getUserInfo.email);
  session.user.setIsAuthenticated(True);
  session.user.setRoles("user");
  session.user.setCreatedAt(getUserInfo.created_at);
  session.user.setLoginAt(getUserInfo.login_at);
</cfscript>

--->