package com.finaproject.logistic.service;

import com.finaproject.logistic.entity.Basket;
//import com.finaproject.logistic.entity.BasketItem;
import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.repository.BasketDAO;
//import com.finaproject.logistic.repository.BasketItemDAO;
import com.finaproject.logistic.repository.DaoService;
import com.finaproject.logistic.repository.UserDAO;
import com.finaproject.logistic.service.interfaces.BasketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BasketService implements BasketRepository {

    private UserDAO userDAO;
    private BasketDAO basketDAO;
//    private BasketItemDAO basketItemDAO;
    private DaoService daoService;

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Autowired
    public void setBasketDAO(BasketDAO basketDAO) {
        this.basketDAO = basketDAO;
    }

//    @Autowired
//    public void setBasketItemDAO(BasketItemDAO basketItemDAO) {
//        this.basketItemDAO = basketItemDAO;
//    }

    @Autowired
    public void setDaoService(DaoService daoService) {
        this.daoService = daoService;
    }

//    @Override
//    public void addProductToBasket(long userId, long serviceId) {
//        User user = userDAO.getOne(userId);
//        try {
//            if (user.getBasket().getBasketItems().stream().anyMatch(basketItem -> basketItem.getServices().get(0).getId() == serviceId)) {
//                BasketItem basketItem = user.getBasket().getBasketItems().stream().filter(s -> s.getServices().get(0).getId() == serviceId).collect(Collectors.toList()).get(0);
//                int firstCountOfInBasketItem = basketItem.getQuantity();
//                basketItem.setHours(firstCountOfInBasketItem + 1);
//                basketItemDAO.save(basketItem);
//            } else {
//                com.finaproject.logistic.entity.Service service = daoService.getOne(serviceId);
//                BasketItem basketItem = new BasketItem(user.getBasket(), 1);
//                service.getBasketItems().add(basketItem);
//                basketItemDAO.save(basketItem);
//                daoService.save(service);
//            }
//        } catch (NullPointerException e) {
//            com.finaproject.logistic.entity.Service service = daoService.getOne(serviceId);
//            BasketItem basketItem = new BasketItem(user.getBasket(), 1);
//            service.getBasketItems().add(basketItem);
//            basketItemDAO.save(basketItem);
//            daoService.save(service);
//        }



//    @Override
//    public void updateCostWarehouse(long basketItemId, int quantity) {
//        BasketItem basketItem = basketItemDAO.getOne(basketItemId);
//        basketItem.setQuantity(quantity);
//        basketItemDAO.save(basketItem);
//
//    }

//    @Override
//    public List<BasketItem> returnListOfProductsInBasket(long userId) {
//        return null;
//    }

    @Override
    public String returnTotalCostOfTheOrder(long userId) {
        return null;
    }

    @Override
    public void submitProductInBasket(long userId, long productId) {

    }

    @Override
    public Basket getBasketOrCreate(long userId) {
        return null;
    }

    @Override
    public Basket getBasketOrCreateWithoutUser() {
        return null;
    }
}
