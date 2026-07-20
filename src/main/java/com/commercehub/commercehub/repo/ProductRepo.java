package com.commercehub.commercehub.repo;

import com.commercehub.commercehub.Model.products;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepo extends JpaRepository<products,Long>
{

    @Query("SELECT p FROM products p WHERE " +
            "LOWER(p.productName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +

            "LOWER(p.category.categoryname) LIKE LOWER(CONCAT('%', :keyword, '%'))"
    )
    List<products> Searchproducts(String keyword);
}

//@Query("""
//SELECT p FROM products p
//WHERE LOWER(p.productName) LIKE LOWER(CONCAT('%', :keyword, '%'))
//OR LOWER(p.brand) LIKE LOWER(CONCAT('%', :keyword, '%'))
//OR LOWER(p.category.categoryname) LIKE LOWER(CONCAT('%', :keyword, '%'))
//""")
//List<products> searchProducts(@Param("keyword") String keyword);