package com.commercehub.commercehub.repo;

import com.commercehub.commercehub.Model.categories;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepo extends JpaRepository<categories,Long>
{

}
