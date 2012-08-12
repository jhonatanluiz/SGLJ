/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tcc.sglj.app;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import java.util.List;

import tcc.sglj.model.User;
import tcc.sglj.util.HibernateUtil;

/**
 *
 * @author jhonatan
 */
public class Authenticate {

    public static User authentic(User user) {
        Session session = HibernateUtil.getSession();
         
         Criteria crit = session.createCriteria(User.class)
                 .add(Restrictions.eq("email", user.getEmail()))
                 .add(Restrictions.eq("password", user.getPassword()))
                 .add(Restrictions.eq("status", true));

        List result = crit.list();
        if (result.isEmpty()) {
            return null;
        }
        HibernateUtil.getSession().close();
        return (User)result.get(0);
    }
}

