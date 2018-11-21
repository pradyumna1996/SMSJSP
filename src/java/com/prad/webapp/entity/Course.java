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
public class Course {
    private int id;
    private String name;
    private int fees;
    private Date added_date;
    private boolean status;

    public Course() {
    }
    
    public Course(int id){
    this.id=id;
    }
    
    public Course(int id, String name, int fees, boolean status) {
        this.id = id;
        this.name = name;
        this.fees = fees;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getFees() {
        return fees;
    }

    public void setFees(int fees) {
        this.fees = fees;
    }

    public Date getAdded_date() {
        return added_date;
    }

    public void setAdded_date(Date added_date) {
        this.added_date = added_date;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
    
}
