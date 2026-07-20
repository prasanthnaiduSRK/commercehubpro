package com.commercehub.commercehub.Service;
import com.commercehub.commercehub.Model.User;
import com.commercehub.commercehub.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService
{

    @Autowired
    private UserRepo userRepo;
    public User save(User user)
    {
        User user1= new User();
        user.setName(user.getName());
        user.setEmail(user.getEmail());
        user.setPassword(user.getPassword());
        user.setCreatedat(user.getCreatedat());
        return userRepo.save(user);
    }

    public User login(String name, String email, String password)
    {
        User user = userRepo.findByEmail(email);
        if(user !=null &&
                user.getName().equals(name) &&
                 user.getEmail().equals(email) &&
                   user.getPassword().equals(password));
        return user;
    }
}
