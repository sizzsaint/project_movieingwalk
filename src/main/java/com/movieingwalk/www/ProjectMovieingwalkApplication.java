package com.movieingwalk.www;

import java.nio.charset.Charset;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.filter.CharacterEncodingFilter;

@SpringBootApplication
@EnableAutoConfiguration
@MapperScan(basePackages="com.movieingwalk.www")
public class ProjectMovieingwalkApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectMovieingwalkApplication.class, args);
	}
	@Bean //인코딩
	public HttpMessageConverter<String> responseBConverter(){
		
		return new StringHttpMessageConverter(Charset.forName("UTF-8"));
	}
	//인코딩때문에
	public CharacterEncodingFilter characterEncodingFilter() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		return characterEncodingFilter;
	}

}
