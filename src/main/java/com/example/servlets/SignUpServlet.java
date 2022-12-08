package com.example.servlets;

import javax.servlet.http.*;
import javax.servlet.annotation.*;

import dao.ClientDAO;
import entity.Client;
import org.apache.log4j.Logger;
import util.Utils;

import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/register")
public class SignUpServlet extends HttpServlet {

    private static final Logger log = Logger.getLogger(LoginServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        out.print("Working");

        String csurname = request.getParameter("surname");
        String cname = request.getParameter("name");
        String cemail = request.getParameter("email");
        String cnumber = request.getParameter("mobn");
        String cpassword = request.getParameter("password");
        String crole = request.getParameter("yourrole");

        out.print(csurname);
        out.print(cname);
        out.print(cemail);
        out.print(cnumber);
        out.print(crole);
        out.print(cpassword);
        Client client = new Client(csurname, cname, cemail, cnumber, cpassword, crole);
        ClientDAO clientDAO = new ClientDAO();
        try {
            String result = clientDAO.save(client);
            System.out.println(client);
            response.getWriter().print(result);
        }catch (Exception e) {
            log.error(Utils.getErrMessage(e));
            e.printStackTrace();
        }
        // response.sendRedirect("employeedetails.jsp");
    }
}