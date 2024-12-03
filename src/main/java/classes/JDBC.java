package classes;
import java.sql.*;

public class JDBC {
    Connection conn;
    Statement stmt;
    public boolean isConnected;
    public String message;
    
    public JDBC(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/test_servlet", "root", ""
            );
            stmt = conn.createStatement();
            isConnected = true;
            message = "DB Connected";
        }catch(Exception e){
            isConnected = false;
            message = e.getMessage();
        }
    }
    
    public void disconnect(){
        try{
            stmt.close();
            conn.close();
            message = "DB disconnected";
        }catch(Exception e){
            message = e.getMessage();
        }
    }
    
    public void runQuery(String query){
        try {
            int result = stmt.executeUpdate(query);
            message = "info: " + result + " rows affected";
            System.out.println(message);
        } catch (Exception e){
            message = e.getMessage();
            System.out.println(message);
        }
    }
    
    public ResultSet getData(String query){
        ResultSet rs = null;
        try{
            rs = stmt.executeQuery(query);
        } catch (Exception e){
            message = e.getMessage();
        }
        return rs;
    }
}
