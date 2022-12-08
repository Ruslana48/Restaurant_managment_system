package com.example.servlets;

import dao.DAO;
import entity.Client;
import entity.Order;
import exceptions.AppExceptions;
import exceptions.DbExceptions;
import mysql.ReceiptDaoSql;
import org.apache.log4j.Logger;
import util.Utils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminOrderPage")
public class OrdersServlet extends HttpServlet {

    private static final Logger log = Logger.getLogger(LoginServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int page=1;
//        if(request.getParameter("page")!=null) {
//            page = Integer.parseInt(request.getParameter("page"));
//        }
//        int ordersOnPage=Integer.parseInt(request.getParameter("dishesOnPage"));
//        HttpSession session=request.getSession();
//        int maxPage=0;
//
//        try {
//            if (session.getAttribute("orders") == null) {
//                List<Order> orders = DAO.getDao().getOrderDao().getAllOrders();
//                session.setAttribute("orders", orders);
//
//                maxPage=DAO.getDao().getOrderDao().getOrderNumber();
//            }
//            maxPage=maxPage/7;
//            session.setAttribute("maxPage", maxPage);
//        }catch (DbExceptions e) {
//            log.error(Utils.getErrMessage(e));
//            throw new RuntimeException(e);
//
//        }
//
//        session.setAttribute("currentPage", page);
//        //session.setAttribute("ordersForOnePage", orders);
//        request.getRequestDispatcher("orderListForAdmin.jsp");

        HttpSession session = request.getSession();
        String filterParam = request.getParameter("filter");
        String filterAttr = (String) session.getAttribute("filter");
        String filter = filterParam == null ? filterAttr == null ? "all" : filterAttr : filterParam;
        session.setAttribute("filter", filter);
        Client client = (Client) session.getAttribute("client");
        try {
            List<Order> orders;
            switch (filter) {
                case "all":
                    orders = DAO.getDao().getOrderDao().getAllOrders();
                    break;
                case "not-approved":
                    orders = DAO.getDao().getOrderDao().getNewOrders();
                    break;
                case "approved-by-me":
                    orders = DAO.getDao().getOrderDao().getAcceptedOrders(client.getId());
                    break;
                default:
                    log.error("unknown filter = " + filter);
                    throw new AppExceptions("unknown filter");
            }
            session.setAttribute("receipts", orders);
            request.getRequestDispatcher("orderListForAdmin.jsp").forward(request, response);
        } catch (DbExceptions e) {
            log.error(Utils.getErrMessage(e));
            throw new AppExceptions(e);
        }
    }

        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
