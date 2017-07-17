/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.thushan;

/**
 *
 * @author TELAN
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Types;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class InsertRecordInDatabase {

    private static final String driverClassName = "org.apache.derby.jdbc.ClientDriver";
    private static final String url = "jdbc:derby://localhost:1527/Hotels";
    private static final String dbUsername = "thushan";
    private static final String dbPassword = "12345";
    
    private static final String insertSql
            = "INSERT INTO HOTEL ("
            + " HOTEL_NAME, "
            + " HOTEL_ADDRESS, "
            + " HOTEL_LOCATION) "
            + "VALUES (?, ?, ?)";

    private static DataSource dataSource;

    public void saveRecord(String HOTEL_NAME, String HOTEL_ADDRESS, String HOTEL_LOCATION) {
        dataSource = getDataSource();
        JdbcTemplate template = new JdbcTemplate(dataSource);
        // define query arguments
        Object[] params = new Object[]{HOTEL_NAME, HOTEL_ADDRESS, HOTEL_LOCATION};
        // define SQL types of the arguments
        int[] types = new int[]{Types.VARCHAR, Types.VARCHAR, Types.VARCHAR};
        // execute insert query to insert the data
        // return number of row / rows processed by the executed query
        int row = template.update(insertSql, params, types);
        System.out.println(row + " row inserted.");
    }

    public static DriverManagerDataSource getDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUrl(url);
        dataSource.setUsername(dbUsername);
        dataSource.setPassword(dbPassword);
        return dataSource;
    }
}
