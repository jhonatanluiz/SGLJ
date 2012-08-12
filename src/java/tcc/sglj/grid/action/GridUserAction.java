package tcc.sglj.grid.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.ProjectionList;

import tcc.sglj.util.HibernateUtil;
import tcc.sglj.model.User;

/**
 *
 * @author Jhonatan L S Santos
 */
@Namespace(value = "/user")
@ParentPackage(value = "json-default")
public class GridUserAction extends GridAction {
    
    @Action(value = "list", results = {
        @Result(name = "success", location = "/view/usuario/list.jsp")
    })
    public String listUser() {
        
    
        try {
            Session session = HibernateUtil.getSession();

            setRecords(Integer.parseInt(session.createCriteria(User.class)
                    .add(Restrictions.eq("status", true))
                    .setProjection(Projections.rowCount())
                    .list().iterator().next().toString()));

            setTotal((int) Math.ceil((double) getRecords() / (double) getRows()));

            setStart(getRows() * getPage() - getRows());

            Criteria crit = session.createCriteria(User.class);
            ProjectionList projection = Projections.projectionList();
            projection.add(Projections.property("id"));
            projection.add(Projections.property("name"));
            projection.add(Projections.property("email"));
            projection.add(Projections.property("cpf"));
            projection.add(Projections.property("phone"));
            projection.add(Projections.property("sign"));
            projection.add(Projections.property("permission"));
            crit.add(Restrictions.eq("status", true));

            crit.setProjection(projection);

            if (getSord().equals("desc")) {
                crit.addOrder(Order.desc(getSidx()));
            } else {
                crit.addOrder(Order.asc(getSidx()));
            }

            if (!getField().equals("") && !getSearch().equals("")) {
                crit.add(Restrictions.ilike(getField(), "%" + getSearch() + "%"));
            }

            crit.setFirstResult(getStart());
            crit.setMaxResults(getRows());

            this.setData(crit.list());

            if (!getField().equals("") && !getSearch().equals("")) {
                this.setRecords(this.getData().size());
                this.setTotal((int) Math.ceil((double) getRecords() / (double) getRows()));
            }

        } catch (Exception e) {
            
        }
        return "success";
    }
}