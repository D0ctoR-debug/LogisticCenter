package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.Category;
import com.finaproject.logistic.entity.Order;
import com.finaproject.logistic.entity.Service;
import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.repository.CategoryDAO;
import com.finaproject.logistic.repository.UserDAO;
import com.finaproject.logistic.service.interfaces.OrderService;
import com.finaproject.logistic.service.interfaces.ServiceService;
import com.finaproject.logistic.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
//@RequestMapping("/user")
public class UserController {

    private UserDAO userDAO;
    private CategoryDAO categoryDAO;
    private OrderService orderService;
    private ServiceService serviceService;

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @Autowired
    public void setServiceService(ServiceService serviceService) {
        this.serviceService = serviceService;
    }

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @GetMapping("/main")
    public String userMain(Model model, @AuthenticationPrincipal UserDetails currentUser) {
        Iterable<Category> categories = categoryDAO.findAll();
        model.addAttribute("categories", categories);
        User user = userDAO.findByUsername(currentUser.getUsername());
        model.addAttribute("currentUser", user);
        return "user/mainPage";
    }

    @GetMapping("/userPage")
    public String userPage(Model model,
                           @AuthenticationPrincipal UserDetails currentUser) {
//        if (!userRepository.existsById(id)){
//            return "redirect:/main";
//        }
        User user = userDAO.findByUsername(currentUser.getUsername());
        model.addAttribute("currentUser", user);
        return "user/userPage";
    }

    @GetMapping("userPage/edit/{id}")
    public String editUser(@PathVariable(value = "id") long id,
                           Model model) {
        if (!userDAO.existsById(id)) {
            return "redirect:/main";
        }
        Optional<User> user = userDAO.findById(id);
        ArrayList<User> result = new ArrayList<>();
        user.ifPresent(result::add);
        model.addAttribute("user", result);
        return "user/editUser";
    }

    @PostMapping("userPage/edit/{id}")
    public String editUser(@PathVariable(value = "id") long id,
                           @RequestParam String name,
                           @RequestParam String email,
                           @RequestParam String phoneNumber,
                           Model model) {

        User user;
        user = userDAO.getById(id);
        user.setName(name);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        userDAO.save(user);
        return "redirect:/userPage";
    }


    @GetMapping("/orderHistory")
    public String getOrdersList(HttpServletRequest request, Model model,
                                @AuthenticationPrincipal UserDetails currentUser) {
        User user = userDAO.findByUsername(currentUser.getUsername());
        List<Service> services = serviceService.returnAllServices();
        model.addAttribute("services", services);
        List<Order> orders = orderService.returnAllOrdersByUserId(user.getId());
        model.addAttribute("orders", orders);
        return "user/orderHistory";
    }

}
