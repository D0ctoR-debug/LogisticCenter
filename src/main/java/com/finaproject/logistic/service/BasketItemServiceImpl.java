package com.finaproject.logistic.service;


import com.finaproject.logistic.repository.BasketItemDAO;
import com.finaproject.logistic.service.interfaces.BasketItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class BasketItemServiceImpl implements BasketItemService {

    private BasketItemDAO basketItemDAO;


    @Autowired
    public void setBasketItemDAO(BasketItemDAO basketItemDAO) {
        this.basketItemDAO = basketItemDAO;
    }


    @Override
    public com.finaproject.logistic.entity.BasketItem returnBasketItemById(long id) {
        return basketItemDAO.getById(id);
    }

    @Override
    public void deleteBasketItem(com.finaproject.logistic.entity.BasketItem basketItem) {
        basketItemDAO.delete(basketItem);
    }
}

