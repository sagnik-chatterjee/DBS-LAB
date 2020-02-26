package application;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.control.Button;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;

import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.application.Platform;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;



public class Sample1Controller {

    @FXML
    private TextField tf3;

    @FXML
    private Button ButtonModify;

    @FXML
    private TextField tf2;

    @FXML
    private Button ButtonClear;

    @FXML
    private Button ButtonDelete;

    @FXML
    private Button ButtonAdd;

    @FXML
    private TextField tf1;

    @FXML
    void addRecord() {
    	try {
    		Connection conn = dbConnect();
    		String s1 = tf1.getText();
    		String s2 = tf2.getText();
    		
    		int b = Integer.parseInt(tf3.getText());
    		
    		PreparedStatement ps = conn.prepareStatement("insert into department values ( ' " + s1 + " ', ' " + s2 + "', " + b + ")" );	
    		ps.execute();
    		System.out.println("Inserted!");
    		conn.close();    	
    	}
    	
    	catch (Exception e) {
    		System.out.println(e);
    	}
    }

    @FXML
    void modifyRecord() {

    }

    @FXML
    void clearTfs() {
    	tf1.setText("");
    	tf2.setText("");
    	tf3.setText("");
    }

    @FXML
    void deleteRecord() {

    }
    
    static Connection dbConnect() {
    	Connection con = null;
    	try {
    		Class.forName("oracle.jbc.driver.OracleDriver");
    		con = DriverManager.getConnection("jbc:oracle:thin:@172..16.57.4:1521:orcl2", "b2dbsl20", "b2dbsl20");
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return con;
    }

}
