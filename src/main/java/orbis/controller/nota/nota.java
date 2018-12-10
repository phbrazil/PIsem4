/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.nota;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "/nota", urlPatterns = {"/nota"})
public class nota extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession();
        
        String rating = request.getParameter("rating");
        
        System.out.println(rating);

        String path = "login.jsp";
        String mensagem = "Obrigado pela nota!";
        request.setAttribute("path", path);
        out.println("<script type='text/javascript'>");
        out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
        out.println("</script>");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
