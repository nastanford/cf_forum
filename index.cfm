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
      <div id="loginScreen" class="rounded p-3 mb-1">
        <cfif session.user.getUsername() neq "">
          <cfinclude template="./views/login/userInfo.cfm">
        <cfelse>
          <cfinclude template="./views/login/loginForm.cfm">
        </cfif>
      </div>      
      <cfinclude template="./views/members/forumStatistics.cfm">
      <cfinclude template="./views/members/topContributors.cfm">
      <cfinclude template="./views/members/recentMembers.cfm">
    </div>
  </div>
</div>
<!---
CREATE TABLE IF NOT EXISTS `MEMBERS` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(50) UNIQUE NOT NULL,
  `email` VARCHAR(100) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `login_at` DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `post_count` INT NOT NULL DEFAULT 0,
  `role_id` int NOT NULL DEFAULT 1
);
username, email, password
--->

<cfscript>
    options = {result="result", datasource="cfforumdb"};
    sql = 'INSERT INTO members 
    (username,email,password)
	   VALUES ("csample", "csample@test.com", "password")';
    QueryExecute(sql, [] ,options);
    writeDump( var=result.generatedKey );
</cfscript>



<cfinclude template="./includes/footer.cfm">
