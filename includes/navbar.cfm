<cfoutput>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <a class="navbar-brand" href="#this.weburl#/">CF Forum</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="##navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link #(cgi.script_name EQ '#this.weburl#/index.cfm' ? 'active' : '')#" aria-current="page" href="#this.weburl#/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link #(cgi.script_name EQ '#this.weburl#/views/categories/index.cfm' ? 'active' : '')#" href="#this.weburl#/views/categories/">Categories</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-secondary" type="submit">Search</button>
      </form>
      </div>
    </div>
  </nav>
</cfoutput>

