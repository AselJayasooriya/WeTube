package com.sliit.model;

public class Comment {

    private String commentid;
    private String username;
    private String videoid;
    private String comment;
    private String date;

    public Comment(String commentid, String username, String videoid, String comment, String date) {
        this.commentid = commentid;
        this.username = username;
        this.videoid = videoid;
        this.comment = comment;
        this.date = date;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentid='" + commentid + '\'' +
                ", username='" + username + '\'' +
                ", videoid='" + videoid + '\'' +
                ", comment='" + comment + '\'' +
                ", date='" + date + '\'' +
                '}';
    }

    public String getCommentid() {
        return commentid;
    }

    public void setCommentid(String commentid) {
        this.commentid = commentid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getVideoid() {
        return videoid;
    }

    public void setVideoid(String videoid) {
        this.videoid = videoid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
