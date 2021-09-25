package com.finaproject.logistic.model;

public class OrderItemInfo {
    private long id;
    private long serviceId;
    private String serviceName;
    private double price;

    public OrderItemInfo() {
    }

    public OrderItemInfo(long id, long serviceId, String serviceName, double price) {
        this.id = id;
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.price = price;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getServiceId() {
        return serviceId;
    }

    public void setServiceId(long serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
