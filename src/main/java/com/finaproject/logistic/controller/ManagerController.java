package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.Order;
import com.finaproject.logistic.entity.OrderStage;
import com.finaproject.logistic.repository.OrderDAO;
import com.finaproject.logistic.repository.OrderStageDAO;
import com.finaproject.logistic.service.interfaces.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;


@Controller
public class ManagerController {

    private OrderDAO orderDAO;
    private OrderStageDAO orderStageDAO;
    private OrderService orderService;


    @Autowired
    public void setOrderStageDAO(OrderStageDAO orderStageDAO) {
        this.orderStageDAO = orderStageDAO;
    }

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
        List<Order> orders = orderService.returnOrderByOrderStageId(2L);
        model.addAttribute("orders", orders);
        return "manager/ordersToAccept";
    }

    @PostMapping("/order/{id}/accept")
    public String acceptOrder(@PathVariable(value = "id") long id, Model model) {
        Order order = orderDAO.getById(id);
        OrderStage orderStage = orderStageDAO.getById(4L);
        order.setOrderStage(orderStage);
        orderDAO.save(order);
        return "redirect:/newOrders";
    }

    @PostMapping("/order/{id}/reject")
    public String rejectOrder(@PathVariable(value = "id") long id, Model model) {
        Order order = orderDAO.getById(id);
        OrderStage orderStage = orderStageDAO.getById(3L);
        order.setOrderStage(orderStage);
        orderDAO.save(order);
        return "redirect:/newOrders";
    }
}
