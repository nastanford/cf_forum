<cfsetting showdebugoutput=false>
<cfinclude template="./includes/header.cfm">
<cfinclude template="./includes/navbar.cfm">

<div class="container col-md-8 col-LG-4">
  <form>
    <div class="mb-3">
      <label for="exampleInputEmail1" class="form-label">Username</label>
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    </div>
    <div class="mb-3">
      <label for="exampleInputEmail1" class="form-label">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    </div>
    <div class="mb-3">
      <label for="exampleInputPassword1" class="form-label">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1">
    </div>
    <button type="submit" class="btn btn-primary text-center">Register</button>
  </form>

</div>


<cfinclude template="./includes/footer.cfm">
