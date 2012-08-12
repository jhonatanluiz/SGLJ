/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tcc.sglj.dao;

import java.io.Serializable;
import java.util.List;
import java.lang.reflect.Type;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.HibernateException;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Example;
import org.hibernate.LockMode;

import tcc.sglj.util.HibernateUtil;

/**
 *
 * @author zsled
 */
public class HibernateImplDao<T, ID extends Serializable>
        implements Dao<T, ID> {

    private Class persistentClass;
    private Session session;

    public HibernateImplDao() {
        Type tipo = (Type) this.getClass().getGenericSuperclass();
        this.persistentClass = (Class) tipo.getClass();

        this.session = HibernateUtil.getSession();

    }

    @SuppressWarnings("unchecked")
    public void setSession(Session s) {
        this.session = s;
    }

    protected Session getSession() {
        if (session == null) {
            throw new IllegalStateException("Session não foi inicializado!");
        }
        return session;
    }

    @Override
    public void saveOrUpdate(T object) {
        Session s = HibernateUtil.getSession();
        Transaction tx = s.beginTransaction();
        try {
            s.flush();
            s.saveOrUpdate(object);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw new HibernateException(e);
        }
    }
  
}
