package com.example.servlets;

import dao.DAO;
import entity.Cart;
import entity.Client;
import entity.Dish;
import exceptions.DbExceptions;
import mysql.CartDaoSql;
import org.apache.log4j.Logger;
import util.Utils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class AddToCartServlet extends HttpServlet {

    private static final Logger log = Logger.getLogger(LoginServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            System.out.println("////////////////////////////");
            String id = request.getParameter("id");
            System.out.println("id" + id);
            System.out.println("id");
            out.println("cart id");
            System.out.println("set");

            Client client = (Client) session.getAttribute("client");
            System.out.println("session created");
            if(!DAO.getDao().getCartDao().checkWhetherDishExistInClientCart(id, client.getId())) {
                DAO.getDao().getCartDao().addDishToCart(client.getId(), id, 1);
            }
            System.out.println("added to db");

            List<Dish> list=DAO.getDao().getCartDao().selectDishesByClient(client);
            System.out.println(list);
            //double sum=DAO.getDao().getCartDao().getTotalCartPrice(list, quantity);

//            ourCart = cartsList;
//            boolean exist = false;
//
//            for (Cart c : cartsList) {
//                if (c.getId() == id) {
//                    exist = true;
//                    out.println("product exist");
//                }
//                if (!exist) {
//                    ourCart.add(cm);
//                    out.println("product added");
//                }
//            }
            response.sendRedirect("menu.jsp");
            //}
        } catch (DbExceptions e) {
            log.error(Utils.getErrMessage(e));
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int quantity= Integer.parseInt(request.getParameter("quantity"));
        System.out.println(quantity);
        response.sendRedirect("cart.jsp");
        Client client = (Client) session.getAttribute("client");
        System.out.println(client);
        DAO.getDao().getCartDao().updateCount(quantity, client);
    }
}
