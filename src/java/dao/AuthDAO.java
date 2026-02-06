package dao;

import model.User;
import ear.e;

import java.sql.*;

public class AuthDAO {

    // 🔹 Get user by email
    public static User getByEmail(String email) throws Exception {
        e c = new e();
        c.connection();

        PreparedStatement ps = c.conn.prepareStatement(
            "SELECT * FROM EARS_USERS WHERE EMAIL=?"
        );
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();

        User u = null;
        if (rs.next()) {
            u = new User();
            u.setUserId(rs.getInt("USER_ID"));  
            u.setFullName(rs.getString("FULL_NAME"));
            u.setPasswordHash(rs.getString("PASSWORD_HASH"));
            u.setRole(rs.getString("ROLE"));
            u.setStatus(rs.getString("STATUS"));
            u.setFailedAttempts(rs.getInt("FAILED_ATTEMPTS"));
            Timestamp ts = rs.getTimestamp("LAST_FAILED_AT");
            if (ts != null)
                u.setLastFailedAt(ts.toLocalDateTime().toString());
        }

        rs.close();
        ps.close();
        c.conn.close();
        return u;
    }

    // 🔹 Save user
    public static void save(User u) throws Exception {
        e c = new e();
        c.connection();

        PreparedStatement ps = c.conn.prepareStatement(
            "INSERT INTO EARS_USERS (" +
            "USER_ID, FULL_NAME, EMAIL, PASSWORD_HASH, ROLE, STATUS, FAILED_ATTEMPTS, CREATED_AT" +
            ") VALUES (" +
            "USERS_SEQ.NEXTVAL, ?, ?, ?, ?, 'ACTIVE', 0, SYSDATE" +
            ")"
        );

        ps.setString(1, u.getFullName());
        ps.setString(2, u.getEmail());
        ps.setString(3, u.getPasswordHash());
        ps.setString(4, u.getRole());

        ps.executeUpdate();
        ps.close();
        c.conn.close();
    }

    // 🔹 Increment failed attempts
public static void incrementFail(int userId) throws Exception {
    e c = new e();
    c.connection();

    PreparedStatement ps = c.conn.prepareStatement(
        "UPDATE EARS_USERS SET FAILED_ATTEMPTS = FAILED_ATTEMPTS + 1, LAST_FAILED_AT = ? WHERE USER_ID=?"
    );
    ps.setTimestamp(1, java.sql.Timestamp.valueOf(java.time.LocalDateTime.now()));
    ps.setInt(2, userId);
    ps.executeUpdate();

    ps.close();
    c.conn.close();
}

    /// Reset failed attempts
    public static void resetFail(int userId) throws Exception {
        e c = new e();
        c.connection();

        PreparedStatement ps = c.conn.prepareStatement(
            "UPDATE EARS_USERS SET FAILED_ATTEMPTS = 0, LAST_FAILED_AT = NULL, STATUS='ACTIVE' WHERE USER_ID=?"
        );
        ps.setInt(1, userId);
        ps.executeUpdate();
        
        c.conn.commit();   // 🔥 REQUIRED
        ps.close();
        c.conn.close();
    }

    // Lock account
    public static void lock(int userId) throws Exception {
        e c = new e();
        c.connection();

        PreparedStatement ps = c.conn.prepareStatement(
            "UPDATE EARS_USERS SET STATUS='BLOCKED' WHERE USER_ID=?"
        );
        ps.setInt(1, userId);
        ps.executeUpdate();

        ps.close();
        c.conn.close();
    }
    
    
}