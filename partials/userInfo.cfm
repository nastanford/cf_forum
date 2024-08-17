User Info:
<cfif session.user.getIsauthenticated() eq True>
  <cfoutput><div class="h4">#username#</div></cfoutput>
</cfif>