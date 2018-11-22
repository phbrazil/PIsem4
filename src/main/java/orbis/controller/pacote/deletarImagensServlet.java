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
        
        deletar.deletar(idImagem);

        //File uploaded successfully
        String pathModal = "consultaID?idpacote="+idpacote;
        String mensagem = "Imagem Deletada com sucesso";
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
