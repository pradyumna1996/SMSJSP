/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.prad.webapp.dao;

import com.prad.webapp.entity.Enrollment;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author conne
 */
public interface EnrollmentDAO extends GenericDAO<Enrollment> {
    List<Enrollment> getAllData() throws SQLException,ClassNotFoundException;
    
}
