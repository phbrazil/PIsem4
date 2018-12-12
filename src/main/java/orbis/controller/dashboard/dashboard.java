/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.dashboard;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import orbis.DAO.dashboard.extrairPacotes;
import orbis.DAO.dashboard.extrairTopDestinos;
import orbis.DAO.dashboard.extrairVendas;
import orbis.model.pacote.tbPacote;
import orbis.model.venda.tbVenda;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/dashboard", urlPatterns = {"/dashboard"})
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
            String mes = String.valueOf(vendas.get(i).getDthvenda().charAt(3));
            mes = mes + String.valueOf(vendas.get(i).getDthvenda().charAt(4));

            switch (mes) {
                case "01":
                    janeiroV += vendas.get(i).getTotal();
                    janeiro++;
                    break;
                case "02":
                    fevereiroV += vendas.get(i).getTotal();
                    fevereiro++;
                    break;
                case "03":
                    marcoV += vendas.get(i).getTotal();
                    marco++;
                    break;
                case "04":
                    abrilV += vendas.get(i).getTotal();
                    abril++;
                    break;
                case "05":
                    maioV += vendas.get(i).getTotal();
                    maio++;
                    break;
                case "06":
                    junhoV += vendas.get(i).getTotal();
                    junho++;
                    break;
                case "07":
                    julhoV += vendas.get(i).getTotal();
                    julho++;
                    break;
                case "08":
                    agostoV += vendas.get(i).getTotal();
                    agosto++;
                    break;
                case "09":
                    setembroV += vendas.get(i).getTotal();
                    setembro++;
                    break;
                case "10":
                    outubroV += vendas.get(i).getTotal();
                    outubro++;
                    break;
                case "11":
                    novembroV += vendas.get(i).getTotal();
                    novembro++;
                    break;
                case "12":
                    dezembroV += vendas.get(i).getTotal();
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

        request.setAttribute("janeiroF", formatoMoeda.format(janeiroV));
        request.setAttribute("fevereiroF", formatoMoeda.format(fevereiroV));
        request.setAttribute("marcoF", formatoMoeda.format(marcoV));
        request.setAttribute("abrilF", formatoMoeda.format(abrilV));
        request.setAttribute("maioF", formatoMoeda.format(maioV));
        request.setAttribute("junhoF", formatoMoeda.format(junhoV));
        request.setAttribute("julhoF", formatoMoeda.format(julhoV));
        request.setAttribute("agostoF", formatoMoeda.format(agostoV));
        request.setAttribute("setembroF", formatoMoeda.format(setembroV));
        request.setAttribute("outubroF", formatoMoeda.format(outubroV));
        request.setAttribute("novembroF", formatoMoeda.format(novembroV));
        request.setAttribute("dezembroF", formatoMoeda.format(dezembroV));

        request.setAttribute("year", year);

        extrairTopDestinos topdestinos = new extrairTopDestinos();

        List<tbPacote> topdestinosLista = (List<tbPacote>) topdestinos.listar(year);

        String destino1 = "";
        String destino2 = "";
        String destino3 = "";
        String destino4 = "";
        String destino5 = "";

        int destino1Qtd = 0, destino2Qtd = 0, destino3Qtd = 0, destino4Qtd = 0, destino5Qtd = 0;

        List<String> destinos = new ArrayList();

        for (int i = 0; i < topdestinosLista.size(); i++) {
            destinos.add(topdestinosLista.get(i).getLocalDestino());

        }

        do {
            if (destinos.size() <= 4 || destinos == null) {
                destinos.add("");
            }
        } while (destinos.size() <= 4);

        for (int i = 0; i < destinos.size(); i++) {
            destino1 = destinos.get(0);
            destino2 = destinos.get(1);
            destino3 = destinos.get(2);
            destino4 = destinos.get(3);
            destino5 = destinos.get(4);

        }

        for (int i = 0; i < topdestinosLista.size(); i++) {

            if (topdestinosLista.get(i).getLocalDestino().equalsIgnoreCase(destino1)) {
                destino1Qtd++;
            } else if (topdestinosLista.get(i).getLocalDestino().equalsIgnoreCase(destino2)) {
                destino2Qtd++;
            } else if (topdestinosLista.get(i).getLocalDestino().equalsIgnoreCase(destino3)) {
                destino3Qtd++;
            } else if (topdestinosLista.get(i).getLocalDestino().equalsIgnoreCase(destino4)) {
                destino4Qtd++;
            } else if (topdestinosLista.get(i).getLocalDestino().equalsIgnoreCase(destino5)) {
                destino5Qtd++;
            }
        }

        request.setAttribute("destino1", destino1);
        request.setAttribute("destino2", destino2);
        request.setAttribute("destino3", destino3);
        request.setAttribute("destino4", destino4);
        request.setAttribute("destino5", destino5);

        request.setAttribute("destino1Qtd", destino1Qtd);
        request.setAttribute("destino2Qtd", destino2Qtd);
        request.setAttribute("destino3Qtd", destino3Qtd);
        request.setAttribute("destino4Qtd", destino4Qtd);
        request.setAttribute("destino5Qtd", destino5Qtd);

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
