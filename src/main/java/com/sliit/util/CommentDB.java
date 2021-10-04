package com.sliit.util;


import com.sliit.util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class CommentDB {

    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static void VideoComment(String username, String videoid, String comment, String date){


        try{

            Class.forName("com.mysql.jdbc.Driver");
            con = DB.getDBConnection();
            stmt = con.createStatement();

            String sql = "insert into comment values (?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, forComment.generateCID());
            preparedStatement.setString(2, username);
            preparedStatement.setString(3, videoid);
            preparedStatement.setString(4, comment);
            preparedStatement.setString(5, date);

              preparedStatement.execute();


        }catch (Exception e){
            e.printStackTrace();
        }


    }



}
