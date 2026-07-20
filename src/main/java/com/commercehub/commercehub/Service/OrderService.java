package com.commercehub.commercehub.Service;

import com.commercehub.commercehub.Model.Adress;
import com.commercehub.commercehub.Model.User;
import com.commercehub.commercehub.Model.orderitems;
import com.commercehub.commercehub.Model.products;
import com.commercehub.commercehub.repo.AdressRepo;
import com.commercehub.commercehub.repo.OrdersRepo;
import com.commercehub.commercehub.repo.ProductRepo;
import com.commercehub.commercehub.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService
{
    @Autowired
    private OrdersRepo ordersRepo;
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private AdressRepo adressRepo;
    @Autowired
    private ProductRepo productRepo;


    public List<orderitems> getitems(Long userid)
    {
        User user = userRepo.findById(userid).orElseThrow(()
                -> new RuntimeException("User Not Found"));

//        products product = productRepo.findById(productid)
//                .orElseThrow(() -> new RuntimeException("Product Not Found"));

        return ordersRepo.findByUser(user);
    }

    public orderitems addOrder(Long userId,
                                   Long productId,
                                   Long addressId,
                                   Integer quantity)
    {
        User user = userRepo.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        products product = productRepo.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        Adress address = adressRepo.findById(addressId)
                .orElseThrow(() -> new RuntimeException("Address not found"));

        orderitems item = new orderitems();

        item.setUser(user);
        item.setProduct(product);
        item.setShippingAddress(address);
        item.setQuantity(quantity);
        item.setPrice(product.getPrice());
        item.setSubtotal(product.getPrice() * quantity);

        return ordersRepo.save(item);
    }
}
