package com.sliit.util;


import com.sliit.model.Inquiry;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InquiryDBUtil {

    private DataSource dataSource;

    public InquiryDBUtil(DataSource theDataSource) {
        dataSource = theDataSource;
    }

    public List<Inquiry> getInquiries() throws Exception {
        List<Inquiry> inquiries = new ArrayList<>();
        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;


        try {
            //get the connection
            myConn = dataSource.getConnection();

            //create sql
            String sql = "select * from customerinquiry";
            myStmt = myConn.createStatement();

            //execute query
            myRs = myStmt.executeQuery(sql);

            //process result set
            while (myRs.next()) {
                //get the data from the resultset
                int inqNo = myRs.getInt("inquiryNo");
                String name = myRs.getString("iname");
                String email = myRs.getString("iemail");
                String inquiry = myRs.getString("inquiry");
                String reply = myRs.getString("reply");

                //create new inquiry obj.
                Inquiry tempInquiry = new Inquiry(inqNo, name, email, inquiry, reply);

                //add to list
                inquiries.add(tempInquiry);
            }
            return inquiries;
        } finally {
            //close the JDBC object (as good coding practice)
            close(myConn, myStmt, myRs);
        }

    }

    private void close(Connection myConn, Statement myStmt, ResultSet myRs) {

        try {
            if (myRs != null) {
                myRs.close();
            }

            if (myStmt != null) {
                myStmt.close();
            }

            if (myConn != null) {
                myConn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean insertInquiry(String name, String email, String message) {
        boolean success = false;

        String url = "jdbc:mysql://localhost:3306/oop";
        String uName = "root";
        String pwd = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, uName, pwd);
            Statement stmnt = conn.createStatement();

            String sql = "insert into customerinquiry values (0, '" + name + "', '" + email + "', '" + message + "', null )";

            int res = stmnt.executeUpdate(sql);

            if (res > 0) {
                success = true;
            } else {
                success = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public Inquiry getInquiry(String theInquiryId) throws Exception {
        Inquiry theInquiry = null;

        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        int inquiryId;

        try {
            //convert inq. id to int
            inquiryId = Integer.parseInt(theInquiryId);

            //get connection to DB
            myConn = dataSource.getConnection();

            //create sql to get selected student
            String sql = "select * from customerinquiry where inquiryNo = ?";

            //create prepared statement
            myStmt = myConn.prepareStatement(sql);

            //set parameters
            myStmt.setInt(1, inquiryId);

            //exec query
            myRs = myStmt.executeQuery();

            //get the data from the rs
            if (myRs.next()) {
                String name = myRs.getString("iname");
                String email = myRs.getString("iemail");
                String inquiry = myRs.getString("inquiry");
                String reply = myRs.getString("reply");

                //object creation using the obtained data
                theInquiry = new Inquiry(inquiryId, name, email, inquiry, reply);
            } else {
                throw new Exception("Inquiry No. not found : " + inquiryId);
            }

            return theInquiry;
        } finally {
            //cleanup JDBC objects
            close(myConn, myStmt, myRs);
        }
    }

    public void updateInquiry(Inquiry theInquiry) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            //DB access
            myConn = dataSource.getConnection();

            //create update SQL
            String sql = "update customerinquiry set iname = ?, iemail = ?, inquiry = ?, reply = ? where inquiryNo = ?";

            //prep statement
            myStmt = myConn.prepareStatement(sql);

            //set parameters
            myStmt.setString(1, theInquiry.getiUserName());
            myStmt.setString(2, theInquiry.getiUserEmail());
            myStmt.setString(3, theInquiry.getInquiry());
            myStmt.setString(4, theInquiry.getiReply());
            myStmt.setInt(5, theInquiry.getInquiryId());

            //exec sql
            myStmt.execute();
        }
        finally {
            //cleaninup JDBC objects
            close(myConn, myStmt, null);
        }
    }

    public void deleteInquiry(String theInquiryId) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            //convert inq. id to int
            int inquiryId = Integer.parseInt(theInquiryId);

            //get connection to DB
            myConn = dataSource.getConnection();

            //create sql to delete
            String sql = "delete from customerinquiry where inquiryNo = ?";

            //prepare the satement
            myStmt = myConn.prepareStatement(sql);

            //setting up the parameters
            myStmt.setInt(1, inquiryId);

            //exec. the sql
            myStmt.execute();
        }
        finally {
            //cleanup JDBC code
            close(myConn, myStmt, null);

        }
    }

    public void addInquiry(Inquiry theInquiry) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            //get connection
            myConn = dataSource.getConnection();

            //create sql for insert
            String sql = "insert into customerinquiry (iname, iemail, inquiry) values (?, ?, ?)";

            //set prepared statement
            myStmt = myConn.prepareStatement(sql);

            //set the parameter values for inq,
            myStmt.setString(1, theInquiry.getiUserName());
            myStmt.setString(2, theInquiry.getiUserEmail());
            myStmt.setString(3, theInquiry.getInquiry());

            //execute sql
            myStmt.execute();
        }
        finally {
            //cleanup the JDBC objects
            close(myConn, myStmt, null);
        }

    }
}
