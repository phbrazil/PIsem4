/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.DAO.PacotesJPA;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.UserTransaction;
import orbis.DAO.PacotesJPA.exceptions.NonexistentEntityException;
import orbis.DAO.PacotesJPA.exceptions.RollbackFailureException;
import orbis.DAO.pacotes.tbPacotes;

/**
 *
 * @author ASAPH-001
 */
public class tbPacotesJpaController implements Serializable {

    public tbPacotesJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(tbPacotes tbPacotes) throws RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            em.persist(tbPacotes);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(tbPacotes tbPacotes) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            tbPacotes = em.merge(tbPacotes);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = tbPacotes.getIdPacote();
                if (findtbPacotes(id) == null) {
                    throw new NonexistentEntityException("The tbPacotes with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Long id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            tbPacotes tbPacotes;
            try {
                tbPacotes = em.getReference(tbPacotes.class, id);
                tbPacotes.getIdPacote();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The tbPacotes with id " + id + " no longer exists.", enfe);
            }
            em.remove(tbPacotes);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<tbPacotes> findtbPacotesEntities() {
        return findtbPacotesEntities(true, -1, -1);
    }

    public List<tbPacotes> findtbPacotesEntities(int maxResults, int firstResult) {
        return findtbPacotesEntities(false, maxResults, firstResult);
    }

    private List<tbPacotes> findtbPacotesEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(tbPacotes.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public tbPacotes findtbPacotes(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(tbPacotes.class, id);
        } finally {
            em.close();
        }
    }

    public int gettbPacotesCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<tbPacotes> rt = cq.from(tbPacotes.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
