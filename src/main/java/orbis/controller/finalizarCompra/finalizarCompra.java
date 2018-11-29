/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.finalizarCompra;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.model.cliente.tbCliente;
import orbis.model.itemVenda.tbItemVenda;
import orbis.model.venda.tbVenda;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/FinalizarCompra", urlPatterns = {"/FinalizarCompra"})
public class finalizarCompra extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession();

        String datavenda = new SimpleDateFormat("dd/MM/yyyy hh:mm").format(Calendar.getInstance().getTime());

        NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                new Locale("pt", "BR"));

        tbVenda venda = new tbVenda();
        tbItemVenda ingressos = new tbItemVenda();

        double valor = Double.valueOf(request.getParameter("valor"));
        double total = Double.valueOf(request.getParameter("total").replace(".", "").replace(",", "."));
        String localSaida = (String) request.getParameter("localSaida");
        String localDestino = (String) request.getParameter("localDestino");
        String data = (String) request.getParameter("data");
        int idpacote = Integer.valueOf(request.getParameter("idpacote"));
        String tipoPagamento = String.valueOf(request.getParameter("paymentMethod"));

        Integer idcliente = (Integer) sessao.getAttribute("idcliente");
        int quantidade = Integer.valueOf(request.getParameter("quantidade"));

        venda.setIdcliente(idcliente);
        venda.setDthvenda(String.valueOf(datavenda));
        venda.setTotal(total);
        venda.setIdpacote(idpacote);
        venda.setTipoPagamento(tipoPagamento);
        venda.setIngressos(quantidade);

        ingressos.setValor(valor);
        ingressos.setDthvenda(String.valueOf(datavenda));
        ingressos.setIdpacote(idpacote);
        int idvenda = 0;

        if (venda.getTotal() <= 0) {
            String path = "index.jsp";
            String mensagem = "Ocorreu um erro. Favor tentar novamente";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        } else {

            //indica as configuracoes do banco
            Configuration con = new Configuration().configure().addAnnotatedClass(tbVenda.class);
            SessionFactory sf = con.buildSessionFactory();

            //abre sessao com o banco
            Session session = sf.openSession();

            try {

                //inicia a transacao com o banco
                Transaction tx = session.beginTransaction();

                idvenda = (Integer) session.save(venda);
                ingressos.setIdvenda(idvenda);

                //comita as informacoes
                tx.commit();

            } finally {
                if (session != null) {
                    session.close();
                    sf.close();
                }

            }

            gravarIngressos gravarIngressos = new gravarIngressos();
            gravarIngressos.gravarIngressos(ingressos, quantidade);

            ingressosEstoque ingressosEstoque = new ingressosEstoque();
            ingressosEstoque.ingressosEstoque(idpacote, quantidade);

        }

        request.setAttribute("to1", "pauloh2012sul@gmail.com");
        request.setAttribute("subject", "Compra Efetuada com Sucesso para o Destino " + localDestino);
        request.setAttribute("body", "Sua compra foi finalizada para o Destino " + localDestino + ". \n A data de "
                + "saída será " + data + " com saída de " + localSaida + ". O número do protocolo é " + idvenda);
        request.setAttribute("localSaida", "Venda Bahia");
        request.setAttribute("localDestino", "comprador");
        request.setAttribute("protocolo", idvenda);
        request.setAttribute("roteiro", "Rolezinho");
        request.setAttribute("data", data);
        request.setAttribute("valor", valor);

        request.getRequestDispatcher("emailAlertaVenda.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
