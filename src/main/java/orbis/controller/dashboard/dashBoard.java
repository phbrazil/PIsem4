/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.dashboard;


import java.io.IOException;
import java.text.NumberFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.DAO.pacote.listarPacotes;
import orbis.model.pacote.tbPacote;

/**
 *
 * @author Paulo.Bezerra
 */
@WebServlet(name = "SessaoServlet", urlPatterns = {"/dashboard"})

public class dashBoard extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sessao = request.getSession();
        request.setCharacterEncoding("UTF-8");


        String emailuser = (String) sessao.getAttribute("emailuser");
        String nomecomp = (String) sessao.getAttribute("nomecomp");




        String status = String.valueOf(request.getParameter("status"));
        String year = String.valueOf(request.getParameter("year"));
        String areaselect = String.valueOf(request.getParameter("areaselect"));

        listarPacotes projetosdao = new listarPacotes();

        List<tbPacote> dashhome = projetosdao.listar();

        int qtdhub = 0;
        int qtdkey = 0;
        int qtdservices = 0;
        int qtdincentive = 0;
        int qtdproprietarios = 0;

        double gmhub = 0;
        double gmkey = 0;
        double gmservices = 0;
        double gmincentive = 0;
        double gmproprietarios = 0;

        double hubaverage = 0;
        double keyaverage = 0;
        double servicesaverage = 0;
        double incentiveaverage = 0;
        double proprietariosaverage = 0;

        for (Iterator iterator = dashhome.iterator(); iterator.hasNext();) {
            tbPacote projeto = (tbPacote) iterator.next();
            
//            if (projeto.getSubarea().toUpperCase().equals("HUB")
//                    && projeto.getProjectstatus().toUpperCase().equals("OPEN")
//                    && projeto.isArchived() == false && projeto.getPropreqdate().contains("2018")
//                    || projeto.getSubarea().toUpperCase().equals("HUB")
//                    && projeto.getProjectstatus().toUpperCase().equals("WON")
//                    && projeto.isArchived() == false && projeto.getPropreqdate().contains("2018")) {
//                qtdhub++;
//                gmhub = gmhub + projeto.getGmforowner();
//                hubaverage = gmhub / qtdhub;
//
//            } else if (projeto.getSubarea().toUpperCase().equals("SERVICES")
//                    && projeto.getProjectstatus().toUpperCase().equals("OPEN")
//                    && projeto.isArchived() == false && projeto.getPropreqdate().contains("2018")
//                    || projeto.getSubarea().toUpperCase().equals("SERVICES")
//                    && projeto.getProjectstatus().toUpperCase().equals("WON")
//                    && projeto.isArchived() == false && projeto.getPropreqdate().contains("2018")) {
//                qtdservices++;
//                gmservices = gmservices + projeto.getGmforowner();
//                servicesaverage = gmservices / qtdservices;
//
//            } else if (projeto.getSubarea().toUpperCase().equals("KEY ACCOUNTS")
//                    && projeto.getProjectstatus().toUpperCase().equals("OPEN")
//                    && projeto.isArchived() == false && projeto.getPropreqdate().contains("2018")
//                    || projeto.getSubarea().toUpperCase().equals("KEY ACCOUNTS")
//                    && projeto.getProjectstatus().toUpperCase().equals("WON")
//                    && projeto.isArchived() == false && projeto.getPropreqdate().contains("2018")) {
//                qtdkey++;
//                gmkey = gmkey + projeto.getGmforowner();
//                keyaverage = gmkey / qtdkey;
//
//            } else if (projeto.getSubarea().toUpperCase().equals("INCENTIVE/OVATION")
//                    && projeto.getProjectstatus().toUpperCase().equals("OPEN")
//                    && projeto.isArchived() == false && projeto.getPropreqdate().contains("2018")
//                    || projeto.getSubarea().toUpperCase().equals("INCENTIVE/OVATION")
//                    && projeto.getProjectstatus().toUpperCase().equals("WON")
//                    && projeto.isArchived() == false && projeto.getPropreqdate().contains("2018")) {
//                qtdincentive++;
//                gmincentive = gmincentive + projeto.getGmforowner();
//                incentiveaverage = gmincentive / qtdincentive;
//
//            } else if (projeto.getSubarea().toUpperCase().equals("PROJETOS PROPRIETÁRIOS")
//                    && projeto.getProjectstatus().toUpperCase().equals("OPEN")
//                    && projeto.isArchived() == false && projeto.getPropreqdate().contains("2018")
//                    || projeto.getSubarea().toUpperCase().equals("PROJETOS PROPRIETÁRIOS")
//                    && projeto.getProjectstatus().toUpperCase().equals("WON")
//                    && projeto.isArchived() == false && projeto.getPropreqdate().contains("2018")) {
//                qtdproprietarios++;
//                gmproprietarios = gmproprietarios + projeto.getGmforowner();
//                proprietariosaverage = gmproprietarios / qtdproprietarios;
//            }

        }

        // QUANTIDADES 
        sessao.setAttribute("qtdhub", qtdhub);
        sessao.setAttribute("qtdkey", qtdkey);
        sessao.setAttribute("qtdservices", qtdservices);
        sessao.setAttribute("qtdincentive", qtdincentive);
        sessao.setAttribute("qtdproprietarios", qtdproprietarios);

        NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                new Locale("pt", "BR"));

        //GROSS MARGIN
        sessao.setAttribute("gmhub", formatoMoeda.format(gmhub));
        sessao.setAttribute("gmkey", formatoMoeda.format(gmkey));
        sessao.setAttribute("gmservices", formatoMoeda.format(gmservices));
        sessao.setAttribute("gmincentive", formatoMoeda.format(gmincentive));
        sessao.setAttribute("gmproprietarios", formatoMoeda.format(gmproprietarios));

        //AVERAGE 
        sessao.setAttribute("hubaverage", formatoMoeda.format(hubaverage));
        sessao.setAttribute("keyaverage", formatoMoeda.format(keyaverage));
        sessao.setAttribute("servicesaverage", formatoMoeda.format(servicesaverage));
        sessao.setAttribute("incentiveaverage", formatoMoeda.format(incentiveaverage));
        sessao.setAttribute("propaverage", formatoMoeda.format(proprietariosaverage));


        request.getRequestDispatcher("reports/reports.jsp").forward(request, response);

    }

}
