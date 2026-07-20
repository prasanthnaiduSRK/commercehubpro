package com.commercehub.commercehub.Controller;


import com.commercehub.commercehub.Model.orderitems;
import com.commercehub.commercehub.Service.OrderService;
import jakarta.persistence.Column;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Controller
@RequestMapping("/api/orders")
@CrossOrigin("*")
public class orderitemscontroller
{

    @Autowired
    private OrderService orderService;

    @GetMapping("/get/{userid}")
    public List<orderitems> getitems(@PathVariable Long userid)
    {
        return orderService.getitems(userid);
    }

    @PostMapping("/add")
    public ResponseEntity<String> addOrder(
            @RequestParam Long userId,
            @RequestParam Long productId,
            @RequestParam Long addressId,
            @RequestParam Integer quantity) {

        orderService.addOrder(userId, productId, addressId, quantity);

        return ResponseEntity.ok("Order Placed Successfully");
    }
}
