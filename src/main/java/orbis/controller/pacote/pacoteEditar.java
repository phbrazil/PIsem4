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
import java.util.ArrayList;
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
import org.apache.commons.io.FileUtils;
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String home = "/opt/tomcat/apache-tomee-webprofile-7.0.2/webapps/imagens/";

        //Mac
        //String UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/temp/";
        //WINDOWS
        //String UPLOAD_DIRECTORY = "C:\\Users\\ASAPH-001\\Documents\\NetBeansProjects\\Orbis\\temp";
        //Ubuntu Server
        String UPLOAD_DIRECTORY = "/home/opportunity/orbis/temp/";
        response.setContentType(
                "text/html");
        PrintWriter out = response.getWriter();
        //OutputStream out = null;

        MultipartRequest m = new MultipartRequest(request, UPLOAD_DIRECTORY, 5000000, "UTF-8");

        //request.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("ISO-8859-1");

        HttpSession sessao = request.getSession(true);

        String data = new SimpleDateFormat("dd/MM/yyyy hh:mm").format(Calendar.getInstance().getTime());

        tbPacote pacote = new tbPacote();

        int idpacote = Integer.valueOf(m.getParameter("idpacote"));

        pacote.setIdPacote(idpacote);
        pacote.setDthevento(m.getParameter("dthevento"));
        pacote.setHorario(m.getParameter("horario"));
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
            //UBUNTU SERVER
            File file = new File(home + String.valueOf(idpacote));

            //MAC
            //File file = new File("/Users/killuminatti08/NetBeansProjects/Orbis/src/main/webapp/img/imagens/" + String.valueOf(idpacote));
            //WINDOWS
            //File file = new File("C:\\Users\\ASAPH-001\\Documents\\NetBeansProjects\\Orbis\\src\\main\\webapp\\img\\imagens\\"+String.valueOf(idpacote));
            //UBUNTU SERVER
            UPLOAD_DIRECTORY = home + String.valueOf(idpacote);

            //MAC
            //UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/src/main/webapp/img/imagens/" + String.valueOf(idpacote);
            //WINDOWS
            //UPLOAD_DIRECTORY = "C:\\Users\\ASAPH-001\\Documents\\NetBeansProjects\\Orbis\\src\\main\\webapp\\img\\imagens\\" + String.valueOf(idpacote);
            if (!file.exists()) {
                if (file.mkdir()) {
                    System.out.println("Directory is created!");
                } else {
                    System.out.println("Failed to create directory!");
                }
            }

            //MAC
            //File source = new File("/Users/killuminatti08/NetBeansProjects/Orbis/temp");
            //WINDOWS
            //File source = new File("C:\\Users\\ASAPH-001\\Documents\\NetBeansProjects\\Orbis\\temp");
            //UBUNTU
            File source = new File("/home/opportunity/orbis/temp");

            File dest = new File(UPLOAD_DIRECTORY);

            try {
                FileUtils.copyDirectory(source, dest);
            } catch (IOException e) {
                e.printStackTrace();
            }

            List<String> nomeImagem = new ArrayList<>();

            // gravar nomes das fotos
            String dirPath = UPLOAD_DIRECTORY;
            File dir = new File(dirPath);
            String[] files = dir.list();
            if (files.length == 0) {
                System.out.println("The directory is empty");
            } else {

                for (int i = 0; i < files.length; i++) {
                    //for (String aFile : files) {
                    nomeImagem.add(String.valueOf(files[i]));

                }
            }

            gravarImagens gravarImagens = new gravarImagens();

            boolean gravado = gravarImagens.gravar(nomeImagem, idpacote);

            //ATUALIZAR PATH NO BANCO
            pacote.setImagePath("/imagens/" + idpacote + "/");
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
            String pathModal = "consultaID?idpacote=" + idpacote;
            String mensagem = "Pacote alterado com sucesso!";
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
