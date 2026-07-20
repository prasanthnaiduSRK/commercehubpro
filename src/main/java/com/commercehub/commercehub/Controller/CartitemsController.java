package com.commercehub.commercehub.Controller;


import com.commercehub.commercehub.Model.cartitems;
import com.commercehub.commercehub.Service.CartitemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Controller
@RequestMapping("/api/cartitems")
@CrossOrigin("*")
public class CartitemsController
{

    @Autowired
    private CartitemsService cartitemsService;


    @GetMapping("/get/{userId}")
    public List<cartitems> getCart(@PathVariable Long userId)
    {
        return cartitemsService.getCart(userId);
    }
    @PostMapping("/add/{userId}")
    public cartitems addToCart(@PathVariable Long userId,
                               @RequestParam Long productId)
    {
        return cartitemsService.addToCart(userId, productId);
    }
    @PutMapping("/update/{id}")
    public cartitems update(@PathVariable Long id,
                            @RequestParam int change)
    {
        return cartitemsService.update(id,change);
    }
}
