package com.finaproject.logistic.controller;


import com.finaproject.logistic.entity.Service;
import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.model.ServiceInfo;
import com.finaproject.logistic.service.ServiceServiceImpl;
import com.finaproject.logistic.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/basket")
public class BasketController {

    private ServiceServiceImpl serviceService;

    @Autowired
    public void setServiceService(ServiceServiceImpl serviceService) {
        this.serviceService = serviceService;
    }

    @GetMapping
    public String showBasket(Model model, HttpServletRequest request) {
        Basket basket = Utils.getBasketInSession(request);
        model.addAttribute("basket", basket);
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
