package com.finaproject.logistic.repository;

import com.finaproject.logistic.entity.Order;
import com.finaproject.logistic.entity.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderItemDAO extends JpaRepository<OrderItem, Long> {

    @Query(value = "select oi.order from OrderItem oi where oi.service.id=:id")
    List<Order> findAllByServiceId(long id);

    @Query(value = "select SUM (oi.quantity) from OrderItem oi where oi.service.id =:id and not oi.order.orderStage.orderStageID =:orderStageId")
    Integer getOrderedQuantityOfTheServiceByServiceId(long id, long orderStageId);

    @Query(value = "select AVG (oi.amount) from OrderItem oi where oi.service.id =:id and not oi.order.orderStage.orderStageID =:orderStageId")
    Double getOrderedAmountOfTheServiceByServiceId(long id, long orderStageId);

}
