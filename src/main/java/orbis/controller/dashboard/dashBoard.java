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

        double janeiroV = 0, fevereiroV = 0, marcoV = 0, abrilV = 0, maioV = 0, junhoV = 0, julhoV = 0,
                agostoV = 0, setembroV = 0, outubroV = 0, novembroV = 0, dezembroV = 0;

        for (int i = 0; i < vendas.size(); i++) {
            String mes = String.valueOf(vendas.get(i).getDthvenda().charAt(5));
            mes = mes + String.valueOf(vendas.get(i).getDthvenda().charAt(6));

            if (mes.equals("12")) {
                dezembroV += vendas.get(i).getTotal();
            }

        }
        for (int i = 0; i < pacotes.size(); i++) {

            String mes = String.valueOf(pacotes.get(i).getDthCadastro().charAt(5));
            mes = mes + String.valueOf(pacotes.get(i).getDthCadastro().charAt(6));

            switch (mes) {
                case "01":
                    janeiro++;
                    janeiroV += pacotes.get(i).getValor();
                    break;
                case "02":
                    fevereiro++;
                    fevereiroV += pacotes.get(i).getValor();
                    break;
                case "03":
                    marco++;
                    marcoV += pacotes.get(i).getValor();
                    break;
                case "04":
                    abril++;
                    abrilV += pacotes.get(i).getValor();
                    break;
                case "05":
                    maio++;
                    maioV += pacotes.get(i).getValor();
                    break;
                case "06":
                    junho++;
                    julhoV += pacotes.get(i).getValor();
                    break;
                case "07":
                    julho++;
                    julhoV += pacotes.get(i).getValor();
                    break;
                case "08":
                    agosto++;
                    agostoV += pacotes.get(i).getValor();
                    break;
                case "09":
                    setembro++;
                    setembroV += pacotes.get(i).getValor();
                    break;
                case "10":
                    outubro++;
                    outubroV += pacotes.get(i).getValor();
                    break;
                case "11":
                    novembro++;
                    novembroV += pacotes.get(i).getValor();
                    break;
                case "12":
                    dezembro++;
                    break;
                default:
                    break;
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

        request.setAttribute("janeiroV", janeiroV);
        request.setAttribute("fevereiroV", fevereiroV);
        request.setAttribute("marcoV", marcoV);
        request.setAttribute("abrilV", abrilV);
        request.setAttribute("maioV", maioV);
        request.setAttribute("junhoV", junhoV);
        request.setAttribute("julhoV", julhoV);
        request.setAttribute("agostoV", agostoV);
        request.setAttribute("setembroV", setembroV);
        request.setAttribute("outubroV", outubroV);
        request.setAttribute("novembroV", novembroV);
        request.setAttribute("dezembroV", dezembroV);

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
