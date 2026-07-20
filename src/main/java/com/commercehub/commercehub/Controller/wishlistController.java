package com.commercehub.commercehub.Controller;


import com.commercehub.commercehub.Model.wishlist;
import com.commercehub.commercehub.Service.wishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Controller
@CrossOrigin("*")
@RequestMapping("/api/wishlist")
public class wishlistController
{
    @Autowired
    private wishlistService wishlistService;

    @GetMapping("/get/{userid}")
    public List<wishlist> getitems(@PathVariable Long userid)
    {
        return wishlistService.getdata(userid);
    }
    @PostMapping("/add/{userId}")
    public wishlist addWishlist(@PathVariable Long userId,
                                @RequestParam Long productId) {

        return wishlistService.addWishlist(userId, productId);
    }
    @DeleteMapping("/remove/{userId}")
    public String removeWishlist(@PathVariable Long userId,
                                 @RequestParam Long productId) {

        wishlistService.removeWishlist(userId, productId);
        return "Product removed from wishlist";
    }
}
