package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.*;
import com.finaproject.logistic.repository.CategoryDAO;
import com.finaproject.logistic.repository.OrderDAO;
import com.finaproject.logistic.repository.OrderStageDAO;
import com.finaproject.logistic.repository.UserDAO;
import com.finaproject.logistic.service.interfaces.OrderService;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
//@RequestMapping("/admin")
public class AdminController {

    private OrderService orderService;
    private UserDAO userDAO;
    private OrderDAO orderDAO;
    private CategoryDAO categoryDAO;
    private OrderStageDAO orderStageDAO;

    @Autowired
    public void setOrderStageDAO(OrderStageDAO orderStageDAO) {
        this.orderStageDAO = orderStageDAO;
    }

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
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

    @GetMapping("/users/{id}/orders")
    public String getUserOrders(Model model, @PathVariable("id") long userId) {
        List<Order> orders = orderService.returnAllOrdersByUserId(userId);
        model.addAttribute("orders", orders);
        return "users/orderHistoryPage";
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

    @PostMapping("/order/{id}/accept")
    public String acceptOrder(@PathVariable(value = "id") long id, Model model) {
        Order order = orderDAO.getById(id);
        OrderStage orderStage = orderStageDAO.getById(4L);
        order.setOrderStage(orderStage);
        orderDAO.save(order);
        return "redirect:/orderHistory";
    }

    @PostMapping("/order/{id}/reject")
    public String rejectOrder(@PathVariable(value = "id") long id, Model model) {
        Order order = orderDAO.getById(id);
        OrderStage orderStage = orderStageDAO.getById(3L);
        order.setOrderStage(orderStage);
        orderDAO.save(order);
        return "redirect:/orderHistory";
    }

    @GetMapping("/addCategory")
    public String addCategoryPage(Model model) {
        return "admin/addCategory";
    }

    @PostMapping("/addCategory")
    public String addCategory(@RequestParam String name,
                              @RequestParam String description,
                              @RequestParam String image, Model model) {
        Category category = new Category(name, description, image);
        categoryDAO.save(category);
        return "redirect:/main";

    }
}
