package dao;

import model.User;
import ear.e;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    // Fetch all users
    public static List<User> getAllUsers() throws Exception {
        e c = new e();
        c.connection();

        List<User> users = new ArrayList<>();
        try (Statement stmt = c.conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM EARS_USERS ORDER BY USER_ID")) {

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("USER_ID"));
                u.setFullName(rs.getString("FULL_NAME"));
                u.setEmail(rs.getString("EMAIL"));
                u.setRole(rs.getString("ROLE"));
                u.setStatus(rs.getString("STATUS"));
                u.setFailedAttempts(rs.getInt("FAILED_ATTEMPTS"));
                Timestamp ts = rs.getTimestamp("LAST_FAILED_AT");
                if (ts != null) u.setLastFailedAt(ts.toLocalDateTime().toString());
                users.add(u);
            }
        } finally {
            c.conn.close();
        }
        return users;
    }

    // Update user
    public static void updateUser(int userId, String fullName, String email, String role) throws Exception {
        e c = new e();
        c.connection();
        try (PreparedStatement ps = c.conn.prepareStatement(
                "UPDATE EARS_USERS SET FULL_NAME=?, EMAIL=?, ROLE=? WHERE USER_ID=?")) {
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, role);
            ps.setInt(4, userId);
            ps.executeUpdate();
        } finally {
            c.conn.close();
        }
    }

    // Delete user
    public static void deleteUser(int userId) throws Exception {
        e c = new e();
        c.connection();
        try (PreparedStatement ps = c.conn.prepareStatement(
                "DELETE FROM EARS_USERS WHERE USER_ID=?")) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        } finally {
            c.conn.close();
        }
    }

    // Unblock user
    public static void resetFail(int userId) throws Exception {
        e c = new e();
        c.connection();
        try (PreparedStatement ps = c.conn.prepareStatement(
                "UPDATE EARS_USERS SET FAILED_ATTEMPTS=0, STATUS='ACTIVE' WHERE USER_ID=?")) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        } finally {
            c.conn.close();
        }
    }
}
