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
    public int insert(Student student) throws SQLException, ClassNotFoundException {
         String sql = "INSERT into tbl_students(first_name,last_name,email,contact_no,status)"
                + "VALUES(?,?,?,?,?)";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setString(1, student.getFirstName() );
        stmt.setString(2, student.getLastName() );
        stmt.setString(3,student.getEmail() );
        stmt.setString(4,student.getContactNo());
        stmt.setBoolean(5, student.isStatus());
        int result = db.Update();
        db.close();
        return result;
    }

    @Override
    public int update(Student student) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE tbl_students set first_name=?,last_name=?,email=?,contact_no=?,status=?"
                + " where student_id= ?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setString(1, student.getFirstName());
        stmt.setString(2, student.getLastName());
        stmt.setString(3, student.getEmail());
        stmt.setString(4, student.getContactNo());
        stmt.setBoolean(5, student.isStatus());
        stmt.setInt(6, student.getId());
        int result = db.Update();
        db.close();
        return result;
    }

    @Override
    public int delete(int id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE from tbl_students WHERE student_id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        stmt.setInt(1, id);
        int result = db.Update();
        db.close();
        return result;
    }

    @Override
    public List<Student> getAll() throws SQLException, ClassNotFoundException {
        List<Student> studentList = new ArrayList<>();

        String sql = "SELECT * FROM tbl_students";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        ResultSet rs = db.query();
        while (rs.next()) {
            Student s = new Student();
            s.setId(rs.getInt("student_id"));
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            s.setEmail(rs.getString("email"));
            s.setContactNo(rs.getString("contact_no"));
            s.setAddedDate(rs.getDate("added_date"));
            s.setStatus(rs.getBoolean("status"));
            studentList.add(s);

        }
        db.close();
        return studentList;
    }

    @Override
    public Student getById(int id) throws SQLException, ClassNotFoundException {
        Student s = null;
        String sql = "SELECT * FROM tbl_students where student_id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = db.query();
        if (rs.next()) {
            s = new Student();
            s.setId(rs.getInt("student_id"));
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            s.setEmail(rs.getString("email"));
            s.setContactNo(rs.getString("contact_no"));
            s.setAddedDate(rs.getDate("added_date"));
            s.setStatus(rs.getBoolean("status"));
        }
        db.close();
        return s;
    }

}
