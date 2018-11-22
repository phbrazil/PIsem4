/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.pacote;

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import static jdk.nashorn.internal.objects.NativeError.getFileName;
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
@WebServlet(name = "/editar", urlPatterns = {"/editar"})
public class pacoteEditar extends HttpServlet {

    //private String UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/imagens/";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/temp/";
        //String UPLOAD_DIRECTORY = "/home/opportunity/orbis/temp/";

        response.setContentType(
                "text/html");
        PrintWriter out = response.getWriter();
        //OutputStream out = null;

        MultipartRequest m = new MultipartRequest(request, UPLOAD_DIRECTORY);

        //request.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("ISO-8859-1");

        HttpSession sessao = request.getSession(true);

        String data = new SimpleDateFormat("dd/MM/yyyy hh:mm").format(Calendar.getInstance().getTime());

        tbPacote pacote = new tbPacote();

        int id = Integer.valueOf(m.getParameter("idpacote"));
        
        System.out.println(id+"++++++++++++idPacote");
        pacote.setIdPacote(id);
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

        //GRAVAR NO BANCO
        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbPacote.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {
            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            session.update(pacote);

            //comita as informacoes
            tx.commit();

        } finally {
//            if (session != null) {
//                session.close();
//                sf.close();
//            }
        }

        try {
            List<FileItem> multiparts = new ServletFileUpload(
                    new DiskFileItemFactory()).parseRequest(request);

            //criar pasta com id do banco                
            //File file = new File("/Users/killuminatti08/NetBeansProjects/Orbis/imagens/" + String.valueOf(id));
            //File file = new File("/home/opportunity/orbis/imagens/" + String.valueOf(id));
            File file = new File("/Users/killuminatti08/NetBeansProjects/Orbis/src/main/webapp/img/imagens/" + String.valueOf(id));

            //UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/imagens/" + String.valueOf(id);
            //UPLOAD_DIRECTORY = "/home/opportunity/orbis/imagens/" + String.valueOf(id);
            UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/src/main/webapp/img/imagens/" + String.valueOf(id);

            if (!file.exists()) {
                if (file.mkdir()) {
                    System.out.println("Directory is created!");
                } else {
                    System.out.println("Failed to create directory!");
                }
            }

            //inserir na nova pasta criada
            File fileToMove = new File("/Users/killuminatti08/NetBeansProjects/Orbis/temp");
            //File fileToMove = new File("/home/opportunity/orbis/temp");                

            fileToMove.renameTo(new File(UPLOAD_DIRECTORY));

            File temp = new File("/Users/killuminatti08/NetBeansProjects/Orbis/temp/");
            //File temp = new File("/home/opportunity/orbis/temp/");
            temp.mkdir();

            List<String> nomeImagem = new ArrayList<>();

            // gravar nomes das fotos
            String dirPath = UPLOAD_DIRECTORY;
            File dir = new File(dirPath);
            String[] files = dir.list();
            if (files.length == 0) {
                System.out.println("The directory is empty");
            } else {
                for (String aFile : files) {
                    nomeImagem.add(String.valueOf(aFile));

                }
            }

            gravarImagens gravarImagens = new gravarImagens();

            boolean gravado = gravarImagens.gravar(nomeImagem, id);

            //ATUALIZAR PATH NO BANCO
            pacote.setImagePath("img/imagens/" + id + "/");
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
            String mensagem = "Novo pacote alterado com sucesso!";
            request.setAttribute("path", pathModal);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + pathModal + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        } catch (Exception ex) {
            System.out.println("erro " + ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
