package com.finaproject.logistic.controller;

import com.finaproject.logistic.entity.Category;
import com.finaproject.logistic.repository.CategoryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Optional;

@Controller
public class CategoryController {

    private CategoryDAO categoryDAO;

    @Autowired
    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @GetMapping("/addCategory")
    public String addCategoryPage(Model model) {
        return "admin/addCategory";
    }

    @PostMapping("/addCategory")
    public String addCategory(@RequestParam String name,
                              @RequestParam String description,
                              @RequestParam String image, Model model) {
        Category category = new Category(name, description, image);
        categoryDAO.save(category);
        return "redirect:/main";

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
    public String deleteCategory(@PathVariable(value = "id") long id, Model model) {
        Category category = categoryDAO.getById(id);
        categoryDAO.delete(category);
        return "redirect:/main";
    }
}
