/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.prad.webapp.dao.impl;

import com.prad.webapp.dao.StudentDAO;
import com.prad.webapp.dbutil.DbConnection;
import com.prad.webapp.entity.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author conne
 */
public class StudentDAOImpl implements StudentDAO {

    private DbConnection db = new DbConnection();

    @Override
    public int insert(Student t) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Student t) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int id) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Student> getAll() throws SQLException, ClassNotFoundException {
        List<Student> studentList = new ArrayList<>();

        String sql = "SELECT * FROM tbl_students";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        ResultSet rs = db.query();
        while (rs.next()) {
            Student c = new Student();
            c.setId(rs.getInt("student_id"));
            c.setFirstName(rs.getString("first_name"));
            c.setLastName(rs.getString("last_name"));
            c.setEmail(rs.getString("email"));
            c.setAddedDate(rs.getDate("added_date"));
            c.setStatus(rs.getBoolean("status"));
            studentList.add(c);

        }
        db.close();
        return studentList;
    }

    @Override
    public Student getById(int id) throws SQLException, ClassNotFoundException {
        Student c = null;
        String sql = "SELECT * FROM tbl_courses where student_id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = db.query();
        if (rs.next()) {
            c = new Student();
            c.setId(rs.getInt("student_id"));
            c.setFirstName(rs.getString("first_name"));
            c.setLastName(rs.getString("last_name"));
            c.setEmail(rs.getString("email"));
            c.setAddedDate(rs.getDate("added_date"));
            c.setStatus(rs.getBoolean("status"));

        }
        db.close();
        return c;
    }

}
