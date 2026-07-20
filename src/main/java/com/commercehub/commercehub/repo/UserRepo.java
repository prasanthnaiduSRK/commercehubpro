package com.commercehub.commercehub.repo;

import com.commercehub.commercehub.Model.User;
import com.commercehub.commercehub.Model.cartitems;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepo extends JpaRepository<User,Long>
{
    User findByEmail(String email);
    //List<cartitems> findByUser(User user);
}
