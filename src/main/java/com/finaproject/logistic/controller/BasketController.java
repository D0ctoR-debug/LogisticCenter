package com.finaproject.logistic.controller;

import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/basket")
public class BasketController {

    @GetMapping
    public String basket(HttpServletRequest request, Model model) {
        Basket basket = Utils.getBasketInSession(request);
        model.addAttribute("basket",basket);
        return "user/basket";
    }
    @PostMapping
    public String basketUpdateQty(HttpServletRequest request,
                                  Model model,
                                  @ModelAttribute("basket") Basket basketForm) {
        Basket basketInfo = Utils.getBasketInSession(request);
        basketInfo.updateQuantity(basketForm);
        return "redirect:/basket";
    }
}
