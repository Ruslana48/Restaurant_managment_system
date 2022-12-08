package com.example.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

@WebServlet("/localization")
public class LocalizationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String []planguage=request.getParameter("language").split("_");
        String language=planguage[0];
        String country=planguage[1];
        Locale locale=new Locale(language, country);
        request.setAttribute("country", locale.getDisplayCountry());

        request.setAttribute("language", request.getParameter("language"));
        response.setContentType("text/html");

        //request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
