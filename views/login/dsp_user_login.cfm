<cfoutput>
  <form 
    hx-post="#this.weburl#/views/login/act_user_check.cfm" 
    hx-target="##loginScreen"
    hx-swap="innerHTML">
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email">
    </div>
    <div class="mb-3">
      <label for="mypassword" class="form-label">Password</label>
      <input type="password" class="form-control" id="mypassword" name="mypassword" placeholder="Enter your password">
    </div>
    <div class="mb-3">
      <button type="submit" class="btn btn-primary">Login</button>
      <a href=""
      hx-get="#this.weburl#/views/login/dsp_user_register.cfm"
      hx-target="##loginScreen"
      hx-swap="innerHTML"
      class="btn btn-outline-secondary">Register</a>
    </div>
  </form>
</cfoutput>