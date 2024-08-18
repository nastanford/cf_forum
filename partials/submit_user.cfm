<cfsetting showdebugoutput="false">

<cfscript>
  memberDAO = new cfcs.daos.memberDAO();
  result = memberDAO.createMember(form);
  getUserInfo = memberDAO.getMemberByName(form.username);
  session.user.setUsername(getUserInfo.username);
  session.user.setEmail(getUserInfo.email);
  // session.user.setIsAuthenticated(True);
  // session.user.setRoles(getUserInfo.role_id);
  // session.user.setCreatedAt(getUserInfo.created_at);
  // session.user.setLoginAt(getUserInfo.login_at);
</cfscript>

<div id="userInfo" class="container-fluid">
  <div class="row">
    <div class="col-10">
      <cfoutput><div class="h4">#session.user.getUsername()#</div></cfoutput>
    </div>
    <div class="col-2 text-center">
      <button class="btn btn-sm btn-secondary">Logout</button>
    </div>
  </div>
</div>
