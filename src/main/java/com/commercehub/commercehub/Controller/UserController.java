package com.commercehub.commercehub.Controller;

import com.commercehub.commercehub.Model.User;
import com.commercehub.commercehub.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@Controller
@CrossOrigin("*")
@RequestMapping("/api/user")
public class UserController
{
    @Autowired
    private UserService userService;

    @PostMapping("/Signup")
    public User signup(@RequestBody User user)
    {
        return userService.save(user);
    }

    @PostMapping("/login")
    public User login(@RequestBody User user)
    {
        User loggeduser = userService.login
                (user.getName(),
                user.getEmail(),
                user.getPassword());


        return loggeduser;
    }

}
