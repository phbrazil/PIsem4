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
    private EmailSessionBean emailBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

        boolean emailenviado = false;

        NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                new Locale("pt", "BR"));

        String to1 = (String) request.getParameter("to1");
        String body = (String) request.getParameter("body");
        String subject = (String) request.getParameter("subject");
        String localSaida = (String) request.getParameter("localSaida");
        String localDestino = (String) request.getParameter("localDestino");
        String roteiro = (String) request.getParameter("roteiro");
        String protocolo = (String) request.getParameter("protocolo");
        double valor = Double.valueOf(request.getParameter("valor"));
        String data = (String) request.getParameter("data");

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
                emailenviado = emailBean.sendEmail(to1, subject, body);

            } catch (RuntimeException ex) {
                ex.printStackTrace();
            }
        } while (emailenviado == false);

        System.out.println("retornou " + emailenviado);

        if (emailenviado == true) {

            String path = "index.jsp";
            String mensagem = "Compra efetuada com sucesso. Protocolo " + protocolo +" enviado por e-mail.";
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
