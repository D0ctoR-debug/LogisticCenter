package com.finaproject.logistic.service.interfaces;

import com.finaproject.logistic.entity.BasketItem;

import com.finaproject.logistic.entity.BasketItem;

public interface BasketItemService {
    BasketItem returnBasketItemById(long id);

    void deleteBasketItem(BasketItem basketItem);
}
