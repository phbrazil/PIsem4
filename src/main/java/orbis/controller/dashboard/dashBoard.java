/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.dashboard;

import java.io.IOException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.DAO.dashboard.extrairPacotes;
import orbis.DAO.dashboard.extrairVendas;
import orbis.model.pacote.tbPacote;
import orbis.model.venda.tbVenda;
import java.util.Calendar;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "dashboard", urlPatterns = {"/dashboard"})
public class dashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                new Locale("pt", "BR"));

        String year = request.getParameter("year");

        request.setAttribute("year", year);

        extrairVendas extrairVendas = new extrairVendas();
        extrairPacotes extrairPacotes = new extrairPacotes();

        List<tbVenda> vendas = extrairVendas.listar(year);
        List<tbPacote> pacotes = extrairPacotes.listar(year);

        int janeiro = 0, fevereiro = 0, marco = 0, abril = 0, maio = 0, junho = 0, julho = 0,
                agosto = 0, setembro = 0, outubro = 0, novembro = 0, dezembro = 0;

        for (int i = 0; i < pacotes.size(); i++) {

            String mes = String.valueOf(pacotes.get(i).getDthCadastro().charAt(5));
            mes = mes + String.valueOf(pacotes.get(i).getDthCadastro().charAt(6));

            if (mes.equals("01")) {
                janeiro++;
            } else if (mes.equals("02")) {
                fevereiro++;
            } else if (mes.equals("03")) {
                marco++;
            } else if (mes.equals("04")) {
                abril++;
            } else if (mes.equals("05")) {
                maio++;
            } else if (mes.equals("06")) {
                junho++;
            } else if (mes.equals("07")) {
                julho++;
            } else if (mes.equals("08")) {
                agosto++;
            } else if (mes.equals("09")) {
                setembro++;
            } else if (mes.equals("10")) {
                outubro++;
            } else if (mes.equals("11")) {
                novembro++;
            } else if (mes.equals("12")) {
                dezembro++;
            }

        }

        request.setAttribute("janeiro", janeiro);
        request.setAttribute("fevereiro", fevereiro);
        request.setAttribute("marco", marco);
        request.setAttribute("abril", abril);
        request.setAttribute("maio", maio);
        request.setAttribute("junho", junho);
        request.setAttribute("julho", julho);
        request.setAttribute("agosto", agosto);
        request.setAttribute("setembro", setembro);
        request.setAttribute("outubro", outubro);
        request.setAttribute("novembro", novembro);
        request.setAttribute("dezembro", dezembro);

        request.setAttribute("year", year);
        
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
