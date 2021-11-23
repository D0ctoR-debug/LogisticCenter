package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.*;
import com.finaproject.logistic.repository.*;
import com.finaproject.logistic.service.interfaces.OrderService;
import com.finaproject.logistic.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@Controller
public class AdminController {

    private OrderService orderService;
    private UserDAO userDAO;
    private OrderDAO orderDAO;
    private UserService userService;
    private RoleDAO roleDAO;

    @Autowired
    public void setRoleDAO(RoleDAO roleDAO) {
        this.roleDAO = roleDAO;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @Autowired
    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

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

    @GetMapping("/users/{id}")
    public String userPage(Model model, @PathVariable("id") long userId) {
        User user = userDAO.getById(userId);
        model.addAttribute("user", user);
        return "admin/userPage";
    }

    @GetMapping("/users/{id}/addManager")
    public String addManager(Model model, @PathVariable("id") long userId) {
        User user = userDAO.getById(userId);
        Role manager = roleDAO.getById(2L);
        Set<Role> roles = user.getRole();
        roles.add(manager);
        user.setRole(roles);
        user.setDiscount(4);
        userDAO.save(user);
        return "redirect:/allUsers";
    }

    @GetMapping("/users/{id}/deleteManager")
    public String deleteManager(Model model, @PathVariable("id") long userId) {
        User user = userDAO.getById(userId);
        Set<Role> roles = user.getRole();
        Role manager = roleDAO.getById(2L);
        roles.remove(manager);
        user.setRole(roles);
        user.setDiscount(2.5);
        userDAO.save(user);
        return "redirect:/allUsers";
    }


    @GetMapping("/users/{id}/orders")
    public String getUserOrders(Model model, @PathVariable("id") long userId) {
        List<Order> orders = orderService.returnAllOrdersByUserId(userId);
        model.addAttribute("orders", orders);
        return "user/orderHistory";
    }

    @GetMapping("/users/{id}/delete")
    public String deleteUser(@PathVariable("id") long userId, Model model) {
        userService.deleteUser(userId);
        return "redirect:/allUsers";
    }

    @GetMapping("/allOrders")
    public String getAllOrders(Model model) {
        List<Order> orders = orderService.returnAllOrders();
        model.addAttribute("orders", orders);
        return "admin/allOrders";
    }

    @GetMapping("/allOrders/ASC")
    public String getAllOrdersBySortedSumASC(Model model) {
        List<Order> orders = orderService.returnAllOrdersWithSortedSumASC();
        model.addAttribute("orders", orders);
        return "admin/allOrders";
    }

    @GetMapping("/allOrders/desc")
    public String getAllOrdersBySortedSumDesc(Model model) {
        List<Order> orders = orderService.returnAllOrdersWithSortedSumDesc();
        model.addAttribute("orders", orders);
        return "admin/allOrders";
    }

    @GetMapping("/order/{id}")
    public String getOrder(@PathVariable(value = "id") long id, Model model) {
        Order order = orderDAO.findById(id);
        model.addAttribute("order", order);
        return "";
    }
}
