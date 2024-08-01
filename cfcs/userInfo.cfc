
/**
*
* @file  C:\ColdFusion2023\cfusion\wwwroot\cf_forum\cfcs\userInfo.cfc
* @description
*
*/

component displayname="userInfo" output="false" assessors="true" {

  property name="username" type="string" default="";
  property name="email" type="string" default="";
  property name="join_date" type="date" default="";
  property name="last_activity" type="date" default="";
  property name="post_count" type="numeric" default="";

  public function init(){
    return this;
  }
}
