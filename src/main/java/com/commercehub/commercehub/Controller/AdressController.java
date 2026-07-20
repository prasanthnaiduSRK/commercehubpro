package com.commercehub.commercehub.Controller;


import com.commercehub.commercehub.Model.Adress;
import com.commercehub.commercehub.Service.AdressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@Controller
@RequestMapping("/api/address")
public class AdressController
{
    @Autowired
    private AdressService adressService;

    @GetMapping("/get/{userid}")
    public List<Adress> getadress(@RequestParam Long userid)
    {
        return adressService.getadress(userid);
    }
    @PostMapping("/add/{userId}")
    public Adress addAddress(@PathVariable Long userId,
                             @RequestBody Adress adress)
    {
        return adressService.addAddress(userId, adress);
    }
}
