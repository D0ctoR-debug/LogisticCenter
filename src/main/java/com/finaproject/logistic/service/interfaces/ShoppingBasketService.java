package com.finaproject.logistic.service.interfaces;

import com.finaproject.logistic.entity.BasketItem;
import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.repository.BasketItemDAO;
import com.finaproject.logistic.repository.DaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingBasketService {

    private BasketItemDAO basketItemDAO;

    private DaoService daoService;

    @Autowired
    public void setDaoService(DaoService daoService) {
        this.daoService = daoService;
    }


    @Autowired
    public void setBasketItemDAO(BasketItemDAO basketItemDAO) {
        this.basketItemDAO = basketItemDAO;
    }

    public List<BasketItem> basketItemList(User user) {
        return basketItemDAO.findByUser(user);
    }

    public Integer addService(long serviceId, int quantity, User user) {
        int addedQuantity = quantity;
        com.finaproject.logistic.entity.Service service = daoService.findById(serviceId).get();

        BasketItem basketItem = basketItemDAO.findByUserAndService(user, service);

        if (basketItem != null) {
            addedQuantity = basketItem.getQuantity() + quantity;
            basketItem.setQuantity(addedQuantity);
        } else {
            basketItem = new BasketItem();
            basketItem.setQuantity(quantity);
            basketItem.setService(service);
            basketItem.setUser(user);
        }
        basketItemDAO.save(basketItem);

        return addedQuantity;
    }
}
