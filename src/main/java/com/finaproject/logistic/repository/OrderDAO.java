package com.finaproject.logistic.repository;

import com.finaproject.logistic.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderDAO extends JpaRepository<Order, Long> {
    Order findById(long id);

    List<Order> findByUserId(long userId);

    @Query(value = "select SUM (o.amount) from Order o where o.user.id=:userId")
    Double getTotalAmountOfOrdersByUser(long userId);

    @Query(value = "select stage.orders from OrderStage stage where stage.orderStageID =:id")
    List<Order> findAllByOrderStageId(long id);

    @Query(value = "select SUM (o.amount) from Order o where o.user.id =:userId and o.orderStage.orderStageID =:orderStageId")
    Double getTotalAmountOfOrdersByUserAndOrderStage(long userId, long orderStageId);

    @Query(value = "from Order o order by o.amount ASC")
    List<Order> findAllOrdersWithSortedSumASC();

    @Query(value = "from Order o order by o.amount desc")
    List<Order> findAllOrdersWithSortedSumDesc();

    @Query(value = "from Order o where o.orderStage.orderStageID =:orderStageId order by o.amount ASC")
    List<Order> findAllOrdersByOrderStageWithSortedSumASC(long orderStageId);

    @Query(value = "from Order o where o.orderStage.orderStageID =:orderStageId order by o.amount DESC")
    List<Order> findAllOrdersByOrderStageWithSortedSumDesc(long orderStageId);
}
