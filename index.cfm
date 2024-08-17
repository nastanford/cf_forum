
<!---
<cfinclude template="./includes/header.cfm">
<cfinclude template="./includes/navbar.cfm">

<div class="container mt-4">
  <div class="row">
    <div class="col-md-8">
      <h1 class="mb-4">Welcome to CF Forum</h1>
      <cfinclude template="./partials/card1.cfm">
      <cfinclude template="./partials/card2.cfm">
    </div>
    <div class="col-md-4">
      <div id="loginScreen" class="rounded p-3 mb-1">
        <cfinclude template="./partials/userInfo.cfm">
        <cfinclude template="./partials/login.cfm">
      </div>      
      <cfinclude template="./partials/card3.cfm">
      <cfinclude template="./partials/card4.cfm">
      <cfinclude template="./partials/card5.cfm">
    </div>
  </div>
</div>
--->
Test:
<cfscript>
  memberDAO = new cfcs.dao.memberDAO();
  writeDump(memberDAO);
  member = memberDAO.getMemberByID(1);
  writeDump(member);
  // Create a new member
  newMember = {
    username = 'testuser',
    email = 'test@test.com',
    password = 'password'
  };
  newMemberID = memberDAO.createMember(newMember);
    

</cfscript>
<!---
  // try {
    // userDAO = new cfcs.dao.userDAO();
    // memberDAO = new cfcs.dao.userDAO();

    writeDump(memberDAO);
    // Create a new user
    // newUser = {
    //   username = 'testuser',
    //   email = 'test@test.com',
    //   password = 'password'
    // };
    // newUserID = userDAO.createUser(newUser);
    
    // if (newUserID > 0) {
    //   writeOutput("New user created with ID: #newUserID#<br>");
      
    //   // Get a user by ID
    //   user = userDAO.getUserByID(newUserID);
    //   writeDump(user);
    //   if (!structIsEmpty(user)) {
    //     // User found, do something with the user data
    //     writeOutput("User found:<br>");
    //     writeDump(user);
    //   } else {
    //     // User not found
    //     writeOutput("User not found<br>");
    //   }
    // } else {
    //   writeOutput("Failed to create new user<br>");
    // }
  // } catch (any e) {
  //   writeOutput("An error occurred: #e.message#<br>");
  //   writeDump(var=e);
  // }

</cfscript>


<cfinclude template="./includes/footer.cfm">
--->
