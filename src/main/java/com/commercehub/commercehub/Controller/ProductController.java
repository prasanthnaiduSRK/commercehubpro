package com.commercehub.commercehub.Controller;


import com.commercehub.commercehub.Model.products;
import com.commercehub.commercehub.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Controller
@RequestMapping("/api/products")
@CrossOrigin("*")
public class ProductController
{

    @Autowired
    private ProductService productService;

    @GetMapping("/get")
    public List<products> getitems()
    {
        return productService.getall();
    }

    @GetMapping("/search")
    public List<products> searchProducts(@RequestParam String keyword){

        return productService.searchProducts(keyword);

    }

}
