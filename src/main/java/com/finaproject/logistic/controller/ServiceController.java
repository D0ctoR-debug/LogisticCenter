package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.Category;
import com.finaproject.logistic.entity.Service;
import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.model.ServiceInfo;
import com.finaproject.logistic.repository.CategoryDAO;
import com.finaproject.logistic.repository.DaoService;
import com.finaproject.logistic.service.ServiceServiceImpl;
import com.finaproject.logistic.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Optional;

@Controller
public class ServiceController {

    private ServiceServiceImpl serviceService;
    private DaoService daoService;
    private CategoryDAO categoryDAO;


    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @Autowired
    public void setDaoService(DaoService daoService) {
        this.daoService = daoService;
    }

    @Autowired
    public void setServiceService(ServiceServiceImpl serviceService) {
        this.serviceService = serviceService;
    }


    @GetMapping("/category/{id}")
    public String categoryDetails(@PathVariable(value = "id") long id, Model model) {
        if (!categoryDAO.existsById(id)) {
            return "redirect:/main";
        }
        Iterable<Service> services = daoService.findByCategoryId(id);
        model.addAttribute("service", services);
        Category category = categoryDAO.getById(id);
        model.addAttribute("cat", category);
        return "/service/services";
    }

    @GetMapping("/category/{id}/addService")
    public String addServicePage(@PathVariable(value = "id") long id, Model model) {
        Category category = categoryDAO.getById(id);
        model.addAttribute("cat", category);
        return "admin/addService";
    }

    @PostMapping("/category/{id}/addService")
    public String addService(@PathVariable(value = "id") long id,
                             @RequestParam String name,
                             @RequestParam String description,
                             @RequestParam String imageUrl,
                             @RequestParam double price,
                             Model model) {
        int quantity = 0;
        Category category = categoryDAO.getById(id);
        Service service = new Service(name, description, imageUrl, price, quantity);
        service.setCost(0);
        service.setCategory(category);
        daoService.save(service);
        return "redirect:/category/{id}";
    }

    @GetMapping("/service/{id}")
    public String serviceDetails(@PathVariable(value = "id") long id, Model model) {
        Optional<Service> service = daoService.findById(id);
        ArrayList<Service> res = new ArrayList<>();
        service.ifPresent(res::add);
        model.addAttribute("service", res);
        return "service/details";
    }

    @PostMapping("/service/{id}/remove")
    public String deleteService(@PathVariable(value = "id") long id, Model model) {
        Service service = daoService.getById(id);
        daoService.delete(service);
        return "redirect:/main";
    }

    @GetMapping("/service/{id}/edit")
    public String editServicePage(@PathVariable(value = "id") long id, Model model) {
        if (!daoService.existsById(id)) {
            return "redirect:/main";
        }
        Optional<Service> service = daoService.findById(id);
        ArrayList<Service> res = new ArrayList<>();
        service.ifPresent(res::add);
        model.addAttribute("service", res);
        return "service/editService";
    }

    @PostMapping("/service/{id}/edit")
    public String editService(@PathVariable(value = "id") long id,
                              @RequestParam String name,
                              @RequestParam String description,
                              @RequestParam String imageUrl,
                              @RequestParam double price,
                              Model model) {
        Service service = daoService.getById(id);
        service.setName(name);
        service.setDescription(description);
        service.setImageUrl(imageUrl);
        service.setPrice(price);
        daoService.save(service);
        return "redirect:/main";
    }

    @GetMapping("/addToBasket")
    public String addTransportToBasket(HttpServletRequest request, Model model, HttpSession
            session, @ModelAttribute("user") User user,
                                       @RequestParam(name = "idService") long idService) {

        Service service = null;
        if (idService != 0) {
            service = serviceService.returnServiceById(idService);
        }
        if (service != null) {
            Basket basket = Utils.getBasketInSession(request);
            ServiceInfo serviceInfo = new ServiceInfo(service);
            basket.addProduct(serviceInfo, 1);
        }
        return "redirect:/basket";
    }
}
