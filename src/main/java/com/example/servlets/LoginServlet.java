package com.example.servlets;

import dao.ClientDAO;
import entity.Client;
import util.Utils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.logging.LogManager;
import org.apache.log4j.Logger;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final Logger log = Logger.getLogger(LoginServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        String clientEmail=request.getParameter("email");
        String clientPassword=request.getParameter("password");
        Client client=new Client(clientEmail, clientPassword);
        PrintWriter out=response.getWriter();
        ClientDAO cdao=new ClientDAO();
        try {
            Client client_login = cdao.login(client);

            System.out.println("successful login");
            System.out.println(client_login.getId());

            request.getSession().setAttribute("client", client_login);
            Client cl= (Client) session.getAttribute("client");
            if (cl.getStatus().equals("MANAGER")) {
                response.sendRedirect("adminPage.jsp");
            }else {
                response.sendRedirect("clientPage.jsp");
            }
        }catch (Exception e){
            log.error(Utils.getErrMessage(e));
            e.printStackTrace();
        }
    }
}
