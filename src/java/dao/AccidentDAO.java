/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import model.Accident;
import ear.e;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author plazma
 */
public class AccidentDAO {    
    public int saveAccident(Accident a) {
        
        e c = new e();
        c.connection();
        
        
        String sql = "INSERT INTO accidents(accident_id, user_id, latitude, longitude, severity, status, accident_time, description) VALUES(acc_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE, ?)";
        String idSql = "SELECT acc_seq.CURRVAL FROM dual";
        try(
                
            PreparedStatement ps = c.conn.prepareStatement(sql);
            PreparedStatement ps2 = c.conn.prepareStatement(idSql)    
                ){
            ps.setInt(1, a.getUserId());
            ps.setDouble(2, a.getLatitude());
            ps.setDouble(3, a.getLongitude());
            ps.setString(4, a.getSeverity());
            ps.setString(5, a.getStatus());
            ps.setString(6, a.getDescription());
            ps.executeUpdate();
            

        ResultSet rs = ps2.executeQuery();
        if (rs.next()) {
            return rs.getInt(1); // ✅ accident_id
        }
        
        } catch(Exception e) { e.printStackTrace();}
        return 0;
    }
    
    
    public List<Accident> getAllAccidents(){
        
        e c = new e();
        c.connection();
        
        List<Accident> list = new ArrayList<>();
        String sql = "SELECT accident_id, user_id, latitude, longitude, severity, status, accident_time FROM accidents";
        try(
            Statement st = c.conn.createStatement();
            ResultSet rs = c.stmt.executeQuery(sql)){
            while(rs.next()){
                Accident a = new Accident();
                a.setAccidentId(rs.getInt("accident_id"));
                a.setUserId(rs.getInt("user_id"));
                a.setLatitude(rs.getDouble("latitude"));
                a.setLongitude(rs.getDouble("longitude"));
                a.setSeverity(rs.getString("severity"));
                a.setStatus(rs.getString("status"));
                list.add(a);
            }
        } catch(Exception e){ e.printStackTrace(); }
        return list;
    }
    
    
public List<Accident> getAccidentsByStatus(String status) {
    List<Accident> list = new ArrayList<>();
    e c = new e();
    c.connection();

    String sql = "SELECT accident_id, user_id, latitude, longitude, severity, status, accident_time, description "
               + "FROM accidents WHERE status = ?";
    try (PreparedStatement ps = c.conn.prepareStatement(sql)) {
        ps.setString(1, status);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Accident a = new Accident();
            a.setAccidentId(rs.getInt("accident_id"));
            a.setUserId(rs.getInt("user_id"));
            a.setLatitude(rs.getDouble("latitude"));
            a.setLongitude(rs.getDouble("longitude"));
            a.setSeverity(rs.getString("severity"));
            a.setStatus(rs.getString("status"));
            a.setDescription(rs.getString("description"));
            list.add(a);
        }
    } catch(Exception e) { e.printStackTrace(); }
    return list;
}    




public int countByStatus(String status) {

    e c = new e();
    c.connection();

    String sql = "SELECT COUNT(*) FROM accidents WHERE status = ?";

    try (PreparedStatement ps = c.conn.prepareStatement(sql)) {
        ps.setString(1, status);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return 0;
}



public int totalaccident(){
    
    e c=new e();
    c.connection();
    
    String sql="SELECT COUNT(*) FROM accidents";
    try (PreparedStatement ps = c.conn.prepareStatement(sql)) {
                        
      ResultSet rs = ps.executeQuery();
      
      if (rs.next()){
          return rs.getInt(1);
      }

    } catch (Exception e) {
        e.printStackTrace();
    }    
    
    return 0;
}

    
    

    public void updateStatus(int accId, String status){
        
        e c = new e();
        c.connection();
        
        
        String sql = "UPDATE accidents SET status=? WHERE accident_id=?";
        try(
            PreparedStatement ps = c.conn.prepareStatement(sql)){
            ps.setString(1, status);
            ps.setInt(2, accId);
            ps.executeUpdate();
        } catch(Exception e){ e.printStackTrace(); }
    }
}
