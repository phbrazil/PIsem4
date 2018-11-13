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

    private String UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/imagens/";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                   response.setContentType("text/html");  
           PrintWriter out=response.getWriter();  
           MultipartRequest m=new MultipartRequest(request, UPLOAD_DIRECTORY);  
                   
        String path = "";

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

        String data = new SimpleDateFormat("dd/MM/yyyy hh:mm").format(Calendar.getInstance().getTime());

        tbPacote pacote = new tbPacote();

        pacote.setDthevento(m.getParameter("dthevento"));
        pacote.setQtdMax(Integer.valueOf(m.getParameter("qtdmax")));
        pacote.setValor(Double.valueOf(m.getParameter("valor").replace(".", "").replace(",", ".")));
        pacote.setLocalSaida(m.getParameter("localsaida"));
        pacote.setLocalDestino(m.getParameter("localdestino"));
        pacote.setRoteiro(m.getParameter("roteiro"));
        if (m.getParameter("ativo").equals("Sim")) {
            pacote.setAtivo(true);
        } else {
            pacote.setAtivo(false);

        }
        pacote.setDthCadastro(data);

        Integer id;

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
            if (session != null) {
                session.close();
                sf.close();
            }
        }

        //-----
        //if (ServletFileUpload.isMultipartContent(request)) {
        if (id != null) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);
//
//                //gravar na pasta temp
//                for (FileItem item : multiparts) {
//                    if (!item.isFormField()) {
//                        String name = new File(item.getName()).getName();
//                        item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
//                        path = UPLOAD_DIRECTORY + File.separator + name;
//                    }
//                }

                //criar pasta com id do banco
                File file = new File("/Users/killuminatti08/NetBeansProjects/Orbis/imagens/" + id);
                //File file = new File("/opt/tomcat/apache-tomee-webprofile-7.0.2/webapps/files/" + id);

                String novodiretorio = "";
                if (!file.exists()) {
                    if (file.mkdir()) {
                        System.out.println("Directory is created!");
                        novodiretorio = "/Users/killuminatti08/NetBeansProjects/Orbis/imagens/" + id;
                    } else {
                        System.out.println("Failed to create directory!");
                    }
                }

                //inserir na nova pasta criada
                UPLOAD_DIRECTORY = UPLOAD_DIRECTORY + id;
                //UPLOAD_DIRECTORY = novodiretorio;
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
                        System.out.println("inserido");
                    }
                }

                //deletar arquivos na pasta temp
                System.out.println("deletar temp");

//                //File tempfolder = new File("/opt/tomcat/apache-tomee-webprofile-7.0.2/webapps/files/temp");
//                File tempfolder = new File("C:\\Users\\ASAPH-001\\Desktop\\uploads\\temp");
//                File[] filestemp = tempfolder.listFiles();
//
//                if (filestemp != null) {
//                    for (File f : filestemp) {
//                        System.out.println("deletando temp");
//                        f.delete();
//                    }
//                }
                UPLOAD_DIRECTORY = null;

                //File uploaded successfully
                System.out.println("Upload feito com sucesso");
                //request.setAttribute("message", "Upload feito com Sucesso!");

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
