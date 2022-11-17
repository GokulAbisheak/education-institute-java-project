package com.konoha.questionmanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.konoha.modulemanagement.Module;
import com.konoha.usermanagement.*;

public class QuestionDBUtil {
	
	private Question question;
	
	public static ArrayList<Question> getAllQuestions(int no){
		
		ArrayList<Question> question = new ArrayList<Question>();
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Question WHERE ExamNo = ?");
			//String sql = "SELECT * FROM Question";
			
			stmt.setInt(1, no);
			
			ResultSet rs;
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				int quizno = rs.getInt(1);
				String quiz = rs.getString(2);
				String option1 = rs.getString(3);
				String option2 = rs.getString(4);
				String option3 = rs.getString(5);
				String option4 = rs.getString(6);
				String answer = rs.getString(7);
				int examno = rs.getInt(8);
				
				Question questionObj = new Question(quizno, quiz, option1, option2, option3, option4, answer, examno);
				
				question.add(questionObj);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return question;
	}

	public static boolean addQuestion(int i, int examno, String question, String option1, String option2, String option3, String option4, String answer) {
		boolean success = false;
		
		Connection conn = DBConnection.getDBConnection();
		
		try {

			PreparedStatement stmt = conn.prepareStatement("INSERT INTO Question VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
			
			stmt.setInt(1, i);
			stmt.setString(2, question);
			stmt.setString(3, option1);
			stmt.setString(4, option2);
			stmt.setString(5, option3);
			stmt.setString(6, option4);
			stmt.setString(7, answer);
			stmt.setInt(8, examno);
			
			int returnValue = stmt.executeUpdate();
			
			if(returnValue != 0) {
				success = true;
			} else {
				success = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return success;
	}

	public Question getQuestionByNo(int no) {
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Question WHERE QuestionNo = ?");
			
			stmt.setInt(1, no);
			
			ResultSet rs;
			
			rs = stmt.executeQuery();
			
			while(rs.next())
			{
				int QuestionNo = rs.getInt("QuestionNo");
				int ExamNo  = rs.getInt("ExamNo");
				String Question = rs.getString("Question");
				String Option1 = rs.getString("Option1");
				String Option2 = rs.getString("Option2");
				String Option3 = rs.getString("Option3");
				String Option4 = rs.getString("Option4");
				String Answer = rs.getString("Answer");
			
				question = new Question(QuestionNo, Question, Option1, Option2, Option3, Option4, Answer, ExamNo);
			
			}
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return question;
	}

	public static boolean updateQuestion(int questionno, int examno, String question2, String option1, String option2, String option3, String option4, String answer) {
		
		boolean success = false;
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("UPDATE Question SET QuestionNo = ?, Question = ?, Option1 = ?,Option2 = ?, Option3 = ?, Option4 = ?, Answer = ?, ExamNo = ? WHERE QuestionNo = ?");
			
			stmt.setInt(1, questionno);
			stmt.setString(2, question2);
			stmt.setString(3, option1);
			stmt.setString(4, option2);
			stmt.setString(5, option3);
			stmt.setString(6, option4);
			stmt.setString(7, answer);
			stmt.setInt(8, examno);
			stmt.setInt(9, questionno);
			
			int returnValue = stmt.executeUpdate();
			
			if(returnValue != 0) {
				success = true;
			} else {
				success = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return success;
	}

	public static boolean attemptExam(String q1, String q2, String q3, int doneby) {
		
		boolean success = false;
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO Attempt VALUES (0, ?, ?, ?, ?)");
			
			stmt.setString(1, q1);
			stmt.setString(2, q2);
			stmt.setString(3, q3);
			stmt.setInt(4, doneby);
			
			int returnValue = stmt.executeUpdate();
			
			if(returnValue != 0) {
				success = true;
			} else {
				success = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return success;
		
	}

	public void deleteQuestion(String id) {
		
		Connection conn = DBConnection.getDBConnection();
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM Question WHERE QuestionNo = ?");
			
			stmt.setString(1, id);
			
			stmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
