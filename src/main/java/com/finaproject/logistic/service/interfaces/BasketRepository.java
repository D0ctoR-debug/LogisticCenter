package com.finaproject.logistic.service.interfaces;

import com.finaproject.logistic.entity.Basket;
//import com.finaproject.logistic.entity.BasketItem;

import java.util.List;

public interface BasketRepository {

    String returnTotalCostOfTheOrder(long userId);

    void submitProductInBasket(long userId, long productId);

    Basket getBasketOrCreate(long userId);

    Basket getBasketOrCreateWithoutUser();
}
