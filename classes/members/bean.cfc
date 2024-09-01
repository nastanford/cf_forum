component displayname="Member" accessors="true" {
    property name="id" type="numeric";
    property name="username" type="string";
    property name="email" type="string";
    property name="password" type="string";
    property name="created_at" type="date";
    property name="login_at" type="date";
    property name="post_count" type="numeric";
    property name="role_id" type="numeric";

    public function init() {
        variables.created_at = now();
        variables.post_count = 0;
        return this;
    }
}