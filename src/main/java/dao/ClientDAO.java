package dao;
import entity.Client;
import entity.Roles;
import exceptions.DbExceptions;

import java.sql.*;

public class ClientDAO {
    private static Client setClient(ResultSet rs) throws SQLException {
        int k = 0;
        return new Client.Builder()
                .setId(rs.getInt(++k))
                .setSurname(rs.getString("surname"))
                .setName(rs.getString("name"))
                .setEmail(rs.getString("email"))
                .setPhone(rs.getString("phone"))
                .setPassword(rs.getString("password"))
                .setStatus(rs.getString("status")).getClient();
    }

    public void loadDriver() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("src");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public String save(Client client) {
        loadDriver();
        //String sqlSelectAllPersons="create table client(id INT PRIMARY KEY ,surname varchar(100),name varchar(100),email varchar(100),phone varchar(100),password varchar(100),status varchar(100),UNIQUE (email))";
        String result=null;
        String connectionUrl = "jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC";
        try (Connection con = DriverManager.getConnection(connectionUrl, "root", "xhz2woVLxhz2woVL");) {
            result = "data added successfully";
            System.out.println("connection");
            //String query = "іnsert into client values(?,?,?,?,?,?);";
            String query="insert into client (surname,name,email,phone,password,status) values (?,?,?,?,?,?)";
            PreparedStatement pst = null;
            try {
                pst = con.prepareStatement(query);
                System.out.println("prepare statement");
                pst.setString(1, client.getSurname());
                System.out.println("set");
                pst.setString(2, client.getName());
                pst.setString(3, client.getEmail());
                pst.setString(4, client.getPhone());
                pst.setString(5, client.getPassword());
                String role=null;
                if(client.getStatus().equals(Roles.MANAGER.name())){
                    role=Roles.MANAGER.name();
                }
                else {
                    role=Roles.CLIENT.name();
                }
                pst.setString(6, role);
                System.out.println(client.getStatus());
                pst.executeUpdate();
                System.out.println("execute");
            } catch (SQLException e) {
                printSQLException(e);
            }

        } catch (SQLException ex) {
            printSQLException(ex);
        }return result;
    }

    public Client login(Client client){
        boolean status=false;
        loadDriver();
        String result=null;
        String connectionUrl = "jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC";
        try (Connection con = DriverManager.getConnection(connectionUrl, "root", "xhz2woVLxhz2woVL");) {
            result = "data added successfully";
            PreparedStatement pst=con.prepareStatement("select * from client where email=? and password=?");
                pst.setString(1, client.getEmail());
                pst.setString(2,client.getPassword());
                System.out.println(pst);
                try(ResultSet rs=pst.executeQuery()) {
                    if (!rs.next()) return null;
                    return setClient(rs);
                }
        }catch (Exception e){
            throw new RuntimeException();
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
