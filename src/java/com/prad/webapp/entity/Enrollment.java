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
public class Enrollment {

    private int id;
    private Course course;
    private Student student;
    private int fees;
    private int discount;
    private Date enrollDate;
    private int remaining;
    private String status;

    public Enrollment() {
    }

    public Enrollment(int id) {
        this.id = id;
    }

    public Enrollment(int id, Course course, Student student, int fees, int discount, String status) {
        this.id = id;
        this.course = course;
        this.student = student;
        this.fees = fees;
        this.discount = discount;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getFees() {
        return fees;
    }

    public void setFees(int fees) {
        this.fees = fees;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public Date getEnrollDate() {
        return enrollDate;
    }

    public void setEnrollDate(Date enrollDate) {
        this.enrollDate = enrollDate;
    }

    public String isStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRemaining() {
        return remaining;
    }

    public void setRemaining(int remaining) {
        this.remaining = remaining;
    }

}
