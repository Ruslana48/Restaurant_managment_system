package dao;

import entity.Dish;
import entity.Order;
import exceptions.DbExceptions;

import java.util.List;
import java.util.Map;

public interface DishDao {

    /**
     * Get all dishes from dish table in db
     * @return list of dishes
     */
    List<Dish>getAllDishes() throws DbExceptions;

    /**
     * Get sorted dishes from category using pagination. All from dish table in db
     * @param sortBy sorting String
     * @return list of dishes
     */
    public List<Dish>getSortedDishesOnPage(String sortBy, int dishesOnPage, int pageNumber)throws DbExceptions;

    /**
     * Get Dish by Id
     * @param id
     * @return dish
     */
    public Dish getDishById(int id) throws DbExceptions;

    /**
     * How many rows are in dish table
     * @return number of dishes
     */
    public int getDishesNumber() throws DbExceptions;

    /**
     * Get sorted dishes from category using pagination. All from dish table in db
     * @param categoryId id of category
     * @param sortBy name of field in dish table to sort by
     * @param dishesOnPage how many dishes are on one page
     * @param pageNumber page number
     * @return list of dishes
     */
    List<Dish> getSortedDishesFromCategoryOnPage(int categoryId, String sortBy, int dishesOnPage, int pageNumber) throws DbExceptions;

    /**
     * How many rows with current category in dish table
     * @param categoryId id of category
     * @return number of dishes
     */
    int getDishesNumberInCategory(int categoryId) throws DbExceptions;
}
