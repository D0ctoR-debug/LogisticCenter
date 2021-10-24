package com.finaproject.logistic.service;

//import com.finaproject.logistic.repository.BasketDAO;
import com.finaproject.logistic.repository.BasketItemDAO;
import com.finaproject.logistic.repository.DaoService;
import com.finaproject.logistic.repository.UserDAO;
import com.finaproject.logistic.service.interfaces.BasketItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class BasketItemServiceImpl implements BasketItemService {

    private UserDAO userDAO;
//    private BasketDAO basketDAO;
    private BasketItemDAO basketItemDAO;
    private DaoService daoService;

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

//    @Autowired
//    public void setBasketDAO(BasketDAO basketDAO) {
//        this.basketDAO = basketDAO;
//    }

    @Autowired
    public void setBasketItemDAO(BasketItemDAO basketItemDAO) {
        this.basketItemDAO = basketItemDAO;
    }

    @Autowired
    public void setDaoService(DaoService daoService) {
        this.daoService = daoService;
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

