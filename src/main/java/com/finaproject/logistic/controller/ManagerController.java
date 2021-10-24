package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.Order;
import com.finaproject.logistic.repository.OrderDAO;
import com.finaproject.logistic.service.interfaces.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;


@Controller
public class ManagerController {

    private OrderDAO orderDAO;
    private OrderService orderService;

    @Autowired
    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/newOrders")
    public String newOrdersPage(Model model) {
        List<Order> orders =orderService.returnOrderByOrderStageId(2L);
        model.addAttribute("orders",orders);
        return "manager/ordersToAccept";
    }
}
