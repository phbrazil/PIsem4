/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.pacote;

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.model.pacote.tbPacote;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/criar", urlPatterns = {"/criar"})
public class pacoteCriar extends HttpServlet {

    //private String UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/imagens/";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/temp/";

        response.setContentType(
                "text/html");
        PrintWriter out = response.getWriter();
        MultipartRequest m = new MultipartRequest(request, UPLOAD_DIRECTORY);

        String path = "";

        request.setCharacterEncoding(
                "UTF-8");

        HttpSession sessao = request.getSession(true);

        String data = new SimpleDateFormat("dd/MM/yyyy hh:mm").format(Calendar.getInstance().getTime());

        tbPacote pacote = new tbPacote();

        pacote.setDthevento(m.getParameter("dthevento"));
        pacote.setQtdMax(Integer.valueOf(m.getParameter("qtdmax")));
        pacote.setValor(Double.valueOf(m.getParameter("valor").replace(".", "").replace(",", ".")));
        pacote.setLocalSaida(m.getParameter("localsaida"));
        pacote.setLocalDestino(m.getParameter("localdestino"));
        pacote.setRoteiro(m.getParameter("roteiro"));
        if (m.getParameter(
                "ativo").equals("Sim")) {
            pacote.setAtivo(true);
        } else {
            pacote.setAtivo(false);

        }

        pacote.setDthCadastro(data);

        Integer id;

        //GRAVAR NO BANCO
        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbPacote.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {
            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            id = (Integer) session.save(pacote);

            //comita as informacoes
            tx.commit();

        } finally {
//            if (session != null) {
//                session.close();
//                sf.close();
//            }
        }

        //if (ServletFileUpload.isMultipartContent(request)) {
        if (id != null) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);

                //criar pasta com id do banco                
                File file = new File("/Users/killuminatti08/NetBeansProjects/Orbis/imagens/" + String.valueOf(id));

                UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/imagens/" + String.valueOf(id);

                if (!file.exists()) {
                    if (file.mkdir()) {
                        System.out.println("Directory is created!");
                    } else {
                        System.out.println("Failed to create directory!");
                    }
                }

                //inserir na nova pasta criada
                File fileToMove = new File("/Users/killuminatti08/NetBeansProjects/Orbis/temp");

                fileToMove.renameTo(new File(UPLOAD_DIRECTORY));

                File temp = new File("/Users/killuminatti08/NetBeansProjects/Orbis/temp/");
                temp.mkdir();

                //ATUALIZAR PATH NO BANCO
                pacote.setImagePath(UPLOAD_DIRECTORY);
                try {
                    //inicia a transacao com o banco
                    Transaction tx = session.beginTransaction();
                    session.update(pacote);

                    //comita as informacoes
                    tx.commit();

                } finally {
                    if (session != null) {
                        session.close();
                        sf.close();
                    }
                }

                //File uploaded successfully
                String pathModal = "gerenciarPacotes.jsp";
                String mensagem = "Novo pacote criado com sucesso!";
                request.setAttribute("path", pathModal);
                out.println("<script type='text/javascript'>");
                out.println("location='modal?path=" + pathModal + "&mensagem=" + mensagem + "';");
                out.println("</script>");

            } catch (Exception ex) {
                System.out.println("erro " + ex);
//request.setAttribute("message", "Upload falhou devido a " + ex);
            }
        } else {
            //request.setAttribute("message",
            System.out.println("Desculpe, o Servlet aceita somente upload de arquivos");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
