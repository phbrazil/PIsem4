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
import javax.servlet.http.HttpSession;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/deletarImagem", urlPatterns = {"/deletarImagem"})
public class deletarImagensServlet extends HttpServlet {

    //private String UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/imagens/";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                //request.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("ISO-8859-1");

        HttpSession sessao = request.getSession(true);

        PrintWriter out = response.getWriter();

        Integer idImagem = Integer.valueOf(request.getParameter("idImagem"));
        Integer idpacote = Integer.valueOf(request.getParameter("idpacote"));
        
        deletarImagens deletar = new deletarImagens();

        boolean deletado = deletar.deletar(idImagem);

        if (deletado == true) {

            String pathModal = "consultaID?idpacote=" + idpacote;
            String mensagem = "Imagem Deletada com sucesso";
            request.setAttribute("path", pathModal);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + pathModal + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        } else {

            String pathModal = "gerenciarPacotes.jsp";
            String mensagem = "Ocorreu um erro, tenta novamente.";
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
