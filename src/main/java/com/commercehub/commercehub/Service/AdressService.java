package com.commercehub.commercehub.Service;

import com.commercehub.commercehub.Model.Adress;
import com.commercehub.commercehub.Model.User;
import com.commercehub.commercehub.repo.AdressRepo;
import com.commercehub.commercehub.repo.UserRepo;
import jakarta.websocket.server.ServerEndpoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdressService
{
    @Autowired
    private AdressRepo adressRepo;
    @Autowired
    private UserRepo userRepo;

    public List<Adress> getadress(Long userid)
    {
        User user = userRepo.findById(userid).orElseThrow(()
                -> new RuntimeException("user not found"));

            return adressRepo.findByuser(user);
    }

    public Adress addAddress(Long userId, Adress adress)
    {
        User user = userRepo.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Adress address1 = new Adress();

        address1.setAddressLine1(adress.getAddressLine1());
        address1.setAddressLine2(adress.getAddressLine2());
        address1.setCountry(adress.getCountry());
        address1.setCity(adress.getCity());
        address1.setState(adress.getState());
        address1.setPincode(adress.getPincode());
        address1.setPhone(adress.getPhone());
        address1.setFullName(adress.getFullName());
        address1.setUser(user);
        address1.setCreatedAt(address1.getCreatedAt());

        return adressRepo.save(address1);
    }
}
