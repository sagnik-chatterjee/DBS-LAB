package application;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.scene.control.TextField;
import javafx.application.Platform;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class SampleController {

    @FXML
    private Button exitButton;

    @FXML
    private Button instructorButton;

    @FXML
    private Button deptButton;

    @FXML
    void exit() {
    	Platform.exit();
    	System.exit(0);
    }

    @FXML
    void show_i() {
		try 
		{
			AnchorPane root = (AnchorPane)FXMLLoader.load(getClass().getResource("sample.fxml"));
			Stage stg = new Stage();
			Scene scene = new Scene(root,400,400);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			stg.setScene(scene);
			stg.show();
		} 
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }

    @FXML
    void show_d() {
		try 
		{
			AnchorPane root = (AnchorPane)FXMLLoader.load(getClass().getResource("sample1.fxml"));
			Stage stg = new Stage();
			Scene scene = new Scene(root,400,400);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			stg.setScene(scene);
			stg.show();
		} 
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
}
