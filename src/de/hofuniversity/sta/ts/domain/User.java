package de.hofuniversity.sta.ts.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Entity;


//Annotation for hibernate
@Entity
@Table(name = "users")

public class User {
	
	//user id
	@Id
	@Column (name = "userid")
	//genereted auto
	@GeneratedValue
	private Integer userid;
	
	//email is used as username
	@Column (name = "email")
	private String email;
	
	@Column (name = "password")
	private String password;
		
	
	@Column (name = "regDate")
	private Date regDate;
	

}
