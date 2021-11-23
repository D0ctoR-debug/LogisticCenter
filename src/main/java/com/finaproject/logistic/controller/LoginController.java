package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.form.UserForm;
import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.service.UserServiceImpl;
import com.finaproject.logistic.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@Controller
@RequestMapping("/login")
@SessionAttributes("user")
public class LoginController {
    private UserServiceImpl userService;
    private MessageSource messageSource;

    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @Autowired
    public void setUserService(UserServiceImpl userService) {
        this.userService = userService;
    }

    @ModelAttribute("user")
    public User newUser() {
        return new User();
    }

    @GetMapping
    public String showLoginPage(HttpServletRequest request, Model model) {
        Basket basket = Utils.getBasketInSession(request);
        com.finaproject.logistic.model.User userInfo = basket.getUserInfo();
        UserForm userForm = new UserForm(userInfo);
        model.addAttribute("user", userForm);
        return "login";
    }

    @PostMapping
    public String basketCustomerSave(HttpServletRequest request, //
                                     Model model, //
                                     @ModelAttribute("user") @Validated UserForm userForm, //
                                     BindingResult result, //
                                     final RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            userForm.setValid(false);
            return "login";
        }
        userForm.setValid(true);
        Basket basket = Utils.getBasketInSession(request);
        com.finaproject.logistic.model.User userInfo = new com.finaproject.logistic.model.User(userForm);
        basket.setUserInfo(userInfo);
        return "redirect:/userPage";
    }

    @GetMapping("/failedEnter")
    public String failedEnter(Model model) {
        String errorMessage = messageSource.getMessage("user.error.authorization", new Object[]{"user.error.authorization"}, LocaleContextHolder.getLocale());
        model.addAttribute("msg", errorMessage);
        return "login";
    }
}
