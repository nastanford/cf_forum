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
        <cfinclude template="./partials/login.cfm">
      </div>      
      <cfinclude template="./partials/card3.cfm">
      <cfinclude template="./partials/card4.cfm">
      <cfinclude template="./partials/card5.cfm">
    </div>
  </div>
</div>





<cfinclude template="./includes/footer.cfm">
