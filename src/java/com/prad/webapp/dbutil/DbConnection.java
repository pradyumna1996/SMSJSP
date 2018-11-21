/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.prad.webapp.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author conne
 */
public class DbConnection {
    private Connection conn=null;
    private PreparedStatement stmt=null;

    public void connect() throws ClassNotFoundException,SQLException{
    
      Class.forName("com.mysql.jdbc.Driver");
      conn=DriverManager.getConnection("jdbc:mysql://localhost/cms_full", "root","");    
     }
    
    public PreparedStatement initStatement (String sql) throws SQLException{
    stmt=conn.prepareStatement(sql);
    return stmt;
    }
    //for insert Update Delete
    public int Update() throws SQLException{
    
    return stmt.executeUpdate();
    }
    //for selecting
    public ResultSet query() throws SQLException{
    
    return stmt.executeQuery();
    }
            
    public void close() throws SQLException{
    
    if(conn!=null && !conn.isClosed()){
    conn.close();
    conn=null;
    }
    }
        
}
