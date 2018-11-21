/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.prad.webapp.entity;

import java.util.Date;

/**
 *
 * @author conne
 */
public class Payment {
   private int id;
   private Enrollment enrollment;
   private int paymentAmount;
   private Date paymentDate;

    public Payment() {
    }

    public Payment(int id, Enrollment enrollment, int paymentAmount) {
        this.id = id;
        this.enrollment = enrollment;
        this.paymentAmount = paymentAmount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Enrollment getEnrollment() {
        return enrollment;
    }

    public void setEnrollment(Enrollment enrollment) {
        this.enrollment = enrollment;
    }

    public int getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(int paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }
   
   
   
    
    
}
