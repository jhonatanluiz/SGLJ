/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tcc.sglj.dao;

import java.util.List;
import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import tcc.sglj.model.Service;
import tcc.sglj.util.HibernateUtil;

/**
 *
 * @author jhonatan L S Santos
 */
public class DaoService<T, ID extends Serializable> extends HibernateImplDao<T, ID> {

    public DaoService() {
        super();
    }

    public boolean validService(String cpf, Service u) {
        /*List user = getSession().createCriteria(User.class).add(Restrictions.eq("cpf", cpf)).list();
        if (user.isEmpty()) {
            return true;
        } else if(u != null) {
            User a = (User)user.get(0);
            if(a.getId() == u.getId()) {
                return true;
            }
        }*/
        return false;
    }

    public Service getServiceById(int id) {
        Session session = HibernateUtil.getSession();
        Service service = (Service) session.load(Service.class, id);
        
        if (service == null) {
            return null;
        }
        return service;
    }
}
