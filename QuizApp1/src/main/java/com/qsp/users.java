package com.qsp;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class users 
{
   @Id
   String user_name;
   String email;
   String password;
   int Highest_Score;
   int Medium_High_Score;
   int Hard_High_Score;
   public users()
   {
	   
   }
   
public int getMedium_High_Score() {
	return Medium_High_Score;
}

public void setMedium_High_Score(int medium_High_Score) {
	Medium_High_Score = medium_High_Score;
}

public int getHard_High_Score() {
	return Hard_High_Score;
}

public void setHard_High_Score(int hard_High_Score) {
	Hard_High_Score = hard_High_Score;
}

public int getHighest_Score() {
	return Highest_Score;
}

public void setHighest_Score(int highest_Score) {
	Highest_Score = highest_Score;
}

public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
   
   
}

