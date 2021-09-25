package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.form.UserForm;
import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.service.UserService;
import com.finaproject.logistic.utils.Utils;
import com.finaproject.logistic.validator.UserFormValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Locale;

@Controller
public class RegistrationController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @ModelAttribute("user")
    public User newUser() {
        return new User();
    }

    @GetMapping("/registration")
    public String registration(HttpServletRequest request, Model model) {
        Basket basket = Utils.getBasketInSession(request);
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
            model.addAttribute("usernameError", "User with such login is already exist");
            return "authorization/registration";
        }
        return "redirect:/";
    }
}
//    @RequestParam String name,
//    @RequestParam String username,
//    @RequestParam String password,
//    @RequestParam String phoneNumber,
//    @RequestParam String email