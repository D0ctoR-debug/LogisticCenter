package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.repository.UserDAO;
import com.finaproject.logistic.service.interfaces.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    private UserDAO userDAO;

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @GetMapping("/admin")
    public String adminPage(Model model, @AuthenticationPrincipal UserDetails currentUser) {

        User user = userDAO.findByUsername(currentUser.getUsername());
        model.addAttribute("currentUser", user);
        return "admin/adminPage";

    }

    @GetMapping("/allUsers")
    public String allUsers(Model model) {
        Iterable<User> users = userDAO.findAll();
        model.addAttribute("users", users);
        return "admin/allUsers";
    }
}
