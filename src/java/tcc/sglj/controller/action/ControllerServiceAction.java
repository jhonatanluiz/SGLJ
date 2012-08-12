/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tcc.sglj.controller.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.ServletActionContext;

import tcc.sglj.model.Service;
import tcc.sglj.app.MaintainServiceApp;
import tcc.sglj.dao.DaoService;
import tcc.sglj.message.MessageInterface;

/**
 *
 * @author Jhonatan L S Santos
 */
@Namespace(value = "/service")
@ParentPackage(value = "json-default")
public class ControllerServiceAction extends Controller{

    private Service service;
    private String action;
    private String url;
    static MessageInterface messageInterface;
    
    @Action(value = "sign", results = {
        @Result(name = "success", location = "/view/service/alert.jsp")
    })
    public String sign() {
        try {

            setAction("sign");
            MaintainServiceApp maintain = new MaintainServiceApp();

            if (maintain.sign(getService())) {
                setSuccess(true);
                if (ServletActionContext.getRequest().getParameter("service.id").equals("")) {
                    setMessage(messageInterface.MSG001.toString());
                } else {
                    setMessage(messageInterface.MSG002.toString());
                }

            } else {
                setSuccess(false);
                setMessage(messageInterface.MSG006.toString() + "Detalhe do error: "
                        + maintain.getErrorMessage());
            }

        } catch (Exception e) {
            setSuccess(false);
            setMessage(e.getMessage());
        }

        return "success";
    }

    @Action(value = "delete", results = {
        @Result(name = "success", location = "/view/service/alert.jsp")
    })
    public String delete() {
        try {
            setAction("delete");
            MaintainServiceApp maintain = new MaintainServiceApp();
            boolean re = maintain.delete(Integer.parseInt(ServletActionContext.getRequest().getParameter("service.id")));

            if (re) {
                setSuccess(true);
                setMessage(messageInterface.MSG007.toString());
            } else {
                setSuccess(false);
                setMessage(messageInterface.MSG006.toString() + "Detalhe do error: "
                        + maintain.getErrorMessage());
            }

        } catch (Exception e) {
            setSuccess(false);
            setMessage(e.getMessage());
        }
        return "success";
    }

    @Action(value = "form", results = {
        @Result(name = "success", location = "/view/service/service.jsp")
    })
    public String page() throws Exception {
        init();

        String id = getApplicationRequest().getParameter("service.id");
        if (id != null) {
            Service s = new DaoService().getServiceById(Integer.parseInt(id));
            if (s != null) {
                setService(s);
            } else {
                setService(null);
            }
        }
        return "success";
    }

    /**
     * @return the service
     */
    public Service getService() {
        return service;
    }

    /**
     * @param service the service to set
     */
    public void setService(Service service) {
        this.service = service;
    }

    /**
     * @return the action
     */
    public String getAction() {
        return action;
    }

    /**
     * @param action the action to set
     */
    public void setAction(String action) {
        this.action = action;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }
}