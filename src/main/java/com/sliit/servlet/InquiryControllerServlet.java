package com.sliit.servlet;

import com.sliit.model.Inquiry;
import com.sliit.service.InquiryServiceInterface;
import com.sliit.util.InquiryDBUtil;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "InquiryControllerServlet", value = "/InquiryControllerServlet")
public class InquiryControllerServlet extends HttpServlet implements InquiryServiceInterface {

    private InquiryDBUtil inquiryDBUtil;

    @Resource(name = "jdbc/oop")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        super.init();

        try {
            inquiryDBUtil = new InquiryDBUtil(dataSource);
        }
        catch (Exception e){
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //reading the command parameter
            String theCommand = request.getParameter("command");

            //if the command is missing, default shows the list of inquiries
            if (theCommand == null) {
                theCommand = "LIST";
            }

            //routing the parameter obtained to tha correct appropriate method
            switch (theCommand) {
                case "LIST":
                    listInquiries(request, response);
                    break;

                case "ADD":
                    addInquiry(request, response);
                    break;

                case "LOAD":
                    loadInquiry(request,response);
                    break;

                case "UPDATE":
                    updateInquiry(request, response);
                    break;

                case "DELETE":
                    deleteInquiry(request,response);
                    break;

                case "FORUM":
                    forumInquiries(request, response);

                default:
                    listInquiries(request, response);
            }
        }
        catch (Exception e){
            throw new ServletException(e);
        }
    }

    public void addInquiry(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //read inq. information from form
        String name = request.getParameter("iName");
        String email = request.getParameter("iEmail");
        String inquiry = request.getParameter("iMessage");

        //create a new inquiry object
        Inquiry theInquiry = new Inquiry(name, email, inquiry);

        //add the inquiry to DB
        inquiryDBUtil.addInquiry(theInquiry);

        //send back to jsp
        //forumInquiries(request,response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/inquiry.jsp");
        dispatcher.forward(request,response);
    }

    public void deleteInquiry(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //read inq. id from form
        String theInquiryId = request.getParameter("inquiryId");

        //delete inquiry from DB
        inquiryDBUtil.deleteInquiry(theInquiryId);

        //send it back to jsp
        listInquiries(request,response);


    }

    public void updateInquiry(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //read the data from form
        int id = Integer.parseInt(request.getParameter("inquiryId"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String inquiry = request.getParameter("inquiry");
        String reply = request.getParameter("reply");

        //create a new inq. object
        Inquiry theInquiry = new Inquiry(id, name, email, inquiry, reply);

        //perform update
        inquiryDBUtil.updateInquiry(theInquiry);

        //send the updated data to display
        listInquiries(request, response);
    }

    public void loadInquiry(HttpServletRequest request, HttpServletResponse response) throws Exception{
        //read inq. id
        String theInquiryId = request.getParameter("inquiryId");

        //get inq. from DB
        Inquiry theInquiry = inquiryDBUtil.getInquiry(theInquiryId);

        //place inq. in request attribute
        request.setAttribute("THE_INQUIRY", theInquiry);

        //send to jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/updateReplyForm.jsp");
        dispatcher.forward(request,response);
    }

    public void listInquiries(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //get the inquiries from util class
        List<Inquiry> inquiries = inquiryDBUtil.getInquiries();

        //add the inquiries to the request
        request.setAttribute("INQUIRY_LIST", inquiries);

        //send to page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/adminAccount.jsp");
        dispatcher.forward(request, response);
    }

    public void forumInquiries(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //get the inquiries from util class
        List<Inquiry> inquiriesForum = inquiryDBUtil.getInquiries();

        //add the inquiries to the request
        request.setAttribute("FORUM_LIST", inquiriesForum);

        //send to page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/forum.jsp");
        dispatcher.forward(request, response);
    }

}
