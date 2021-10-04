package com.sliit.util;

import com.sliit.model.Admin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDBUtil {

    private String url = "jdbc:mysql://localhost:3306/oop";
    private String uName = "root";
    private String pwd = "";
    private String driver = "com.mysql.cj.jdbc.Driver";

    public void loadDriver(String driver){
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection(){
        Connection con = null;
        try {
            con = DriverManager.getConnection(url, uName, pwd);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return con;
    }

    public boolean validate(Admin Admin) {
        loadDriver(driver);
        Connection con = getConnection();
        boolean status = false;

        String  sql = "select * from admin where adminUserName=? and adminPassword=?";
        PreparedStatement ps;

        try{
            ps = con.prepareStatement(sql);
            ps.setString(1, Admin.getUsername());
            ps.setString(2,Admin.getPassword());

            ResultSet rs = ps.executeQuery();
            status = rs.next();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return status;
    }
}
