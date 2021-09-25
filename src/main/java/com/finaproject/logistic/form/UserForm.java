package com.finaproject.logistic.form;

import com.finaproject.logistic.controller.annotation.UniqueLogin;
import com.finaproject.logistic.model.User;

public class UserForm {
    private String name;
    @UniqueLogin
    private String username;
    private String password;
    private String passwordConfirm;
    private String phoneNumber;
    private String email;

    public boolean valid;

    public UserForm() {

    }

    public UserForm(User userInfo) {
        if (userInfo!=null) {
            this.name = userInfo.getName();
            this.username = userInfo.getUsername();
            this.password = userInfo.getPassword();
            this.passwordConfirm=userInfo.getPasswordConfirm();
            this.phoneNumber = userInfo.getPhoneNumber();
            this.email = userInfo.getEmail();
        }
    }
    public UserForm(com.finaproject.logistic.entity.User userInfo) {
        if (userInfo!=null) {
            this.name = userInfo.getName();
            this.username = userInfo.getUsername();
            this.password = userInfo.getPassword();
            this.passwordConfirm=userInfo.getPasswordConfirm();
            this.phoneNumber = userInfo.getPhoneNumber();
            this.email = userInfo.getEmail();
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }
}
