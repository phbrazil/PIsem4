/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.criarconta;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.DAO.pacote.atualizarIdEndereco;
import orbis.DAO.pacote.gravarEndereco;
import orbis.model.cliente.tbCliente;
import orbis.model.endereco.tbEndereco;
import orbis.model.imagensPacote.tbImagens;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/finalizarCadastro", urlPatterns = {"/finalizarCadastro"})
public class finalizarCadastro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idcliente = Integer.valueOf(request.getParameter("idcliente"));
        String rua = request.getParameter("rua");
        String numero = request.getParameter("numero");
        String cep = request.getParameter("cep");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");
        String pais = "Brasil";
        String referencia = request.getParameter("referencia");

        tbEndereco endereco = new tbEndereco();

        endereco.setRua(rua);
        endereco.setCep(cep);
        endereco.setBairro(bairro);
        endereco.setCidade(cidade);
        endereco.setUF(uf);
        endereco.setPais(pais);
        endereco.setReferencia(referencia);
        endereco.setComplemento(complemento);
        endereco.setNumero(numero);

        gravarEndereco gravarendereco = new gravarEndereco();

        Integer idendereco = (Integer) gravarendereco.gravarEndereco(endereco);

        atualizarIdEndereco atualizarIdEndereco = new atualizarIdEndereco();

        boolean atualizado = atualizarIdEndereco.atualizar(idcliente, idendereco);

        if (atualizado == true) {
            PrintWriter out = response.getWriter();
            String path = "index.jsp";
            String mensagem = "Seu cadastro foi finalizado com sucesso!";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

            request.getRequestDispatcher("index.jsp").forward(request, response);

        } else {

            PrintWriter out = response.getWriter();
            String path = "index.jsp";
            String mensagem = "Ocorreu um erro, tente novamente";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

            request.getRequestDispatcher("index.jsp").forward(request, response);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
