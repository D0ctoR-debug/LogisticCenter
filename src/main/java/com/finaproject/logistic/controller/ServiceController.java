package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.Category;
import com.finaproject.logistic.entity.Service;
//import com.finaproject.logistic.model.Basket;
//import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.model.Basket;
import com.finaproject.logistic.model.ServiceInfo;
import com.finaproject.logistic.repository.CategoryDAO;
import com.finaproject.logistic.repository.DaoService;
//import com.finaproject.logistic.service.BasketService;
import com.finaproject.logistic.service.ServiceServiceImpl;
import com.finaproject.logistic.service.interfaces.CategoryService;
import com.finaproject.logistic.utils.Utils;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Optional;

@Controller
public class ServiceController {

    private ServiceServiceImpl serviceService;
    private CategoryService categoryRepository;
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
    public void setCategoryRepository(CategoryService categoryRepository) {
        this.categoryRepository = categoryRepository;
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

    @GetMapping("/category/{id}/edit")
    public String editCategoryPage(@PathVariable(value = "id") long id, Model model) {
        if (!categoryDAO.existsById(id)) {
            return "redirect:/main";
        }
        Optional<Category> category = categoryDAO.findById(id);
        ArrayList<Category> res = new ArrayList<>();
        category.ifPresent(res::add);
        model.addAttribute("category", res);
        return "service/editCategory";
    }

    @PostMapping("/category/{id}/edit")
    public String editCategory(@PathVariable(value = "id") long id,
                               @RequestParam String name,
                               @RequestParam String description,
                               @RequestParam String image,
                               Model model) {
        Category category = categoryDAO.getById(id);
        category.setName(name);
        category.setDescription(description);
        category.setImage(image);
        categoryDAO.save(category);
        return "redirect:/main";
    }

    @PostMapping("/category/{id}/delete")
    public String deleteCategory(@PathVariable (value = "id") long id,Model model){
        Category category = categoryDAO.getById(id);
        categoryDAO.delete(category);
        return "redirect:/main";
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
                             @RequestParam double cost,
                             @RequestParam double price,
                             Model model) {
        int quantity = 0;
        Category category = categoryDAO.getById(id);
        Service service = new Service(name, description, imageUrl, cost, price, quantity);
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
                              @RequestParam double cost,
                              @RequestParam double price,
                              Model model) {
        Service service = daoService.getById(id);
        service.setName(name);
        service.setDescription(description);
        service.setImageUrl(imageUrl);
        service.setCost(cost);
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
//
//    @GetMapping("/transport")
//    public String transportLogistic(Model model) {
//        Iterable<Service> services = daoService.findByCategoryId(1L);
//        model.addAttribute("transport", services);
//        return "/service/transportLogistic";
//    }
//
//    @GetMapping("/transportHaul")
//    public String transportHaul(Model model) {
//        Iterable<Service> services = daoService.findByCategoryId(3L);
//        model.addAttribute("haul", services);
//        return "/service/transportHaul";
//    }
//
//    @GetMapping("/warehouseRental")
//    public String warehouseRental(Model model) {
//        Iterable<Service> services = daoService.findByCategoryId(5L);
//        model.addAttribute("rental", services);
//        return "/service/warehouseRental";
//    }
//
//    @GetMapping("/warehouse")
//    public String warehouseLogistic(Model model, @RequestParam(value = "name", defaultValue = "") String likeName) {
//        Iterable<Service> services = daoService.findByCategoryId(2L);
//        model.addAttribute("warehouse", services);
//        return "/service/warehouseLogistic";
//    }
//@GetMapping("/purchasing")
//public String purchasingLogistic(Model model) {
//    Iterable<Service> services = daoService.findByCategoryId(4L);
//    model.addAttribute("purchasing", services);
//    return "/service/purchasingLogistic";
//}

//    @PostMapping("/add")
//    public String addTransportToBasket(HttpServletRequest request, Model model,
//                              @ModelAttribute("service") Service service,
//                              BindingResult bindingResult) {
//        double kilometers = -1;
//        try {
//            String number = request.getParameter("kilometers");
//            kilometers = Double.parseDouble(number);
//        } catch (NumberFormatException e){
//            model.addAttribute("error", daoService.findByCategoryId(1L));
//        }
//        double price = -1;
//        try {
//            String number2 = request.getParameter("price");
//            price = Double.parseDouble(number2);
//        } catch (NumberFormatException e) {
//            model.addAttribute("error", daoService.findByCategoryId(1L));
//        }
//        if (bindingResult.hasErrors()){
//            return "service/transportLogistic";
//        }
//
//        String fieldProductName = formErrorMessage.checkFieldProductName(request.getParameter("name"));
//        model.addAttribute("fieldProductName", fieldProductName);
//        String fieldProductQuantity = formErrorMessage.checkFieldProductQuantity("quantity", quantity);
//        model.addAttribute("fieldProductQuantity", fieldProductQuantity);
//        String fieldProductDescription = formErrorMessage.checkFieldProductDescription("description");
//        model.addAttribute("fieldProductDescription", fieldProductDescription);
//        String fieldProductPrice = formErrorMessage.checkFieldProductPrice("price", price);
//        model.addAttribute("fieldProductPrice", fieldProductPrice);
//        String fieldProductTime = formErrorMessage.checkFieldProductTimeOfProduction("productionTime", time);
//        model.addAttribute("fieldProductTime", fieldProductTime);
//        if (!formErrorMessage.checkAddProductFormValid(fieldProductName, fieldProductQuantity, fieldProductDescription,
//                fieldProductPrice, fieldProductTime)) {
//            model.addAttribute("glazesType", glazesTypeService.returnAllGlazesType());
//            return "products/addProductPage";
//        }
//        if (bindingResult.hasErrors()) {
//            model.addAttribute("glazesType", glazesTypeService.returnAllGlazesType());
//            return "products/addProductPage";
//        }
//        productService.saveProductWithGlazeType(product, glazesType);
//        return "redirect:/main";
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


}
