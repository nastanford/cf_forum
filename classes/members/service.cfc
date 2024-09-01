component displayname="MemberService" {
    
    property name="memberDAO";

    public function init() {
        variables.memberDAO = new MemberDAO();
        return this;
    }

    public function createMember(required string username, required string email, required string password, numeric role_id = 1) {
        var member = new Member();
        member.setUsername(arguments.username);
        member.setEmail(arguments.email);
        member.setPassword(hash(arguments.password, "SHA-256"));
        member.setRole_id(arguments.role_id);
        return variables.memberDAO.create(member);
    }

    public function updateMember(required numeric id, string username, string email, numeric role_id) {
        var member = variables.memberDAO.read(arguments.id);
        if (isNull(member)) {
            throw("Member not found");
        }
        if (structKeyExists(arguments, "username")) member.setUsername(arguments.username);
        if (structKeyExists(arguments, "email")) member.setEmail(arguments.email);
        if (structKeyExists(arguments, "role_id")) member.setRole_id(arguments.role_id);
        return variables.memberDAO.update(member);
    }

    public function getMember(required numeric id) {
        return variables.memberDAO.read(arguments.id);
    }

    public function deleteMember(required numeric id) {
        return variables.memberDAO.delete(arguments.id);
    }

    public function changePassword(required numeric id, required string oldPassword, required string newPassword) {
        var member = variables.memberDAO.read(arguments.id);
        if (isNull(member)) {
            throw("Member not found");
        }
        if (member.getPassword() eq hash(arguments.oldPassword, "SHA-256")) {
            member.setPassword(hash(arguments.newPassword, "SHA-256"));
            variables.memberDAO.update(member);
        } else {
            throw("Invalid old password");
        }
    }

    public function logLogin(required numeric id) {
        var member = variables.memberDAO.read(arguments.id);
        if (isNull(member)) {
            throw("Member not found");
        }
        member.setLogin_at(now());
        variables.memberDAO.update(member);
    }

    public function incrementPostCount(required numeric id) {
        var member = variables.memberDAO.read(arguments.id);
        if (isNull(member)) {
            throw("Member not found");
        }
        member.setPost_count(member.getPost_count() + 1);
        variables.memberDAO.update(member);
    }
}