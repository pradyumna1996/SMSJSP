/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.prad.webapp.dao.impl;

import com.prad.webapp.dao.PaymentDAO;
import com.prad.webapp.dbutil.DbConnection;
import com.prad.webapp.entity.Enrollment;
import com.prad.webapp.entity.Payment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author conne
 */
public class PaymentDAOImpl implements PaymentDAO {

    private DbConnection db = new DbConnection();

    @Override
    public int insert(Payment payment) throws SQLException, ClassNotFoundException {
        String sql = "INSERT into tbl_payments(enrollment_id,amount)"
                + " VALUES(?,?)";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setInt(1, payment.getEnrollment().getId());
        stmt.setInt(2, payment.getPaymentAmount());
        
        int result = db.Update();
        db.close();
        return result;
    }

    @Override
    public int update(Payment payment) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE tbl_payments set enrollment_id=?, amount=? "
                + "WHERE payment_id= ?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setInt(1, payment.getEnrollment().getId());
        stmt.setInt(2, payment.getPaymentAmount());
        stmt.setInt(3, payment.getId() );
        int result = db.Update();
        db.close();
        return result;
    }

    @Override
    public int delete(int id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE from tbl_payments WHERE payment_id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);

        stmt.setInt(1, id);
        int result = db.Update();
        db.close();
        return result;
    }

    @Override
    public List<Payment> getAll() throws SQLException, ClassNotFoundException {
        List<Payment> paymentList = new ArrayList<>();
        String sql = "select payment_id , enrollment_id , payment_date ,amount  from tbl_payments ";

        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        ResultSet rs = db.query();
        while (rs.next()) {
            Payment p = new Payment();
            p.setId(rs.getInt("payment_id"));
            Enrollment enrollment = new Enrollment();
            enrollment.setId(rs.getInt("enrollment_id"));
            p.setEnrollment(enrollment);

            p.setPaymentDate(rs.getDate("payment_date"));

            p.setPaymentAmount(rs.getInt("amount"));
            paymentList.add(p);

        }
        db.close();
        return paymentList;

    }

    @Override
    public Payment getById(int id) throws SQLException, ClassNotFoundException {
        Payment p = null;
        String sql = "SELECT * FROM tbl_payments where payment_id=?";
        db.connect();
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = db.query();
        if (rs.next()) {
            p = new Payment();
            p.setId(rs.getInt("payment_id"));
            Enrollment enrollment = new Enrollment();
            enrollment.setId(rs.getInt("enrollment_id"));
            p.setEnrollment(enrollment);
            p.setPaymentDate(rs.getDate("payment_date"));
            p.setPaymentAmount(rs.getInt("amount"));
        }
        db.close();
        return p;
    }

}
