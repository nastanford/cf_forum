<div id="loginScreen">
  <form 
    hx-post="./partials/login_check.cfm" 
    hx-target="#loginScreen">
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com">
    </div>
    <div class="mb-3">
      <label for="mypassword" class="form-label">Password</label>
      <input type="password" class="form-control" id="mypassword" name="mypassword" placeholder="name@example.com">
    </div>
    <div class="mb-3">
      <button type="submit" class="btn btn-primary">Login</button>
      <a href="register.cfm" class="btn btn-secondary">Register</a>
    </div>
  </form>
</div>
