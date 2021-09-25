package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.Category;
import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.repository.CategoryDAO;
import com.finaproject.logistic.repository.UserDAO;
import com.finaproject.logistic.service.interfaces.UserRepository;
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
import java.util.Optional;

@Controller
//@RequestMapping("/user")
public class UserController {

    private UserDAO userDAO;
    private CategoryDAO categoryDAO;

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
//        Iterable<Category> categories = categoryDAO.findAll();
//        model.addAttribute("categories", categories);
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

        User user = userDAO.findById(id).orElseThrow();
        user.setName(name);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        userDAO.save(user);
        return "redirect:/userPage";
    }


}
