/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import ear.e;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import model.AccidentTracking;
/**
 *
 * @author plazma
 */
public class AccidentTrackingDAO {
        // Add a new tracking record
    public boolean addTracking(int accidentId, Integer requestId, Integer responderId, String responderType, String action) {
        e c = new e(); // your database connection class
        c.connection();

        String sql = "INSERT INTO ACCIDENT_TRACKING(TRACKING_ID, ACCIDENT_ID, REQUEST_ID, RESPONDER_ID, RESPONDER_TYPE, ACTION, ACTION_TIME) "
                   + "VALUES(TRACK_SEQ.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";

        try (PreparedStatement ps = c.conn.prepareStatement(sql)) {
            ps.setInt(1, accidentId);

            if (requestId != null) ps.setInt(2, requestId); else ps.setNull(2, Types.INTEGER);
            if (responderId != null) ps.setInt(3, responderId); else ps.setNull(3, Types.INTEGER);

            if (responderType != null) ps.setString(4, responderType); else ps.setNull(4, Types.VARCHAR);

            ps.setString(5, action);

            ps.executeUpdate();
            return true;
        } catch (Exception e1) {
            e1.printStackTrace();
            return false;
        }
    }

    // Get all tracking records for a specific accident
    public List<AccidentTracking> getTrackingByAccident(int accidentId) {
        List<AccidentTracking> list = new ArrayList<>();
        e c = new e();
        c.connection();

        String sql = "SELECT TRACKING_ID, ACCIDENT_ID, REQUEST_ID, RESPONDER_ID, RESPONDER_TYPE, ACTION, ACTION_TIME "
                   + "FROM ACCIDENT_TRACKING WHERE ACCIDENT_ID = ? ORDER BY TRACKING_ID ASC";

        try (PreparedStatement ps = c.conn.prepareStatement(sql)) {
            ps.setInt(1, accidentId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccidentTracking at = new AccidentTracking();
                at.setTrackingId(rs.getInt("TRACKING_ID"));
                at.setAccidentId(rs.getInt("ACCIDENT_ID"));
                at.setRequestId(rs.getInt("REQUEST_ID"));
                at.setResponderId(rs.getInt("RESPONDER_ID"));
                at.setResponderType(rs.getString("RESPONDER_TYPE"));
                at.setAction(rs.getString("ACTION"));
                at.setActionTime(rs.getTimestamp("ACTION_TIME"));
                list.add(at);
            }
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        return list;
    }
}
