/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tcc.sglj.grid.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.ProjectionList;

import tcc.sglj.util.HibernateUtil;
import tcc.sglj.model.CarMark;
import tcc.sglj.model.CarModel;

/**
 *
 * @author jhonatan
 */
@Namespace(value = "/car")
@ParentPackage(value = "json-default")
public class GridCarAction extends GridAction {

    @Action(value = "listMark", results = {
        @Result(name = "success", location = "/view/car/grid_car_mark.jsp")
    })
    public String listMark() {
        try {
            Session session = HibernateUtil.getSession();

            setRecords(Integer.parseInt(session.createCriteria(CarMark.class)
                    .add(Restrictions.eq("status", true))
                    .setProjection(Projections.rowCount())
                    .list().iterator().next().toString()));

            setTotal((int) Math.ceil((double) getRecords() / (double) getRows()));

            setStart(getRows() * getPage() - getRows());

            Criteria crit = session.createCriteria(CarMark.class, "mark")
                    .createAlias("carModels", "model")
                    .setProjection(Projections.projectionList()
                    .add(Projections.groupProperty("mark.id"))
                    .add(Projections.groupProperty("mark.nameMark"))
                    .add(Projections.count("model.carMark")));

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
            e.getCause().toString();
        }
        return "success";
    }
}
