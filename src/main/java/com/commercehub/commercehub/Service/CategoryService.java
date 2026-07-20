package com.commercehub.commercehub.Service;

import com.commercehub.commercehub.Model.categories;
import com.commercehub.commercehub.repo.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService
{

    @Autowired
    private CategoryRepo categoryrepo;

    public List<categories> getitems()
    {
        return  categoryrepo.findAll();
    }
}
