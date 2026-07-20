package com.commercehub.commercehub.Service;


import com.commercehub.commercehub.Model.User;
import com.commercehub.commercehub.Model.products;
import com.commercehub.commercehub.Model.wishlist;
import com.commercehub.commercehub.repo.ProductRepo;
import com.commercehub.commercehub.repo.UserRepo;
import com.commercehub.commercehub.repo.wishlistRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class wishlistService
{
    @Autowired
    private wishlistRepo wishlistRepo;
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private ProductRepo productRepo;


    public List<wishlist> getdata(Long userId)
    {
        User user = userRepo.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        return wishlistRepo.findByUser(user);
    }
    public wishlist addWishlist(Long userId, Long productId) {

        User user = userRepo.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        products product = productRepo.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        wishlist wishlist = wishlistRepo.findByUserAndProduct(user,product);

        if (wishlist != null)
        {
            return wishlist;
        }

        wishlist = new wishlist();
        wishlist.setUser(user);
        wishlist.setProduct(product);

        return wishlistRepo.save(wishlist);
    }

    public void removeWishlist(Long userId, Long productId)
    {
        User user = userRepo.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        products product = productRepo.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        wishlist wishlist = wishlistRepo.findByUserAndProduct(user, product);

        if (wishlist == null) {
            throw new RuntimeException("Wishlist item not found");
        }

        wishlistRepo.delete(wishlist);
    }
}
