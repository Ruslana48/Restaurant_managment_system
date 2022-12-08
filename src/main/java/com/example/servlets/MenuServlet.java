package com.example.servlets;

import dao.DAO;
import entity.Category;
import entity.Client;
import entity.Dish;
import exceptions.DbExceptions;
import mysql.DishDaoSql;
import org.apache.log4j.Logger;
import util.Utils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private static final Logger log = Logger.getLogger(LoginServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int category = Integer.parseInt(request.getParameter("category"));
        int page = Integer.parseInt(request.getParameter("page"));
        int dishesOnPage = Integer.parseInt(request.getParameter("dishesOnPage"));
        String sortBy = request.getParameter("sortBy");
        HttpSession session = request.getSession();
        try {
            if (session.getAttribute("categories") == null) {
                List<Category> categories = DAO.getDao().getCategoryDao().getAllCategories();
                session.setAttribute("categories", categories);
            }
            List<Dish> dishes;
            int maxPage;
            if (category == 0) {
                dishes = DAO.getDao().getDishDao().getSortedDishesOnPage(sortBy, dishesOnPage, page);
                maxPage = DAO.getDao().getDishDao().getDishesNumber();
            } else {
                dishes = DAO.getDao().getDishDao().getSortedDishesFromCategoryOnPage(category, sortBy, dishesOnPage, page);
                maxPage = DAO.getDao().getDishDao().getDishesNumberInCategory(category);
            }
            maxPage /= dishesOnPage;
            session.setAttribute("maxPage", maxPage);
            session.setAttribute("dishes", dishes);
            request.getRequestDispatcher("menuPagination.jsp").forward(request, response);
        } catch (DbExceptions e) {
            log.error(Utils.getErrMessage(e));
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DishDaoSql dishDao=new DishDaoSql();
        try {
            List<Dish>dishes=dishDao.getAllDishes();
            request.getSession().setAttribute("allDishesForMenu", dishes);
        } catch (DbExceptions e) {
            log.error(Utils.getErrMessage(e));
            throw new RuntimeException(e);
        }
    }
}
