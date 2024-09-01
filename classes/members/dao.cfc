component displayname="MemberDAO" {
    
    public function init() {
        return this;
    }

    public function create(required Member member) {
        // Implement database insert logic here
        // This is a placeholder, replace with actual database operations
        queryExecute("
            INSERT INTO members (username, email, password, role_id, created_at)
            VALUES (:username, :email, :password, :role_id, :created_at)
        ", {
            username: member.getUsername(),
            email: member.getEmail(),
            password: member.getPassword(),
            role_id: member.getRole_id(),
            created_at: member.getCreated_at()
        });
        // Assume the database returns the new ID
        member.setId(1); // Replace with actual ID from database
        return member;
    }

    public function update(required Member member) {
        // Implement database update logic here
        // This is a placeholder, replace with actual database operations
        queryExecute("
            UPDATE members
            SET username = :username, email = :email, role_id = :role_id
            WHERE id = :id
        ", {
            id: member.getId(),
            username: member.getUsername(),
            email: member.getEmail(),
            role_id: member.getRole_id()
        });
        return member;
    }

    public function read(required numeric id) {
        // Implement database read logic here
        // This is a placeholder, replace with actual database operations
        var qry = queryExecute("SELECT * FROM members WHERE id = :id", {id: arguments.id});
        if (qry.recordCount) {
            var member = new Member();
            member.setId(qry.id);
            member.setUsername(qry.username);
            member.setEmail(qry.email);
            member.setPassword(qry.password);
            member.setCreated_at(qry.created_at);
            member.setLogin_at(qry.login_at);
            member.setPost_count(qry.post_count);
            member.setRole_id(qry.role_id);
            return member;
        }
        return;
    }

    public function delete(required numeric id) {
        // Implement database delete logic here
        // This is a placeholder, replace with actual database operations
        queryExecute("DELETE FROM members WHERE id = :id", {id: arguments.id});
        return true;
    }
}