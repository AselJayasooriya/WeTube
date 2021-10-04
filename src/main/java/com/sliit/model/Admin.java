package com.sliit.model;

public class Admin {
    private int id;
    private String username;
    private String fName;
    private String lName;
    private String password;

    public Admin() {
        super();
    }

    public Admin(int id, String username, String fName, String lName, String password) {
        this.id = id;
        this.username = username;
        this.fName = fName;
        this.lName = lName;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getfName() {
        return fName;
    }

    public String getlName() {
        return lName;
    }

    public String getPassword() {
        return password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
