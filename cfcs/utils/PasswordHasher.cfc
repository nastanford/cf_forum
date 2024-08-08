component displayname="PasswordHasher" output="false"{

  public string function hashPassword(required string password){
    var hashedPassword = hash( password, "SHA-256", "UTF-8" );
    return hashedPassword;
  }

  public boolean function comparePasswords(required string password, required string hashedPassword){
    return hashPassword( password ) == hashedPassword;
  }

}
