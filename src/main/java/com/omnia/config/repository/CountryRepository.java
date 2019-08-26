package com.omnia.config.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.omnia.config.model.Country;

@Repository
public interface CountryRepository extends JpaRepository<Country, String> {
    
     List<Country> findAll(); 
     
     Optional<Country> findByIso(String iso);
     
     Country save(Country entity);
     
     void delete(Country entity);
     
}
