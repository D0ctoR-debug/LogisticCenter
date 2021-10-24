package com.finaproject.logistic.utils;

import com.finaproject.logistic.entity.User;
//import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.model.Basket;
import org.apache.catalina.Manager;

import javax.servlet.http.HttpServletRequest;

public class Utils {

    public static User getUserInSession(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        return user;
    }

    public static Manager getManagerInSession(HttpServletRequest request) {
        Manager manager = (Manager) request.getSession().getAttribute("manager");
        return manager;
    }

    //   Products in the cart, stored in Session.
    public static Basket getBasketInSession(HttpServletRequest request) {

        Basket basket = (Basket) request.getSession().getAttribute("basket");


        if (basket == null) {
            basket = new Basket();

            request.getSession().setAttribute("basket", basket);
        }

        return basket;
    }

    public static void removeBasketInSession(HttpServletRequest request) {
        request.getSession().removeAttribute("basket");
    }

    public static void storeLastOrderedBasketInSession(HttpServletRequest request, Basket basket) {
        request.getSession().setAttribute("lastOrderedBasket", basket);
    }

    public static Basket getLastOrderedBasketInSession(HttpServletRequest request) {
        return (Basket) request.getSession().getAttribute("lastOrderedBasket");
    }
}
