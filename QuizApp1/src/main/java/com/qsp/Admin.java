package com.qsp;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Admin 
{
   @Id
   String UserName;
   String Password;
   
   public Admin()
   {
	   
   }

public String getUserName() {
	return UserName;
}

public void setUserName(String userName) {
	UserName = userName;
}

public String getPassword() {
	return Password;
}

public void setPassword(String password) {
	Password = password;
}
   
}
