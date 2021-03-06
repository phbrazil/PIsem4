/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.minhasCompras;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.model.pacote.tbPacote;
import orbis.model.venda.tbVenda;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/minhasCompras", urlPatterns = {"/minhasCompras"})
public class minhasCompras extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

        int idcliente = (Integer) sessao.getAttribute("idCliente");

        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbVenda.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();
        List<tbVenda> vendas;
        List<tbPacote> pacotes;

        try {

            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            String hql = "from tbVenda where idcliente =" + idcliente;

            vendas = session.createQuery(hql).list();

            //comita as informacoes
            tx.commit();
        } finally {
            if (session != null) {
                session.close();
                sf.close();
            }
        }

        con = new Configuration().configure().
                addAnnotatedClass(tbPacote.class).addAnnotatedClass(tbVenda.class);

        sf = con.buildSessionFactory();

        session = sf.openSession();

        try {

            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            String hql = "from tbPacote where idpacote in(select idpacote from tbVenda where idcliente =" + idcliente+")";

            pacotes = session.createQuery(hql).list();

            //comita as informacoes
            tx.commit();
        } finally {
            if (session != null) {
                session.close();
                sf.close();
            }
        }

        request.setAttribute("minhasCompras", vendas);
        request.setAttribute("pacotes", pacotes);

        request.getRequestDispatcher("minhasCompras.jsp").forward(request, response);

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
