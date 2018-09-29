/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.criarconta;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.model.criarconta.mcriarconta;

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

        HttpSession sessao = request.getSession(true);

        String email = request.getParameter("email");
        String psw = request.getParameter("psw");
        String pswrepeat = request.getParameter("psw-repeat");
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String sexo = request.getParameter("sexo");
        String telefone = request.getParameter("telefone");

        if (!psw.equals(pswrepeat) || cpf.equals("")|| nome.equals("")
                || telefone.equals("")|| sexo.equals("")|| email.equals("")) {
            PrintWriter out = response.getWriter();
            String path = "index.jsp";
            String mensagem = "Ocorreu um erro. Favor tentar novamente";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        }else{
            
            mcriarconta criarconta = new mcriarconta(email, psw, cpf, nome, sexo, telefone);
            
            System.out.println(criarconta.getNome());
            
            
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
