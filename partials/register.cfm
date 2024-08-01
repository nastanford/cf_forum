<cfsetting showdebugoutput=false>
<div class="container col-12">
  <form 
    hx-post="./partials/submit_user.cfm" 
    hx-target="#loginScreen"
    hx-swap="innerHTML">

    <div class="mb-3">
      <label for="username" class="form-label">Username</label>
      <input type="text" 
        class="form-control" 
        id="username" 
        name="username"
        hx-get="./partials/username_exists.cfm"
        hx-target="#usernameError"
        hx-swap="innerHTML">
      <div id="usernameError" class="mt-3"></div>
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control" id="email" name="email">
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" name="password">
    </div>
    <div>
      <button type="submit" class="btn btn-primary text-center">Register</button>
    </div>
  </form>
</div>