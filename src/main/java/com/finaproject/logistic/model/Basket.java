package com.finaproject.logistic.model;

import java.util.ArrayList;
import java.util.List;

public class Basket {

    private long orderNum;
    private User userInfo;
    private final List<BasketInfo> basketInfos = new ArrayList<>();

    public Basket() {

    }

    public long getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(long orderNum) {
        this.orderNum = orderNum;
    }

    public List<BasketInfo> getBasketInfos() {
        return basketInfos;
    }

    public User getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(User userInfo) {
        this.userInfo = userInfo;
    }

    private BasketInfo findById(long id) {
        for (BasketInfo basketInfo : this.basketInfos) {
            if (basketInfo.getServiceInfo().getId() == id) {
                return basketInfo;
            }
        }
        return null;
    }

    public double getQuantityTotal() {
        double quantity = 0;
        for (BasketInfo basketInfo : this.basketInfos) {
            quantity += basketInfo.getQuantity();
        }
        return quantity;
    }

    public double getAmountTotal() {
        double total = 0;
        for (BasketInfo basketInfo : this.basketInfos) {
            total += basketInfo.getAmount();
        }
        return total;
    }

    public void addProduct(ServiceInfo serviceInfo, int quantity) {
        BasketInfo basketInfo = this.findById(serviceInfo.getId());

        if (basketInfo == null) {
            basketInfo = new BasketInfo();
            basketInfo.setQuantity(0);
            basketInfo.setServiceInfo(serviceInfo);
            this.basketInfos.add(basketInfo);
        }
        int newQuantity = basketInfo.getQuantity() + quantity;
        if (newQuantity <= 0) {
            this.basketInfos.remove(basketInfo);
        } else {
            basketInfo.setQuantity(newQuantity);
        }
    }

    public void updateProduct(long serviceID, int quantity) {
        BasketInfo basketInfo = this.findById(serviceID);
        if (basketInfo != null) {
            if (quantity <= 0) {
                this.basketInfos.remove(basketInfo);
            } else {
                basketInfo.setQuantity(quantity);
            }
        }
    }

    public void updateQuantity(Basket basketForm) {
        if (basketForm != null) {
            List<BasketInfo> basketInfos = basketForm.getBasketInfos();
            for (BasketInfo basketInfo : basketInfos) {
                this.updateProduct(basketInfo.getServiceInfo().getId(), basketInfo.getQuantity());
            }
        }

    }

    public void removeService(ServiceInfo serviceInfo) {
        BasketInfo basketInfo = this.findById(serviceInfo.getId());
        if (basketInfo != null) {
            this.basketInfos.remove(basketInfo);
        }
    }


}