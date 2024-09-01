<cfsetting showdebugoutput="false">
<cfset session.isLoggedIn = true>
<cfset session.username = form.username>
<cfinclude template="dsp_user_details.cfm">