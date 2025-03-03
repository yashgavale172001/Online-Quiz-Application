package com.qsp;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Questions 
{
   @Id
   int Id;
   String Difficulty_Level;
   String Question;
   String Option1;
   String Option2;
   String Option3;
   String Option4;
   String Ans;
   
   public Questions()
   {
	   
   }

public int getId() {
	return Id;
}

public void setId(int id) {
	Id = id;
}

public String getDifficulty_Level() {
	return Difficulty_Level;
}

public void setDifficulty_Level(String difficulty_Level) {
	Difficulty_Level = difficulty_Level;
}

public String getQuestion() {
	return Question;
}

public void setQuestion(String question) {
	Question = question;
}

public String getOption1() {
	return Option1;
}

public void setOption1(String option1) {
	Option1 = option1;
}

public String getOption2() {
	return Option2;
}

public void setOption2(String option2) {
	Option2 = option2;
}

public String getOption3() {
	return Option3;
}

public void setOption3(String option3) {
	Option3 = option3;
}

public String getOption4() {
	return Option4;
}

public void setOption4(String option4) {
	Option4 = option4;
}

public String getAns() {
	return Ans;
}

public void setAns(String ans) {
	Ans = ans;
}
   
   
}
