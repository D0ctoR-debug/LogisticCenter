package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.Service;
import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.model.ServiceInfo;
import com.finaproject.logistic.repository.CategoryDAO;
import com.finaproject.logistic.repository.DaoService;
import com.finaproject.logistic.repository.ServiceDAO;
import com.finaproject.logistic.service.ServiceService;
import com.finaproject.logistic.service.interfaces.CategoryRepository;
import com.finaproject.logistic.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Optional;

@Controller
public class ServiceController {

    //    private ServiceService service;
    private ServiceService serviceService;
    private CategoryRepository categoryRepository;
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
    public void setCategoryRepository(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Autowired
    public void setServiceService(ServiceService serviceService) {
        this.serviceService = serviceService;
    }


    @GetMapping("/purchasing")
    public String purchasingLogistic(Model model) {
        return "/service/purchasingLogistic";
    }

    @GetMapping("/transport")
    public String tranposrtLogistic(Model model) {
        Iterable<Service> services = daoService.findByCategoryId(1L);
        model.addAttribute("transport",services);
        return "/service/transportLogistic";
    }
//    @PostMapping("/transport")
//    public String addToBasket(Model model){
//
//    }

    @GetMapping("/transportHaul")
    public String transportHaul(Model model) {
        return "/service/transportHaul";
    }

    @GetMapping("/warehouseRental")
    public String warehouseRental(Model model) {
        return "/service/warehouseRental";
    }

    @GetMapping("/warehouse")
    public String warehouseLogistic(Model model, @RequestParam(value = "name", defaultValue = "") String likeName) {
        Optional<Service> service = daoService.findById(1L);
        ArrayList<Service> res = new ArrayList<>();
        service.ifPresent(res::add);
        model.addAttribute("service", res);
//        double result = serviceService.calculatePriceOfWarehouse(4,4);
//        model.addAttribute("rs", result);
//        Iterable<Service> services = serviceRepository.findAll();
//        model.addAttribute("services", services);
        return "/service/warehouseLogistic";
    }

//    @GetMapping("/buyService")
//    public String listProduct(HttpServletRequest request, Model model,
//                              @RequestParam(value = "id", defaultValue = "") long id) {
//        Service service = daoService.getById(id);
//
//        if (service != null) {
//            Basket basketInfo = Utils.getBasketInSession(request);
//
//            ServiceInfo serviceInfo = new ServiceInfo(service);
//
//            basketInfo.addProduct(serviceInfo, 1);
//        }
//
//        return "redirect:/basket";
//    }

//    @GetMapping("/basket")
//    private String showBasket(HttpServletRequest request, Model model) {
//        Basket myBasket = Utils.getBasketInSession(request);
//
//        model.addAttribute("basketForm",myBasket);
//
//        return "user/basket";
//    }


//    @PostMapping("/warehouse")
//    public String calculatorWarehouse(@RequestParam double result,
//                                      @RequestParam double hours,
//                                      @RequestParam double tons,
//                                      @RequestParam double cost,
//                                      @RequestParam double cost2, Model model) {
//        Service service = daoService.findById(2L).orElseThrow();
//        cost2 = service.getPricePerTon();
//        result = serviceService.calculatePriceOfWarehouse(tons, hours) * cost * cost2;
//        model.addAttribute("result", result);
//
//
//        return "redirect:/warehouse";
//    }

//    @GetMapping("/addToBasket")
//    public String addWarehouseLogisticService(HttpServletRequest request,
//                                              Model model, HttpSession session, @ModelAttribute("user") User user,
//                                              @RequestParam(name = "idService") long idService) {
//        Service service = null;
//        if (idService != 0) {
//            service = serviceService.returnServiceById(idService);
//        }
//        if (service != null) {
//            Basket basket = Utils.getBasketInSession(request);
//            WarehouseLogisticInfo warehouseLogisticInfo = new WarehouseLogisticInfo(service);
//            basket.addProduct(warehouseLogisticInfo,1,1);
//        }
//        return "redirect:/warehouse";
//    }

}
