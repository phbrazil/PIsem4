/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Paulo.Bezerra
 */
@WebServlet(name = "Logout", urlPatterns = {"/Logout"})

public class Logout extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String logout = request.getParameter("logout");

        if (logout.equals("Sair")) {

            HttpSession sessao = request.getSession();

            sessao.invalidate();
            
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } else {

            request.getRequestDispatcher("index.jsp").forward(request, response);

        }

    }

}
