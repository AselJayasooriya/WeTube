package com.sliit.util;

import com.sliit.model.Login;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class userDB {
    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;



    public static boolean registerUser(String name, String username, String email, String telephone, String password){
        boolean isSuccess = false;

        try{
            //create db connection

            Class.forName("com.mysql.jdbc.Driver");
            con = DB.getDBConnection();
            stmt = con.createStatement();

            String sql = "insert into user values ( ?, ?, ?, ?, ?)";
            // String sql = "insert into user values (name, '"+username+"', '"+email+"', '"+phone+"', '"+password+"' )";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, username);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, telephone);
            preparedStatement.setString(5, password);

           int rs = preparedStatement.executeUpdate();


             if (rs > 0){
                 isSuccess = true;
             }else {
                 isSuccess = false;
             }


        }catch (Exception e){
            e.printStackTrace();
        }

        return isSuccess;

    }
    public static boolean Validate(String username, String password){

        //ArrayList<Login> log = new ArrayList<>();

        //create database connection
        String url = "jdbc:mysql://localhost:3306/oop";
        String user = "root";
        String psw = "";

        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, psw);
            stmt = con.createStatement();

            String sql = "Select * from user where username=? and password=?";


            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            rs = preparedStatement.executeQuery();

            if(rs.next()){
                isSuccess = true;
            }else {
                isSuccess = false;
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return isSuccess;

    }
    public static Login getUser(String username){

        Login login = null;
        String url = "jdbc:mysql://localhost:3306/oop";
        String user = "root";
        String psw = "";

        try{
            con = DriverManager.getConnection(url, user, psw);
            stmt = con.createStatement();
            String sql = "select * from user where username=? ";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1,username);
            rs = preparedStatement.executeQuery();

            if(rs.next()){
                String name = rs.getString(1);
                 username = rs.getString(2);
                 String email = rs.getString(3);
                 String telephone = rs.getString(4);
                 String password = rs.getString(5);

                login = new Login(name, username, email, telephone, password);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return login;
    }

    public static boolean updateUser(String name, String username, String email, String telephone){
        try {

            con = DB.getDBConnection();
            stmt = con.createStatement();

            String sql = "update user set name=?, username=?, email=?, telephone=?" + "where username=?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,username);
            preparedStatement.setString(3,email);
            preparedStatement.setString(4,telephone);
            preparedStatement.setString(5,username);

            int rs = preparedStatement.executeUpdate();

            if(rs>0){
                isSuccess = true;
            }else{
                isSuccess = false;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return isSuccess;
    }

    public static boolean deleteUser(String username){
        try {

            con = DB.getDBConnection();
            stmt = con.createStatement();
            String sql = "delete from user where username=?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, username);

            int rs = preparedStatement.executeUpdate();
            if(rs>0){
                isSuccess = true;
            }else {
                isSuccess = false;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return isSuccess;
    }

    public static boolean resetPassword(String username, String password){
        try {

            con = DB.getDBConnection();
            stmt = con.createStatement();
            String sql = "update user set password=? "+" where username=?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, password);
            preparedStatement.setString(2,username);

            int rs = preparedStatement.executeUpdate();
            if(rs>0){
                isSuccess = true;
            }else {
                isSuccess = false;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return isSuccess;
    }

}
