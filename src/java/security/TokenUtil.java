package security;

import java.util.Base64;

public class TokenUtil {

    public static String generateToken(int userId, String role) {
        String data = userId + ":" + role + ":" + System.currentTimeMillis();
        return Base64.getEncoder().encodeToString(data.getBytes());
    }

    public static boolean validateToken(String token) {
        try {
            Base64.getDecoder().decode(token);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static String getRole(String token) {
        String decoded = new String(Base64.getDecoder().decode(token));
        return decoded.split(":")[1];
    }
}
