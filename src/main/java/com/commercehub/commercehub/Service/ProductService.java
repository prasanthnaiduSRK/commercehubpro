package com.commercehub.commercehub.Service;


import com.commercehub.commercehub.Model.products;
import com.commercehub.commercehub.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService
{
    @Autowired
    private ProductRepo productRepo;

    public List<products> getall()
    {
        return productRepo.findAll();
    }

    public List<products> searchProducts(String keyword){

        return productRepo.Searchproducts(keyword);

    }
}
