/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.pacote;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/deletarPacote", urlPatterns = {"/deletarPacote"})
public class pacoteDeletar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("entrei no deletar pacote");

        int idpacote = Integer.valueOf(request.getParameter("idpacote"));

        PrintWriter out = response.getWriter();

        deletarPacote deletar = new deletarPacote();

        boolean deletado = deletar.deletar(idpacote);

        if (deletado == true) {

            //File deleted successfully
            String pathModal = "gerenciarPacotes.jsp";
            String mensagem = "Pacote removido com sucesso!";
            request.setAttribute("path", pathModal);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + pathModal + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        } else {

            //File deleted failed
            String pathModal = "gerenciarPacotes.jsp";
            String mensagem = "Ocorreu algum erro, tente novamente";
            request.setAttribute("path", pathModal);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + pathModal + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
