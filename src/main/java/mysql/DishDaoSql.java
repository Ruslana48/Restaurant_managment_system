package mysql;

import entity.Cart;
import entity.Dish;
import exceptions.DbExceptions;
import org.mockito.InjectMocks;
import util.SqlUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DishDaoSql implements dao.DishDao {

    public Dish setDish(ResultSet rs) throws SQLException {
        return new Dish.Builder()
                .setId(rs.getString("id"))
                .setName(rs.getString("name"))
                .setCategoryId(rs.getLong("category_id"))
                .setPrice(rs.getLong("price"))
                .setWeight(rs.getLong("weight"))
                .setDescription(rs.getString("description"))
                .getDish();
    }

    @Override
    public Dish getDishById(int id) throws DbExceptions {
        try(Connection con =ConnectionPool.getInstance().getConnection();
            PreparedStatement ps = con.prepareStatement(SqlUtils.GET_DISH_BY_ID);){
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return setDish(rs);
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            throw new DbExceptions("Cannot getDishById", e);
        }
    }


    @Override
    public List<Dish> getAllDishes() throws DbExceptions {
        List<Dish> dishes = new ArrayList<>();
        try(Connection con =ConnectionPool.getInstance().getConnection();){
            PreparedStatement ps = con.prepareStatement(SqlUtils.GET_ALL_DISHES);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                dishes.add(setDish(rs));
            }
            return dishes;
        } catch (SQLException e) {
            throw new DbExceptions("Can not get all dishes", e);
        }
    }

    @Override
    public List<Dish>getSortedDishesOnPage(String sortBy)throws DbExceptions {
        List<Dish> dishes = new ArrayList<>();
        String connectionUrl = "jdbc:mysql://localhost:3306/restaurant?serverTimezone=UTC";
        try (Connection con = ConnectionPool.createConnection(connectionUrl, "root", "xhz2woVLxhz2woVL");) {
            PreparedStatement ps = con.prepareStatement(SqlUtils.GET_SORTED_DISHES_FROM_CATEGORY+sortBy);
            System.out.println("ps");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    dishes.add(setDish(rs));
                    System.out.println(rs);
                }
            }
            System.out.println("dishes");
            return dishes;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
