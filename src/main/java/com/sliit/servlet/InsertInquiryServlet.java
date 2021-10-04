package com.sliit.servlet;

import com.sliit.util.InquiryDBUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "InsertInquiryServlet", value = "/InsertInquiryServlet")
public class InsertInquiryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("iName");
        String email = request.getParameter("iEmail");
        String inquiry = request.getParameter("iMessage");


            boolean outp;
            outp = InquiryDBUtil.insertInquiry(name, email, inquiry);

        if(outp == true){
            RequestDispatcher dis = request.getRequestDispatcher("./forum.jsp");
            dis.forward(request, response);
        }
        else{
            RequestDispatcher dis2 = request.getRequestDispatcher("./inquiry.jsp");
            dis2.forward(request, response);
        }
    }
}
