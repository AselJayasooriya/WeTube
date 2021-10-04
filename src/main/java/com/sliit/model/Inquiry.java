package com.sliit.model;

public class Inquiry {
    private int inquiryId;
    private String iUserName;
    private String iUserEmail;
    private String inquiry;
    private String iReply;

    public Inquiry() {

    }

    public Inquiry(int inquiryId, String iUserName, String iUserEmail, String inquiry, String iReply) {
        this.inquiryId = inquiryId;
        this.iUserName = iUserName;
        this.iUserEmail = iUserEmail;
        this.inquiry = inquiry;
        this.iReply = iReply;
    }

    public Inquiry(String iUserName, String iUserEmail, String inquiry, String iReply) {
        this.iUserName = iUserName;
        this.iUserEmail = iUserEmail;
        this.inquiry = inquiry;
        this.iReply = iReply;
    }

    public Inquiry(int inquiryId, String iUserName, String inquiry, String iReply) {
        this.inquiryId = inquiryId;
        this.iUserName = iUserName;
        this.inquiry = inquiry;
        this.iReply = iReply;
    }

    public Inquiry(String iUserName, String iUserEmail, String inquiry) {
        this.iUserName = iUserName;
        this.iUserEmail = iUserEmail;
        this.inquiry = inquiry;
    }

    public int getInquiryId() {
        return inquiryId;
    }

    public void setInquiryId(int inquiryId) {
        this.inquiryId = inquiryId;
    }

    public String getiUserName() {
        return iUserName;
    }

    public void setiUserName(String iUserName) {
        this.iUserName = iUserName;
    }

    public String getiUserEmail() {
        return iUserEmail;
    }

    public void setiUserEmail(String iUserEmail) {
        this.iUserEmail = iUserEmail;
    }

    public String getInquiry() {
        return inquiry;
    }

    public void setInquiry(String inquiry) {
        this.inquiry = inquiry;
    }

    public String getiReply() {
        return iReply;
    }

    public void setiReply(String iReply) {
        this.iReply = iReply;
    }

    @Override
    public String toString() {
        return "Inquiry{" +
                "inquiryId=" + inquiryId +
                ", iUserName='" + iUserName + '\'' +
                ", iUserEmail='" + iUserEmail + '\'' +
                ", inquiry='" + inquiry + '\'' +
                ", iReply='" + iReply + '\'' +
                '}';
    }
}
