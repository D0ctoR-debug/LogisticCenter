package com.finaproject.logistic.entity;
import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "order_stages")
public class OrderStage {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "order_stage_id")
    private long orderStageID;

    private String name;

    @OneToMany(mappedBy = "orderStage")
    private List<Order> orders;

    public OrderStage() {
    }

    public OrderStage(int orderStageID, String name, List<Order> orders) {
        this.orderStageID = orderStageID;
        this.name = name;
        this.orders = orders;
    }

    public long getOrderStageID() {
        return orderStageID;
    }

    public void setOrderStageID(long orderStageID) {
        this.orderStageID = orderStageID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrderStage that = (OrderStage) o;
        return Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(orderStageID, name, orders);
    }

    @Override
    public String toString() {
        return "OrderStage{" +
                "orderStageID=" + orderStageID +
                ", name='" + name + '\'' +
                '}';
    }
}