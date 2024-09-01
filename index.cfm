<cfinclude template="./includes/header.cfm">
<cfinclude template="./includes/navbar.cfm">
<div class="container mt-4">
  <div class="row">
    <div class="col-md-8">
      <h1 class="mb-4">Welcome to CF Forum</h1>
      <cfinclude template="./views/discussions/latest.cfm">
      <cfinclude template="./views/discussions/hotTopics.cfm">
    </div>
    <div class="col-md-4">
      <cfinclude template="./views/login/user_info.cfm">
      <cfinclude template="./views/members/forumStatistics.cfm">
      <cfinclude template="./views/members/topContributors.cfm">
      <cfinclude template="./views/members/recentMembers.cfm">
    </div>
  </div>
</div>

<cfinclude template="./includes/footer.cfm">
