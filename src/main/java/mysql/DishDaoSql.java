package mysql;

import entity.Dish;
import exceptions.DbExceptions;
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
    public List<Dish>getSortedDishesOnPage(String sortBy, int dishesOnPage, int pageNumber)throws DbExceptions {
        List<Dish> dishes = new ArrayList<>();
        try(Connection con =ConnectionPool.getInstance().getConnection();){
            PreparedStatement ps = con.prepareStatement(SqlUtils.GET_SORTED_DISHES+sortBy+" LIMIT "+pageNumber*dishesOnPage+", "+dishesOnPage);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    dishes.add(setDish(rs));
                }
            }
            return dishes;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public int getDishesNumber() throws DbExceptions {
        try (Connection c = ConnectionPool.getInstance().getConnection();
             PreparedStatement ps = c.prepareStatement(SqlUtils.GET_DISHES_COUNT);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
            return -1;
        } catch (SQLException e) {
            throw new DbExceptions("Cannot get DishesNumber", e);
        }
    }

    @Override
    public List<Dish> getSortedDishesFromCategoryOnPage(int categoryId, String sortBy, int dishesOnPage, int pageNumber) throws DbExceptions {
        List<Dish> dishes = new ArrayList<>();
        try (Connection c = ConnectionPool.getInstance().getConnection();
             PreparedStatement ps = c.prepareStatement(
                     SqlUtils.GET_SORTED_DISHES_FROM_CATEGORY + sortBy + " LIMIT " + pageNumber * dishesOnPage + ", " + dishesOnPage)) {
            ps.setLong(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    dishes.add(setDish(rs));
                }
            }
            return dishes;
        } catch (SQLException e) {
            throw new DbExceptions("Cannot get SortedDishesFromCategory" + categoryId, e);
        }
    }

    @Override
    public int getDishesNumberInCategory(int categoryId) throws DbExceptions {
        try (Connection c = ConnectionPool.getInstance().getConnection();
             PreparedStatement ps = c.prepareStatement(SqlUtils.GET_DISHES_COUNT_IN_CATEGORY)) {
            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
                return -1;
            }
        } catch (SQLException e) {
            throw new DbExceptions("Cannot get DishesNumberInCategory", e);
        }
    }

}
