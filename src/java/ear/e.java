/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ear;

/**
 *
 * @author plazma
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class e {
 public Statement stmt;
      public Connection conn;
      
 public void connection() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            this.conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sms", "s");
            this.stmt = (Statement) this.conn.createStatement();
        }
        catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }    
}
