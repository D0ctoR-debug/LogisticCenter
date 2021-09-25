package com.finaproject.logistic.model;

import java.util.Date;
import java.util.List;

public class Order {
    private long id;
    private Date orderDate;
    private int orderNum;
    private double amount;
    private String username;
    private List<OrderItemInfo> details;

    public Order() {
    }

    public Order(long id, Date orderDate, int orderNum, double amount, String username) {
        this.id = id;
        this.orderDate = orderDate;
        this.orderNum = orderNum;
        this.amount = amount;
        this.username = username;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<OrderItemInfo> getDetails() {
        return details;
    }

    public void setDetails(List<OrderItemInfo> details) {
        this.details = details;
    }
}
