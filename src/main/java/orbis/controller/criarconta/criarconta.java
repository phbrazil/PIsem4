/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.criarconta;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/CriarConta", urlPatterns = {"/CriarConta"})
public class criarconta extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        System.out.println("entrei no criar conta");

        HttpSession sessao = request.getSession(true);

        String email = request.getParameter("email");
        String psw = request.getParameter("psw");
        String pswrepeat = request.getParameter("psw-repeat");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
