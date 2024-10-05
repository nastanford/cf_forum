<cfsetting showdebugoutput="false">
<cfset session.isLoggedIn = true>
<cfset session.username = form.username>

<cfquery name="insertMember">
  insert into members
  (
    username
    ,email
    ,password
  )
  values
  (
    <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
    ,<cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">
    ,<cfqueryparam value="#hash(form.password, "SHA-256")#" cfsqltype="cf_sql_varchar">    
  )
</cfquery>
<cfinclude template="dsp_user_details.cfm">

<!--- 
//! ************************************************************
//! Update Hash 
//! ************************************************************
//! The hash #hash(form.password, "SHA-256")# is not best choice but for this 
//! example it will work.  In a real application you would want to use a more 
//! secure method of hashing the password. 
--->