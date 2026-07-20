package com.commercehub.commercehub.Service;


import com.commercehub.commercehub.Model.User;
import com.commercehub.commercehub.Model.cartitems;
import com.commercehub.commercehub.Model.products;
import com.commercehub.commercehub.repo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartitemsService
{
    @Autowired
    private CartitemsRepo cartitemsRepo;
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private ProductRepo productRepo;


    public cartitems addToCart(Long userId, Long productId)
    {
        User user = userRepo.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        products products = productRepo.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        cartitems cartItem = cartitemsRepo.findByUserAndProduct(user, products);

        if (cartItem != null)
        {
            cartItem.setQuantity(cartItem.getQuantity() + 1);
            cartItem.setSubtotal(cartItem.getQuantity() * cartItem.getPrice());
        }
        else
        {
            cartItem = new cartitems();
            cartItem.setProduct(products);
            cartItem.setQuantity(1);
            cartItem.setUser(user);
            cartItem.setPrice(products.getPrice());
            cartItem.setSubtotal(products.getPrice());
        }
        return cartitemsRepo.save(cartItem);
    }

    public List<cartitems> getCart(Long userId)
    {
        User user = userRepo.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        return cartitemsRepo.findByUser(user);
    }

    public cartitems update(Long id, int change)
    {
        cartitems cartitems = cartitemsRepo.findById(id).orElseThrow();
        int newquantity = cartitems.getquantity() + change;

        if(newquantity<=0)
        {
            cartitemsRepo.deleteById(id);
            return null;
        }
        cartitems.setQuantity(newquantity);
        cartitems.setSubtotal(newquantity * cartitems.getSubtotal());
        return cartitemsRepo.save(cartitems);
    }
}