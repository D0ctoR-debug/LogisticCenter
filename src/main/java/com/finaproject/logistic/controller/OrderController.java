package com.finaproject.logistic.controller;


import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.repository.UserDAO;
import com.finaproject.logistic.service.UserServiceImpl;
import com.finaproject.logistic.service.interfaces.OrderService;
import com.finaproject.logistic.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/order")
@SessionAttributes("user")
public class OrderController {

    private OrderService orderService;
    private UserDAO userDAO;

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping()
    public String getOrderPage(HttpServletRequest request, Model model, @AuthenticationPrincipal UserDetails currentUser) {
        Basket basket = Utils.getBasketInSession(request);
        User user = userDAO.findByUsername(currentUser.getUsername());
        model.addAttribute("basketModel", basket);
        model.addAttribute("user", user);
        return "user/order";
    }

    @PostMapping()
    public String orderConfirm(HttpServletRequest request, Model model) {
        Basket basket = Utils.getBasketInSession(request);
        User user = Utils.getUserInSession(request);
        try {
            orderService.saveOrder(basket, user.getId());
        } catch (Exception e) {
            return "user/order";
        }
        Utils.removeBasketInSession(request);
        Utils.storeLastOrderedBasketInSession(request, basket);
        Basket lastOrderedCart = Utils.getLastOrderedBasketInSession(request);
        if (lastOrderedCart == null) {
            return "redirect:/basket";
        }
        return "redirect:/userPage";
    }


}
