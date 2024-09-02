<cfsetting showdebugoutput=false>
<cfset hashedPassword=hash(form.mypassword, "SHA-256")>

<cfquery name="qry_user_check">
  select username
  from members 
  where 
    email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar"> 
    and password = <cfqueryparam value="#hashedPassword#" cfsqltype="cf_sql_varchar">
</cfquery>

<cfif qry_user_check.recordcount eq 1>
  <cfset session.isLoggedIn = true>
  <cfset session.username = qry_user_check.username>
  <cfinclude template="dsp_user_details.cfm">
</cfif>
