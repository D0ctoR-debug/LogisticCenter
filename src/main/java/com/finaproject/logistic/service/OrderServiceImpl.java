package com.finaproject.logistic.service;

//import com.finaproject.logistic.model.Basket;
//import com.finaproject.logistic.model.BasketInfo;

import com.finaproject.logistic.entity.Order;
import com.finaproject.logistic.entity.OrderItem;
import com.finaproject.logistic.entity.OrderStage;
import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.model.BasketInfo;
import com.finaproject.logistic.repository.*;
import com.finaproject.logistic.service.interfaces.OrderService;
import org.apache.commons.math3.util.Precision;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    private OrderDAO orderDAO;
    private UserDAO userDAO;
    private DaoService daoService;
    private OrderItemDAO orderItemDAO;
    private OrderStageDAO orderStageDAO;

    @Autowired
    public void setOrderStageDAO(OrderStageDAO orderStageDAO) {
        this.orderStageDAO = orderStageDAO;
    }

    @Autowired
    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Autowired
    public void setDaoService(DaoService daoService) {
        this.daoService = daoService;
    }

    @Autowired
    public void setOrderItemDAO(OrderItemDAO orderItemDAO) {
        this.orderItemDAO = orderItemDAO;
    }

    @Override
    public void saveOrder(Basket basket, long id) {
        Order order = new Order();
        order.setUser(userDAO.getById(id));
        order.setAmount(Precision.round(basket.getAmountTotal(), 2));
        order.setOrderStage(orderStageDAO.getById(2L));
//        order.setOrderNumber(order.getId());
        orderDAO.save(order);


        List<BasketInfo> basketInfos = basket.getBasketInfos();

        for (BasketInfo basketInfo : basketInfos) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setAmount(Precision.round(basketInfo.getAmount(), 2));
            orderItem.setPrice(Precision.round(basketInfo.getServiceInfo().getPrice(), 2));
            orderItem.setQuantity(basketInfo.getQuantity());
            com.finaproject.logistic.entity.Service service = this.daoService.getById(basketInfo.getServiceInfo().getId());
            orderItem.setService(service);
            orderItemDAO.save(orderItem);
        }

        basket.setOrderNum(order.getId());

    }

    @Override
    public List<Order> returnAllOrders() {
        return orderDAO.findAll();
    }

    @Override
    public List<Order> returnAllOrdersByUserId(long userId) {
        return orderDAO.findByUserId(userId);
    }

    @Override
    public Order returnOrderById(long orderID) {
        return orderDAO.findById(orderID);
    }

    @Override
    public void savePersonalOrder(com.finaproject.logistic.entity.Service service, User user) {

        com.finaproject.logistic.entity.Service service1 = daoService.getById(service.getId());
        Order order = new Order();
        order.setUser(user);
        order.setAmount(Precision.round(service1.getQuantity() * service1.getPrice(), 2));
        orderDAO.save(order);
//        order.setOrderNumber(order.getId());
        OrderItem orderItem = new OrderItem();
        orderItem.setOrder(order);
        orderItem.setAmount(order.getAmount());
        orderItem.setPrice(service1.getPrice());
        orderItem.setQuantity(service1.getQuantity());
        orderItem.setService(service1);
        orderItem.setOrderItemID(2L);
        orderItemDAO.save(orderItem);
        service1.setQuantity(0);

    }

    @Override
    public List<Order> returnOrdersIncludeService(long id) {
        return orderItemDAO.findAllByServiceId(id);
    }

    @Override
    public List<Order> returnOrderByOrderStageId(long id) {
        return orderDAO.findAllByOrderStageId(id);
    }

    @Override
    public Double returnSumOfOrders(long id) {
        return orderDAO.getTotalAmountOfOrdersByUser(id);
    }

    @Override
    public Double returnSumOfOrdersByUserAndStage(long userId, long orderStageId) {
        return orderDAO.getTotalAmountOfOrdersByUserAndOrderStage(userId, orderStageId);
    }

    @Override
    public List<Order> returnAllOrdersWithSortedSumASC() {
        return orderDAO.findAllOrdersWithSortedSumASC();
    }

    @Override
    public List<Order> returnAllOrdersWithSortedSumDesc() {
        return orderDAO.findAllOrdersWithSortedSumDesc();
    }

    @Override
    public List<Order> returnAllOrdersByOrderStageWithSortedSumASC(long orderStageId) {
        return orderDAO.findAllOrdersByOrderStageWithSortedSumASC(orderStageId);
    }

    @Override
    public List<Order> returnAllOrdersByOrderStageWithSortedSumDesc(long orderStageId) {
        return orderDAO.findAllOrdersByOrderStageWithSortedSumDesc(orderStageId);
    }

}
