package com.commercehub.commercehub.repo;


import com.commercehub.commercehub.Model.User;
import com.commercehub.commercehub.Model.products;
import com.commercehub.commercehub.Model.wishlist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface wishlistRepo extends JpaRepository<wishlist,Long>
{
    List<wishlist> findByUser(User user);
    wishlist findByUserAndProduct(User user, products product);
}
