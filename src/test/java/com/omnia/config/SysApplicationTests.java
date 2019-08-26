package com.omnia.config;


import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.is;
import static org.junit.Assume.assumeThat;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;

import com.omnia.config.model.Country;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT, classes = { SysApplication.class }, properties = {
		"spring.datasource.url=jdbc:postgresql://localhost:5432/clyp",
		"spring.datasource.username=clyp",
		"spring.datasource.password=clyp",
		"spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect",
		"spring.jpa.hibernate.ddl-auto=update",
		"spring.jpa.properties.hibernate.jdbc.lob.non_contextual_creation=true"
		
})
public class SysApplicationTests {

	@Test
	public void contextLoads() {
	}

	@Autowired
	private TestRestTemplate testRestTemplate;

	//@Autowired
	//private JdbcTemplate jdbcTemplate;

//	@BeforeClass
//	public static void checkToRun() {
//		assumeThat(
//				"SQL sample integration tests are disabled. Please use '-Dit.cloudsql=true' "
//						+ "to enable them. ",
//				System.getProperty("it.cloudsql"), is("true"));
//	}

	//@After
	//public void clearTable() {
	//	this.jdbcTemplate.execute("DROP TABLE IF EXISTS users");
	//}

	@Test
	public void testSqlRowsAccess() {
		ResponseEntity<List<Country>> result = this.testRestTemplate.exchange(
				"/countries", HttpMethod.GET, null, new ParameterizedTypeReference<List<Country>>() {
				});

		assertThat(result.getBody()).hasSize(253);
	}
}
