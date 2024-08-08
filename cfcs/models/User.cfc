
component displayname="User" output="false" accessors="true"  {
  property name="id" type="integer" default="0";
  property name="username" type="string" default="";
  property name="password" type="string" default="";
  property name="email" type="string" default="";
  property name="created_at" type="date" default="";
  property name="login_at" type="date" default="";
  property name="isAuthenticated" type="boolean" default="false";
  property name="roles" type="array" default="[]";

  public function init(){
    return this;
  }
}
/*
  x = []  
  y = {} 
  SACS  - Sqauares for Arrays and Curly Braces for Sturctures.
  SACS holds Arrays and Structures.
*/