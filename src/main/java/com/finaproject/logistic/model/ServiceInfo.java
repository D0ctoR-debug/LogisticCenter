package com.finaproject.logistic.model;

import com.finaproject.logistic.entity.Service;

public class ServiceInfo {
    private long id;
    private String name;
    private double price;

    public ServiceInfo() {
    }

    public ServiceInfo(Service service) {
        this.id = service.getId();
        this.name = service.getName();
//        this.price = service.getPrice();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
