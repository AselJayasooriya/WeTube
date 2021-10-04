package com.sliit.model;

public class Login {

    private String name;
    private String email;
    private String telephone;
    private String username;
    private String password;

    public Login(String name, String username, String email, String telephone, String password) {

        this.name = name;
        this.email = email;
        this.telephone = telephone;
        this.username = username;
        this.password = password;
    }

    @Override
    public String toString() {
        return "Login{" +
                "name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", telephone='" + telephone + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
