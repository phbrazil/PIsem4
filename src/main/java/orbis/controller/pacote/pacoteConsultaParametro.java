/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.pacote;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.DAO.pacote.consultaPacote;
import orbis.model.pacote.tbPacote;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/consulta", urlPatterns = {"/consulta"})
public class pacoteConsultaParametro extends HttpServlet {

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

        String data = new SimpleDateFormat("dd/MM/yyyy hh:mm").format(Calendar.getInstance().getTime());

        tbPacote pacote = new tbPacote();
                request.setCharacterEncoding("UTF-8");

        String valorbusca = request.getParameter("valorbusca");
        

        consultaPacote pacotesDAO = new consultaPacote();

        List<tbPacote> resultado = pacotesDAO.consultaPacote(valorbusca);

        valorbusca = null;

        request.setAttribute("valorbusca", null);

        request.setAttribute("pacotes", resultado);
        
        request.getRequestDispatcher("pacoteListaEditar.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
