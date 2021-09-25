package com.finaproject.logistic.model;

import java.util.ArrayList;
import java.util.List;

public class Basket {

    private int orderNum;
    private User userInfo;
    private final List<BasketInfo> basketInfos = new ArrayList<>();

    public Basket() {

    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public List<BasketInfo> getBasketInfos() {
        return this.basketInfos;
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

    private BasketInfo findLineById(long id) {
        for (BasketInfo basketInfo : this.basketInfos) {
            if (basketInfo.getServiceInfo().getId() == id) {
                return basketInfo;
            }
        }
        return null;
    }

    public void addProduct(ServiceInfo serviceInfo, double quantity) {
        BasketInfo basketInfo = this.findLineById(serviceInfo.getId());

        if (basketInfo == null) {
            basketInfo = new BasketInfo();
            basketInfo.setQuantity(0);
            basketInfo.setServiceInfo(serviceInfo);
            this.basketInfos.add(basketInfo);
        }
        double newQuantity = basketInfo.getQuantity() + quantity;
        if (newQuantity <= 0) {
            this.basketInfos.remove(basketInfo);
        } else {
            basketInfo.setQuantity(newQuantity);
        }
    }

    public void updateProduct(long serviceID, double quantity) {
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
}