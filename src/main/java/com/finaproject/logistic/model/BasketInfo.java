package com.finaproject.logistic.model;

import java.util.ArrayList;
import java.util.List;

public class BasketInfo {
    private ServiceInfo serviceInfo;
    private double quantity;

    public BasketInfo() {
        this.quantity = 0;
    }

    public ServiceInfo getServiceInfo() {
        return serviceInfo;
    }

    public void setServiceInfo(ServiceInfo serviceInfo) {
        this.serviceInfo = serviceInfo;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public double getAmount() {
        return this.serviceInfo.getPrice() * this.quantity;
    }
}
