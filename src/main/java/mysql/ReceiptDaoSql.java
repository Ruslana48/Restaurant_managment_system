package mysql;
import dao.DAO;
import dao.OrderDao;
import entity.Dish;
import entity.Order;
import exceptions.DbExceptions;
import util.SqlUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReceiptDaoSql implements OrderDao {
    public static Order setOrder(ResultSet rs) throws SQLException{
        return new Order.Builder().setId(rs.getInt("id"))
                .setUserId(rs.getInt("user_id"))
                .setStatusId(rs.getInt("status_id"))
                .setTotal(rs.getLong("total"))
                .setManagerId(rs.getInt("manager_id"))
                .setCreateDate(rs.getTimestamp("create_date"))
                .getOrder();
    }

    @Override
    public void changeStatus(int order_id, int statusId, int managerId) throws DbExceptions {
        String connectionUrl = "jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC";
        try (Connection con = DriverManager.getConnection(connectionUrl, "root", "xhz2woVLxhz2woVL");) {
            PreparedStatement ps = con.prepareStatement("UPDATE receipt SET status_id = ?, manager_id=? WHERE id = ?");
            int k = 0;
            ps.setInt(++k, statusId);
            ps.setInt(++k, managerId);
            ps.setInt(++k, order_id);
            if(ps.executeUpdate()==0){
                throw new SQLException("no row attached");
            }
        }catch (SQLException e){
            throw new DbExceptions("cannot change", e);
        }
    }

//    @Override
//    public List<Order> getClientOrders(int user_id) throws DbExceptions {
//        List<Order>orders=new ArrayList<>();
//        String connectionUrl = "jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC";
//        try (Connection con = DriverManager.getConnection(connectionUrl, "root", "xhz2woVLxhz2woVL");) {
//            PreparedStatement ps=con.prepareStatement("select * from receipt where user_id =?");
//            ps.setLong(1, user_id);
//            try (ResultSet rs=ps.executeQuery()){
//                while (rs.next()){
//                    Order order=setOrder(rs);
//                    order.setDishes(getDishesByOrderIndex((int) order.getId()));
//                    orders.add(order);
//                }
//            }
//            return orders;
//        }catch (SQLException e){
//            throw new DbExceptions("Cannot get client orders", e);
//        }
//    }

    public List<Order.Dish>getDishesByOrderIndex(int order_id) {
        List<Order.Dish> dishes = new ArrayList<>();
        String connectionUrl = "jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC";
        try (Connection con = DriverManager.getConnection(connectionUrl, "root", "xhz2woVLxhz2woVL");) {
            PreparedStatement ps = con.prepareStatement(SqlUtils.GET_DISHES_BY_ORDER_INDEX);
            ps.setInt(1, order_id);
            try (ResultSet rs=ps.executeQuery()){
                while (rs.next()){
                    Order.Dish dish=new Order.Dish.Builder()
                            .setId(rs.getInt("id"))
                            .setName(rs.getString("name"))
                            .setPrice(rs.getInt("price"))
                            .setCount(rs.getInt("count"))
                            .getDish();
                    dishes.add(dish);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dishes;
    }

    @Override
    public List<Order> getAllClientOrder(int clientId)throws DbExceptions{
        List<Order>orders=new ArrayList<>();
        String connectionUrl = "jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC";
        try(Connection con =ConnectionPool.getInstance().getConnection();){
            PreparedStatement ps=con.prepareStatement(SqlUtils.GET_ALL_CLIENT_ORDERS);
            ps.setInt(1, clientId);
            ResultSet rs=ps.executeQuery();
            while (rs.next()){
                Order order=setOrder(rs);
                order.setDishes(getDishesByOrderIndex((int) order.getId()));
                orders.add(order);
            }
            return orders;
        }
        catch (SQLException ex) {
            throw new DbExceptions("Cannot get all client orders", ex);
        }
    }

    @Override
    public List<Order> getAllOrders() throws DbExceptions {
        List<Order>orders=new ArrayList<>();
        try(Connection con =ConnectionPool.getInstance().getConnection();){
            PreparedStatement ps=con.prepareStatement(SqlUtils.GET_ALL_ORDERS);
            ResultSet rs=ps.executeQuery();
                while (rs.next()){
                    Order order=setOrder(rs);
                    order.setDishes(getDishesByOrderIndex((int) order.getId()));
                    orders.add(order);
                }
                return orders;
            }
        catch (SQLException ex) {
            throw new DbExceptions("Cannot get all client orders", ex);
        }
    }

    public List<Dish> getAllDishesFromOneUser(int clientId) throws DbExceptions{
        List<Dish> allDishes=new ArrayList<>();
        String connectionUrl = "jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC";
        try (Connection con = DriverManager.getConnection(connectionUrl, "root", "xhz2woVLxhz2woVL");) {
            PreparedStatement ps = con.prepareStatement("select dish_id, count from cart_has_dish3 where client_id=?");
            ps.setLong(1, clientId);
            System.out.println("ps");
            try(ResultSet rs=ps.executeQuery()) {
                System.out.println("rs");
                while (rs.next()) {
                    allDishes.add(DAO.getDao().getDishDao().getDishById(rs.getInt("dish_id")));
                    System.out.println("alldishes");
                    System.out.println(allDishes);
                }
            }
            return allDishes;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Dish> getAllOrderDishes(int clientId) throws DbExceptions{
        List<Dish> allDishes=new ArrayList<>();
        String connectionUrl = "jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC";
        try (Connection con = DriverManager.getConnection(connectionUrl, "root", "xhz2woVLxhz2woVL");) {
            PreparedStatement ps = con.prepareStatement("select dish_id, count from receipt_has_dish where receipt_id=?");
            ps.setInt(1, clientId);
            System.out.println("ps");
            try(ResultSet rs=ps.executeQuery()) {
                System.out.println("rs");
                while (rs.next()) {
                    allDishes.add(DAO.getDao().getDishDao().getDishById(rs.getInt("dish_id")));
                    System.out.println("alldishes");
                    System.out.println(allDishes);
                }
            }
            return allDishes;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Order> getAcceptedOrders(int manager_id) throws DbExceptions {
        List<Order>orders=new ArrayList<>();
        String connectionUrl = "jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC";
        try (Connection con = DriverManager.getConnection(connectionUrl, "root", "xhz2woVLxhz2woVL");) {
            PreparedStatement ps=con.prepareStatement("select * from receipt where manager_id = ?");
            ps.setLong(1, manager_id);
            try(ResultSet rs=ps.executeQuery()) {
                while (rs.next()) {
                    Order order = setOrder(rs);
                    order.setDishes(getDishesByOrderIndex((int) order.getId()));
                    orders.add(order);
                }
            }
            return orders;
        }
        catch (SQLException ex) {
            throw new DbExceptions("Cannot get all orders approved by manager", ex);
        }
    }

    @Override
    public List<Order> getNewOrders() throws DbExceptions {
        List<Order>orders=new ArrayList<>();
        String connectionUrl = "jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC";
        try (Connection con = DriverManager.getConnection(connectionUrl, "root", "xhz2woVLxhz2woVL");) {
            PreparedStatement ps=con.prepareStatement("select * from receipt where manager_id is null");
            ResultSet rs=ps.executeQuery();
            while (rs.next()){
                Order order=setOrder(rs);
                order.setDishes(getDishesByOrderIndex((int) order.getId()));
                orders.add(order);
            }
            return orders;
        }
        catch (SQLException ex) {
            throw new DbExceptions("Cannot get all new orders", ex);

        }
    }

    @Override
    public  int getOrderNumber() throws DbExceptions {
        try (Connection con = ConnectionPool.getInstance().getConnection();) {
            PreparedStatement ps = con.prepareStatement(SqlUtils.GET_ORDER_COUNT);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
            return -1;
        } catch (SQLException e) {
            throw new DbExceptions("Cannot getOrderNumber", e);
        }
    }
    }
