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
import javax.mail.MessagingException;
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
@WebServlet(name = "EmailAlertaVenda", urlPatterns = {"/EmailAlertaVenda"})
public class EmailAlertaVenda extends HttpServlet {

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

        boolean emailVenda = false;
        boolean emailIngressos = false;

        NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                new Locale("pt", "BR"));

        String to1 = (String) sessao.getAttribute("emailCliente");
        String body = (String) request.getParameter("body");
        String subject = (String) request.getParameter("subject");
        int idcliente = Integer.valueOf(request.getParameter("idcliente"));
        int idvenda = Integer.valueOf(request.getParameter("idvenda"));
        int idpacote = Integer.valueOf(request.getParameter("idpacote"));
        String protocolo = (String) request.getParameter("protocolo");

        PrintWriter out = response.getWriter();

        do {

            out.println("<html><head>");
            out.println("<title>Please Wait...</title>");
            out.println("<meta contentType=\"text/html\" pageEncoding=\"UTF-8\"");
            out.println("</head><body style='background-color: #0fd0d0;color: white;'>");
            out.println("<br><br><br>");
            out.println("<center><h1><strong>Sua compra está sendo concluída!</strong><br>");
            out.println("<br>");
            out.println("<img src='img/loading.gif'  width='200' height'200'");
            out.println("Favor aguardar....</h1>");
            out.println("<h5>A média de processamento é de até 5 segundos.</h5></center></body></html>");
            out.flush();

            try {
                emailVenda = emailBeanOrbis.sendEmail(to1, subject, body);

            } catch (RuntimeException ex) {
                ex.printStackTrace();
            }
        } while (emailVenda == false);

        if (emailVenda == true) {
            
            subject="Imprima seus ingressos!";
            body = "Clique no link abaixo e imprima seus ingressos: \n"
                    + "\nhttp://9ember.com/orbis/imprimirIngressos?idcliente="+idcliente+"&idpacote="
                    +idpacote+"&idvenda="+idvenda;
            try {
                emailIngressos = emailBeanOrbis.sendEmail(to1, subject, body);

            } catch (RuntimeException ex) {
                ex.printStackTrace();
            }
        }

        if (emailIngressos == true) {

            String path = "index.jsp";
            String mensagem = "Compra efetuada com sucesso. Protocolo " + protocolo + " enviado por e-mail.";
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
