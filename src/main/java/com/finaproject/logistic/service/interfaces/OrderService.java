package com.finaproject.logistic.service.interfaces;

import com.finaproject.logistic.entity.Order;
import com.finaproject.logistic.entity.Service;
import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.model.Basket;

import java.util.List;

public interface OrderService {
    void saveOrder(Basket basket, long id);

    List<Order> returnAllOrders();

    List<Order> returnAllOrdersByUserId(long userId);

    Order returnOrderById(long orderID);

    List<Order> returnOrdersIncludeService(long id);

    List<Order> returnOrderByOrderStageId(long id);

    Double returnSumOfOrders(long id);

    Double returnSumOfOrdersByUserAndStage(long userId,long orderStageId);

    List<Order> returnAllOrdersWithSortedSumASC();

    List<Order> returnAllOrdersWithSortedSumDesc();

    List<Order> returnAllOrdersByOrderStageWithSortedSumASC(long orderStageId);

    List<Order> returnAllOrdersByOrderStageWithSortedSumDesc(long orderStageId);

    List<Order> findByUserIdWithSortedSumASC(long userId);

    List<Order> findByUserIdWithSortedSumDesc(long userId);

    List<Order> findAllOrdersByUserIdAndOrderStage(long orderStageId, long userId);



}
