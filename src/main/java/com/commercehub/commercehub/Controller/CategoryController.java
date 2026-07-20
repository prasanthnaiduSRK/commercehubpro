package com.commercehub.commercehub.Controller;


import com.commercehub.commercehub.Model.categories;
import com.commercehub.commercehub.Service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Controller
@RequestMapping("/api/categories")
public class CategoryController
{
    @Autowired
    private CategoryService categoryService;

    @GetMapping("/get")
    public List<categories> getitems()
    {
        return categoryService.getitems();
    }
}
