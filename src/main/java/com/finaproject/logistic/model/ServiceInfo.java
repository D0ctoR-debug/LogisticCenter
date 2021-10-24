package com.finaproject.logistic.model;

import com.finaproject.logistic.entity.Category;
import com.finaproject.logistic.entity.Service;


public class ServiceInfo {
    private long id;
    private String name;
    private double price;
    private String imageUrl;
    private Category category;


    public ServiceInfo() {
    }

    public ServiceInfo(long id, String name, double price, String imageUrl) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
    }

    public ServiceInfo(Service service) {
        this.id = service.getId();
        this.name = service.getName();
        this.price = service.getPrice();
        this.imageUrl = service.getImageUrl();
        this.category= service.getCategory();
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

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
