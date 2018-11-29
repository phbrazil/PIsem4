/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.ClienteJPA;

import orbis.controller.pacote.*;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.model.cliente.tbCliente;
import orbis.model.pacote.tbPacote;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/editarCliente", urlPatterns = {"/editarCliente"})
public class clienteEditar extends HttpServlet {

    //private String UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/imagens/";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String UPLOAD_DIRECTORY = "/Users/lmedeiros/Documents/NetBeansProjects";
        //String UPLOAD_DIRECTORY = "/home/opportunity/orbis/temp/";

        response.setContentType(
                "text/html");
        PrintWriter out = response.getWriter();
        //OutputStream out = null;

        MultipartRequest m = new MultipartRequest(request, UPLOAD_DIRECTORY);
        
        //request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("ISO-8859-1");
        request.setCharacterEncoding("ISO-8859-1");

        HttpSession sessao = request.getSession(true);

        tbCliente cliente = new tbCliente();
        
        int id =  Integer.valueOf(m.getParameter("id"));
        
        cliente.setId(id);
        cliente.setPasswordCliente(m.getParameter("pass"));
        cliente.setIdPayment(Integer.valueOf(m.getParameter("idPayment")));
        cliente.setIdgrupo(Integer.valueOf(m.getParameter("idGrupo")));
        cliente.setIdEndereco(Integer.valueOf(m.getParameter("idEndereco")));
        cliente.setEmailCliente(m.getParameter("email"));
        //cliente.setEmailCliente("luucasmeedeiros@gmail.com");
        cliente.setNomeCliente(m.getParameter("nome"));
        cliente.setTelCliente(m.getParameter("tel"));
        cliente.setCelCliente(m.getParameter("cel"));
        cliente.setCpfCliente(m.getParameter("cpf"));
        cliente.setRgCliente(m.getParameter("rg"));

        //GRAVAR NO BANCO
        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbCliente.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {
            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            session.update(cliente);

            //comita as informacoes
            tx.commit();

        } finally {
//            if (session != null) {
//                session.close();
//                sf.close();
//            }
        }

            //File uploaded successfully
            String pathModal = "clienteConsultaID?id=" + id;
            String mensagem = "Dados do cliente alterados com sucesso!";
            request.setAttribute("path", pathModal);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + pathModal + "&mensagem=" + mensagem + "';");
            out.println("</script>");


    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
