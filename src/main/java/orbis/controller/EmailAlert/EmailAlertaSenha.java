/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.EmailAlert;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.Locale;
import javax.ejb.EJB;
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
@WebServlet(name = "EmailAlertaSenha", urlPatterns = {"/EmailAlertaSenha"})
public class EmailAlertaSenha extends HttpServlet {

    @EJB
    private EmailSessionBeanOrbis emailBeanOrbis;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

        boolean emailSenha = false;

        NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                new Locale("pt", "BR"));

        String to1 = (String) request.getParameter("to1");
        String body = (String) request.getParameter("body");
        String subject = (String) request.getParameter("subject");

        PrintWriter out = response.getWriter();

        do {

            out.println("<html><head>");
            out.println("<title>Please Wait...</title>");
            out.println("<meta contentType=\"text/html\" pageEncoding=\"UTF-8\"");
            out.println("</head><body style='background-color: #0fd0d0;color: white;'>");
            out.println("<br><br><br>");
            out.println("<center><h1><strong>Redefinindo sua senha</strong><br>");
            out.println("<br>");
            out.println("<img src='img/email.gif'  width='400' height'400'");
            out.println("Favor aguardar....</h1>");
            out.flush();

            try {
                emailSenha = emailBeanOrbis.sendEmail(to1, subject, body);

            } catch (RuntimeException ex) {
                ex.printStackTrace();
            }

        } while (emailSenha == false);

        if (emailSenha == true) {

            String path = "index.jsp";
            String mensagem = "Sua nova senha foi enviada por email";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        } else {

            String path = "login.jsp";
            String mensagem = "Ocorreu um erro ao enviar email";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
