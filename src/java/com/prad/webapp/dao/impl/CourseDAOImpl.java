/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.prad.webapp.dao.impl;

import com.prad.webapp.dao.CourseDAO;
import com.prad.webapp.dbutil.DbConnection;
import com.prad.webapp.entity.Course;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author conne
 */
public class CourseDAOImpl implements CourseDAO {
    private DbConnection db=new DbConnection(); 

    @Override
    public int insert(Course t) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Course t) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int id) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Course> getAll() throws SQLException, ClassNotFoundException {
        List<Course> courseList= new ArrayList<>();
        
        String sql="SELECT * FROM tbl_courses";
        db.connect();
        PreparedStatement stmt= db.initStatement(sql);
        ResultSet rs= db.query();
        while(rs.next()){
        Course c=new Course();
        c.setId(rs.getInt("course_id"));
        c.setName(rs.getString("course_name"));
        c.setFees(rs.getInt("course_fees"));
        c.setAdded_date(rs.getDate("added_date"));
        c.setStatus(rs.getBoolean("status"));
        courseList.add(c);
         
        }
        db.close();
        return courseList;
    }

    @Override
    public Course getById(int id) throws SQLException, ClassNotFoundException {
        Course c= null;
        String sql="SELECT * FROM tbl_courses where course_id=?";
         db.connect();
        PreparedStatement stmt= db.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs= db.query();
        if(rs.next()){
        c=new Course();
        c.setId(rs.getInt("course_id"));
        c.setName(rs.getString("course_name"));
        c.setFees(rs.getInt("course_fees"));
        c.setAdded_date(rs.getDate("added_date"));
        c.setStatus(rs.getBoolean("status"));
        
         
        }
        db.close();
        return c;
    }
    
}
