package com.commercehub.commercehub.repo;


import com.commercehub.commercehub.Model.User;
import com.commercehub.commercehub.Model.orderitems;
import com.commercehub.commercehub.Model.products;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrdersRepo extends JpaRepository<orderitems, Long> {

    List<orderitems> findByUser(User user);

    List<orderitems> findByUserAndProduct(User user, products product);

}
