/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tcc.sglj.dao;

import java.util.List;
import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import tcc.sglj.model.User;
import tcc.sglj.util.HibernateUtil;

/**
 *
 * @author jhonatan L S Santos
 */
public class DaoUser<T, ID extends Serializable> extends HibernateImplDao<T, ID> {

    public DaoUser() {
        super();
    }

    public User validCPF(String cpf) {
        List user = getSession().createCriteria(User.class).add(Restrictions.eq("cpf", cpf)).list();
        if (user.isEmpty()) {
            return null;
        }
        return (User) user.get(0);
    }

    public User validEmail(String email) {
        List emails = getSession().createCriteria(User.class).add(Restrictions.eq("email", email)).list();
        if (emails.isEmpty()) {
            return null;
        }
        return (User) emails.get(0);
    }

    public User getUserById(int id) {
        Session session = HibernateUtil.getSession();
        User user = (User) session.load(User.class, id);
        if (user == null) {
            return null;
        }
        return user;
    }
}
