package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.Category;
import com.finaproject.logistic.repository.CategoryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class MainController {

    private CategoryDAO categoryDAO;

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @GetMapping("/")
    public String main(Model model) {
        List<Category> categories= categoryDAO.findAll();
        model.addAttribute("categories",categories);
        return "start";
    }

    @GetMapping("/403")
    public String accessDenied(){
        return "403";
    }
}
