package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.BasketItem;
//import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.entity.Service;
import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.model.ServiceInfo;
import com.finaproject.logistic.repository.UserDAO;
import com.finaproject.logistic.service.ServiceServiceImpl;
import com.finaproject.logistic.service.UserServiceImpl;
//import com.finaproject.logistic.service.interfaces.BasketRepository;
import com.finaproject.logistic.service.interfaces.ShoppingBasketService;
import com.finaproject.logistic.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/basket")
public class BasketController {

    private ServiceServiceImpl serviceService;
    private ShoppingBasketService service;
    private UserServiceImpl userService;
    private UserDAO userDAO;

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Autowired
    public void setService(ShoppingBasketService service) {
        this.service = service;
    }

    @Autowired
    public void setServiceService(ServiceServiceImpl serviceService) {
        this.serviceService = serviceService;
    }

    @Autowired
    public void setUserService(UserServiceImpl userService) {
        this.userService = userService;
    }

    @GetMapping
    public String showBasket(Model model, HttpServletRequest request) {
        Basket basket = Utils.getBasketInSession(request);
        model.addAttribute("basket",basket);
        return "user/basket";
    }


        @PostMapping()
        public String basketUpdateQty(HttpServletRequest request,
                                      Model model,
                                      @ModelAttribute("basket") Basket basketForm) {
            Basket basketInfo = Utils.getBasketInSession(request);
            basketInfo.updateQuantity(basketForm);
            return "redirect:/basket";
        }

    @GetMapping("/delete")
    public String removeProduct(HttpServletRequest request, Model model, //
                                @RequestParam(value = "idService", defaultValue = "") long idService) {
        Service service = null;
        if (idService != 0) {
            service = serviceService.returnServiceById(idService);
        }
        if (service != null) {
            Basket basket = Utils.getBasketInSession(request);
            ServiceInfo serviceInfo = new ServiceInfo(service);
            basket.removeService(serviceInfo);
        }
        return "redirect:/basket";
    }
}
