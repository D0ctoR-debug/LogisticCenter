package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.User;
//import com.finaproject.logistic.model.Basket;
//import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.form.UserForm;
import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.service.UserServiceImpl;
import com.finaproject.logistic.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RegistrationController {

    private UserServiceImpl userService;

    @Autowired
    public void setUserService(UserServiceImpl userService) {
        this.userService = userService;
    }

    @ModelAttribute("user")
    public User newUser() {
        return new User();
    }

    @GetMapping("/registration")
    public String registration(HttpServletRequest request, Model model) {
        Basket basket = Utils.getBasketInSession(request);
//        model.addAttribute("userForm", new User());
        com.finaproject.logistic.model.User userInfo = basket.getUserInfo();
        UserForm userForm = new UserForm(userInfo);
        model.addAttribute("userForm", userForm);
        return "authorization/registration";
    }

    @PostMapping("/registration")
    private String addUser(HttpServletRequest request,
                           @ModelAttribute("userForm") @Validated User userForm,
                           BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "authorization/registration";
        }
        if (!userForm.getPassword().equals(userForm.getPasswordConfirm())) {
            model.addAttribute("passwordError", "Пароли не совпадают");
            return "authorization/registration";
        }
        if (!userService.saveUser(userForm)) {
            model.addAttribute("usernameError", "User with such username is already exist");
            return "authorization/registration";
        }
        Basket basket = Utils.getBasketInSession(request);
        com.finaproject.logistic.model.User userInfo =new com.finaproject.logistic.model.User(userForm);
        basket.setUserInfo(userInfo);
        return "redirect:/";
    }
}
