package com.finaproject.logistic.model;

import com.finaproject.logistic.entity.Role;
import com.finaproject.logistic.form.UserForm;

import java.util.HashSet;
import java.util.Set;

public class User {
    private long id;
    private String name;
    private String username;
    private double discount;
    private String password;
    private String passwordConfirm;
    private String phoneNumber;
    private String email;
    private Set<Role> roles = new HashSet<>();

    private boolean valid;

    public User() {
    }

    public User(UserForm userForm) {
        this.name = userForm.getName();
        this.username = userForm.getUsername();
        this.password = userForm.getPassword();
        this.passwordConfirm = userForm.getPasswordConfirm();
        this.phoneNumber = userForm.getPhoneNumber();
        this.email = userForm.getEmail();
        this.valid = userForm.isValid();
    }


    public User(String name, String username, String password, String passwordConfirm, String phoneNumber, String email, Set<Role> roles) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.passwordConfirm = passwordConfirm;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.roles = roles;
    }

    public User(com.finaproject.logistic.entity.User userForm) {
        this.name = userForm.getName();
        this.username = userForm.getUsername();
        this.password = userForm.getPassword();
        this.passwordConfirm = userForm.getPasswordConfirm();
        this.phoneNumber = userForm.getPhoneNumber();
        this.email = userForm.getEmail();

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
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
}
