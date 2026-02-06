/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import ear.e;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Emergency;

/**
 *
 * @author plazma
 */
public class EmergencyDAO {

    public int createRequest(Emergency r){
        e c = new e();
        c.connection();
        String sql = "INSERT INTO emergency_requests(request_id, accident_id, responder_type, assigned_to, status, requested_at) VALUES(req_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
        String idSql = "SELECT req_seq.CURRVAL FROM dual"; // get last generated ID
        try(
            PreparedStatement ps = c.conn.prepareStatement(sql);
            PreparedStatement ps2 = c.conn.prepareStatement(idSql))    
                {
            ps.setInt(1, r.getAccidentId());
            ps.setString(2, r.getResponderType());
            ps.setInt(3, r.getAssignedTo());
            ps.setString(4, r.getStatus());
            ps.executeUpdate();
            
        ResultSet rs = ps2.executeQuery();
        if (rs.next()) {
            int requestId = rs.getInt(1);
            r.setRequestId(requestId); // update the object
            return requestId;
        }            

        } catch(Exception e){ e.printStackTrace(); }
        return 0;
    }

    public List<Emergency> getRequestsByResponder(int userId){
        e c = new e();
        c.connection();
        
        List<Emergency> list = new ArrayList<>();
        String sql = "SELECT * FROM emergency_requests WHERE assigned_to=?";
        try(
                
            PreparedStatement ps = c.conn.prepareStatement(sql)){
            ps.setInt(1,userId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Emergency r = new Emergency();
                r.setRequestId(rs.getInt("request_id"));
                r.setAccidentId(rs.getInt("accident_id"));
                r.setResponderType(rs.getString("responder_type"));
                r.setAssignedTo(rs.getInt("assigned_to"));
                r.setStatus(rs.getString("status"));
                r.setResponseTime(rs.getTimestamp("response_time"));
                list.add(r);
            }
        } catch(Exception e){ e.printStackTrace(); }
        return list;
    }

    
    
    
     public List<Emergency> getAllEmergencyAccidents(){
        
        e c = new e();
        c.connection();
        
        List<Emergency> list = new ArrayList<>();
        String sql = "SELECT * FROM emergency_requests";
        try(
            Statement st = c.conn.createStatement();
            ResultSet rs = c.stmt.executeQuery(sql)){
            while(rs.next()){
                Emergency r = new Emergency();
                r.setRequestId(rs.getInt("request_id"));
                r.setAccidentId(rs.getInt("accident_id"));
                r.setResponderType(rs.getString("responder_type"));
                r.setAssignedTo(rs.getInt("assigned_to"));
                r.setStatus(rs.getString("status"));
                r.setResponseTime(rs.getTimestamp("response_time"));
                list.add(r);
            }
        } catch(Exception e){ e.printStackTrace(); }
        return list;
    }   
    
    
    
    public boolean updateRequestStatus(int requestId, String status){
        
        e c = new e();
        c.connection();
        
        String sql = "UPDATE emergency_requests SET status=?, response_time=SYSDATE WHERE request_id=?";
        try(
            PreparedStatement ps = c.conn.prepareStatement(sql)){
            ps.setString(1,status);
            ps.setInt(2,requestId);
            ps.executeUpdate();
            return true;
        } catch(Exception e){ e.printStackTrace(); return false; }
    }    
}
