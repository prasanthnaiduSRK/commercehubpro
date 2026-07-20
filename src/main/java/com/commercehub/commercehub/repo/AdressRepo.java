package com.commercehub.commercehub.repo;


import com.commercehub.commercehub.Model.Adress;
import com.commercehub.commercehub.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdressRepo extends JpaRepository<Adress,Long>
{

    List<Adress> findByuser(User user);
}
