package com.sliit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface InquiryServiceInterface {
    public void addInquiry(HttpServletRequest request, HttpServletResponse response) throws Exception;
    public void deleteInquiry(HttpServletRequest request, HttpServletResponse response) throws Exception;
    public void updateInquiry(HttpServletRequest request, HttpServletResponse response) throws Exception;
    public void loadInquiry(HttpServletRequest request, HttpServletResponse response) throws Exception;
    public void listInquiries(HttpServletRequest request, HttpServletResponse response) throws Exception;
    public void forumInquiries(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
