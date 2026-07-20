package com.commercehub.commercehub.repo;

import com.commercehub.commercehub.Model.User;
import com.commercehub.commercehub.Model.cartitems;
import com.commercehub.commercehub.Model.products;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartitemsRepo extends JpaRepository<cartitems,Long>
{

    List<cartitems> findByUser(User user);
    cartitems findByUserAndProduct(User user, products product);
}
