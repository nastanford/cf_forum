component displayName="memberDAO" output="false" accessors="true" {

  // Constructor
  function init() {
    return this;
  }

// Method to create a new user
function createMember(required struct member) {
  var passwordHasher = new cfcs.utils.PasswordHasher();
  var hashedPassword = passwordHasher.hashPassword(member.password);

  try {
    var queryResult = queryExecute(
      "INSERT INTO MEMBERS (
        username, 
        email, 
        password,
        created_at,
        login_at,
        post_count,
        role_id
      ) VALUES (
        :username,
        :email,
        :password,
        :created_at,
        :login_at,
        :post_count,
        :role_id
      )",
      {
        username: {value: member.username, cfsqltype: "cf_sql_varchar"},
        email: {value: member.email, cfsqltype: "cf_sql_varchar"},
        password: {value: hashedPassword, cfsqltype: "cf_sql_varchar"},
        created_at: {value: now(), cfsqltype: "cf_sql_timestamp"},
        login_at: {value: now(), cfsqltype: "cf_sql_timestamp"},
        post_count: {value: 0, cfsqltype: "cf_sql_integer"},
        role_id: {value: 1, cfsqltype: "cf_sql_integer"}
      },
      {result: "queryResult", returnGeneratedKeys: true}
    );

    // Retrieve the generated key
    var newMemberID = queryResult.generatedKey;
    
    return newMemberID;
  } catch (any e) {
    // Log the error or handle it as needed
    writeLog(type="error", text="Error in createMember: #e.message#");
    return e.message;
  }
}


/*
function createMember(required struct member) {
  var passwordHasher = new cfcs.utils.PasswordHasher();
  var hashedPassword = passwordHasher.hashPassword(member.password);

  try {
    var queryResult = queryExecute(
      "INSERT INTO MEMBERS (
        username, 
        email, 
        password,
        created_at,
        login_at,
        post_count,
        role_id
      ) VALUES (
        :username,
        :email,
        :password,
        :created_at,
        :login_at,
        :post_count,
        :role_id
      )",
      {
        username: {value: member.username, cfsqltype: "cf_sql_varchar"},
        email: {value: member.email, cfsqltype: "cf_sql_varchar"},
        password: {value: hashedPassword, cfsqltype: "cf_sql_varchar"},
        created_at: {value: now(), cfsqltype: "cf_sql_timestamp"},
        login_at: {value: now(), cfsqltype: "cf_sql_timestamp"},
        post_count: {value: 0, cfsqltype: "cf_sql_integer"},
        role_id: {value: 1, cfsqltype: "cf_sql_integer"}
      },
      {result: "queryResult"}
    );
    // var newMemberID = queryResult.cf_sql_rowcount;
    // var newMemberID = queryResult.GENERATEDKEY;
    // var newMemberID = queryResult.generated_key;
    
    return queryResult.GENERATEDKEY;
  } catch (any e) {
    // Log the error or handle it as needed
    writeLog(type="error", text="Error in createUser: #e.message#");
    return e.message;
  }
}
*/
// Method to update a Member
function updateMember(required struct member, required numeric memberID) {
  try {
    var queryResult = queryExecute(
      "UPDATE MEMBERS 
       SET 
         username = :username,
         email = :email,
         login_at = :login_at
       WHERE 
         id = :memberID",
      {
        username: {value: member.username, cfsqltype: "cf_sql_varchar"},
        email: {value: member.email, cfsqltype: "cf_sql_varchar"},
        login_at: {value: now(), cfsqltype: "cf_sql_timestamp"},
        memberID: {value: memberID, cfsqltype: "cf_sql_integer"}
      },
      {result: "queryResult"}
    );

    return queryResult;
  } catch (any e) {
    // Log the error or handle it as needed
    writeLog(type="error", text="Error in updateMember: #e.message#");
    return 0;
  }
}

// Method to update a member's password
function updateMemberPassword(required struct member, required numeric memberID) {
  var passwordHasher = new cfcs.utils.PasswordHasher();
  var hashedPassword = passwordHasher.hashPassword(member.password);

  try {
    var queryResult = queryExecute(
      "UPDATE MEMBERS 
       SET 
         password = :hashedPassword
       WHERE 
         id = :memberID",
      {
        hashedPassword: {value: hashedPassword, cfsqltype: "cf_sql_varchar"},
        memberID: {value: memberID, cfsqltype: "cf_sql_integer"}
      },
      {result: "queryResult"}
    );

    return queryResult;
  } catch (any e) {
    // Log the error or handle it as needed
    writeLog(type="error", text="Error in updateMemberPassword: #e.message#");
    return 0;
  }
}

 // Method to get a user by ID
  function getMemberByID(required numeric memberID) {
    var member = {};
    
    try {
      var qMember = queryExecute(
      "SELECT id, username, email, created_at, login_at, post_count, role_id 
        FROM MEMBERS 
        WHERE id = :memberID",
        {memberID: {value: memberID, cfsqltype: "cf_sql_integer"}},
        {returntype: "query"}
      );
      
      if (qMember.recordCount == 1) {
        member = {
          id: qMember.id,
          username: qMember.username,
          email: qMember.email,
          createdAt: qMember.created_at,
          loginAt: qMember.login_at,
          postCount: qMember.post_count,
          roleID: qMember.role_id
        };
      }
    } catch (any e) {
      // Log the error
      writeLog(type="error", text="Error in getUserByID: #e.message#");
      rethrow;
    }
    
    return member;
  }


// Method to delete a user
function deleteMember(required numeric memberID) {
  try {
    var queryResult = queryExecute(
      "DELETE FROM MEMBERS 
       WHERE 
         id = :memberID",
      {
        memberID: {value: memberID, cfsqltype: "cf_sql_integer"}
      },
      {result: "queryResult"}
    );

    return queryResult;
  } catch (any e) {
    // Log the error or handle it as needed
    writeLog(type="error", text="Error in deleteUser: #e.message#");
    return 0;
  }
}

}