/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.itemVendaJPA;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.UserTransaction;
import orbis.controller.itemVendaJPA.exceptions.NonexistentEntityException;
import orbis.controller.itemVendaJPA.exceptions.RollbackFailureException;
import orbis.model.itemVenda.tbItemVenda;

/**
 *
 * @author ASAPH-001
 */
public class tbItemVendaJpaController implements Serializable {

    public tbItemVendaJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(tbItemVenda itemVenda) throws RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            em.persist(itemVenda);
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

    public void edit(tbItemVenda itemVenda) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            itemVenda = em.merge(itemVenda);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = itemVenda.getId();
                if (finditemVenda(id) == null) {
                    throw new NonexistentEntityException("The itemVenda with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            tbItemVenda itemVenda;
            try {
                itemVenda = em.getReference(tbItemVenda.class, id);
                itemVenda.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The itemVenda with id " + id + " no longer exists.", enfe);
            }
            em.remove(itemVenda);
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

    public List<tbItemVenda> finditemVendaEntities() {
        return finditemVendaEntities(true, -1, -1);
    }

    public List<tbItemVenda> finditemVendaEntities(int maxResults, int firstResult) {
        return finditemVendaEntities(false, maxResults, firstResult);
    }

    private List<tbItemVenda> finditemVendaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(tbItemVenda.class));
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

    public tbItemVenda finditemVenda(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(tbItemVenda.class, id);
        } finally {
            em.close();
        }
    }

    public int getitemVendaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<tbItemVenda> rt = cq.from(tbItemVenda.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
