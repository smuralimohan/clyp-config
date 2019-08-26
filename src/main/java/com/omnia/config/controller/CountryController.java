package com.omnia.config.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.omnia.config.model.Country;
import com.omnia.config.repository.CountryRepository;

@RestController
public class CountryController {

	private final CountryRepository countryRepository;

	public CountryController(CountryRepository countryRepository) {
		this.countryRepository = countryRepository;
	}

	@GetMapping("/countries")
	public List<Country> getCountries() {
		return this.countryRepository.findAll();
	}
	
	@PutMapping("/country")
	public List<Country> addCountry() {
		return this.countryRepository.findAll();
	}
}
