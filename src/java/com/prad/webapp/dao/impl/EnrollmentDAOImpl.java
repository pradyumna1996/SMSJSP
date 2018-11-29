/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.prad.webapp.dao.impl;

import com.prad.webapp.dao.EnrollmentDAO;
import com.prad.webapp.dbutil.DbConnection;
import com.prad.webapp.entity.Course;
import com.prad.webapp.entity.Enrollment;
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
public class EnrollmentDAOImpl implements EnrollmentDAO {

    private DbConnection db = new DbConnection();

    @Override
    public int insert(Enrollment e) throws SQLException, ClassNotFoundException {
        db.connect();
        String sql = "INSERT INTO tbl_enrollments(student_id,course_id ,fees,discount,status)"
                + "VALUES(?,?,?,?,?)";
        PreparedStatement stmt= db.initStatement(sql);
        stmt.setInt(1,e.getStudent().getId());
        stmt.setInt(2, e.getCourse().getId());
        stmt.setInt(3, e.getFees());
        stmt.setInt(4, e.getDiscount());
        stmt.setString(5, e.isStatus());
        int result=db.Update();
        db.close();
        return result;
    }

    @Override
    public int update(Enrollment t) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE from tbl_enrollments WHERE enrollment_id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        stmt.setInt(1, id);
        int result = db.Update();
        db.close();
        return result;
    }

    @Override
    public List<Enrollment> getAll() throws SQLException, ClassNotFoundException {
        List<Enrollment> enrollmentList = new ArrayList<>();

        String sql = "SELECT * FROM tbl_enrollments";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        ResultSet rs = db.query();
        while (rs.next()) {
            Enrollment e = new Enrollment();
            e.setId(rs.getInt("enrollment_id"));
            Course course = new Course();
            course.setId(rs.getInt("course_id"));
            e.setCourse(course);
            Student s = new Student();
            s.setId(rs.getInt("student_id"));
            e.setStudent(s);
            e.setEnrollDate(rs.getDate("enroll_date"));
            e.setFees(rs.getInt("fees"));
            e.setDiscount(rs.getInt("discount"));
            e.setStatus(rs.getString("status"));
            enrollmentList.add(e);
        }
        db.close();
        return enrollmentList;
    }

    @Override
    public Enrollment getById(int id) throws SQLException, ClassNotFoundException {
        Enrollment e = null;
        String sql = "SELECT * FROM tbl_enrollments where enrollment_id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = db.query();
        if (rs.next()) {
            e = new Enrollment();
            e.setId(rs.getInt("enrollment_id"));
            Course course = new Course();
            course.setId(rs.getInt("course_id"));
            e.setCourse(course);
            Student s = new Student();
            s.setId(rs.getInt("student_id"));
            e.setStudent(s); 
            e.setFees(rs.getInt("fees"));
            e.setEnrollDate(rs.getDate("enroll_date"));
            e.setDiscount(rs.getInt("discount"));
            e.setStatus(rs.getString("status"));

        }
        db.close();
        return e;
    }

    @Override
    public List<Enrollment> getAllData() throws SQLException, ClassNotFoundException {
 List<Enrollment> enrollmentList = new ArrayList<>();

        String sql = "select c.course_name,s.first_name,s.last_name,(e.fees-((e.discount/100)*e.fees)) as remaining, e.* from tbl_enrollments e "
                + " join tbl_courses c on c.course_id=e.course_id" +
                    " join tbl_students s on s.student_id=e.student_id ";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        ResultSet rs = db.query();
        while (rs.next()) {
            Enrollment e = new Enrollment();
            e.setId(rs.getInt("enrollment_id"));
            Course course = new Course();
            course.setId(rs.getInt("course_id"));
            course.setName(rs.getString("course_name"));
            e.setCourse(course);
            Student s = new Student();
            s.setId(rs.getInt("student_id"));
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            e.setStudent(s);
            e.setFees(rs.getInt("fees"));
            e.setEnrollDate(rs.getDate("enroll_date"));
            e.setDiscount(rs.getInt("discount"));
            e.setStatus(rs.getString("status"));
            e.setRemaining(rs.getInt("remaining"));
            enrollmentList.add(e);
        }
        db.close();
        return enrollmentList;
    } 

}
