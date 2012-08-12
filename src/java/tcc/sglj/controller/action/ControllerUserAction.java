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

import javax.servlet.http.HttpServletRequest;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import tcc.sglj.model.*;
import tcc.sglj.dao.DaoUser;
import tcc.sglj.app.MaintainUserApp;
import tcc.sglj.app.Authenticate;
import tcc.sglj.util.Encrypt;
import tcc.sglj.message.MessageInterface;

/**
 *
 * @author Jhonatan L S Santos
 */
@Namespace(value = "/user")
@ParentPackage(value = "json-default")
public class ControllerUserAction extends Controller {

    private User user;
    private boolean log;
    private String titlePage;
    private String action;
    private boolean newSign;
    static MessageInterface messageInterface;

    @Action(value = "sign", results =
    @Result(name = "success", location = "/view/usuario/alert.jsp"))
    public String sign() {

        try {

            setNewSign(false);

            if (ServletActionContext.getRequest().getParameter("user.id").equals("")) {
                getUser().setPassword(new Encrypt(getUser().getPassword()).encrypt());
                getUser().setSign(new Date());
                setNewSign(true);
            } else {
                User a = new DaoUser().getUserById(getUser().getId());
                getUser().setPassword(a.getPassword());
                getUser().setSign(a.getSign());
            }

            User s = (User) ServletActionContext.getContext().getSession().get("user");

            /*
             * caso não tenha sessão ou usuário administrador logado
             * seta a permissão para false;
             */
            if (s == null || !s.isPermission()) {
                getUser().setPermission(false);
            }

            MaintainUserApp maintain = new MaintainUserApp();

            if (maintain.sign(getUser())) {
                /*
                 * caso o usuário alterado seja o mesmo usuário logado
                 * atualizado dados salvos na sessão
                 */
                if (s != null && s.getId() == getUser().getId()) {
                    ServletActionContext.getContext().getSession().put("user", getUser());
                }
                setSuccess(true);
                setMessage("Cadastro realizado com sucesso!");
            } else {
                setSuccess(false);
                setMessage(maintain.getErrorMessage());
            }

        } catch (Exception e) {
            setSuccess(false);
            setMessage("asdf execpetion");
        }

        setAction("cadastro");
        return "success";
    }

    @Action(value = "delete", results = {
        @Result(name = "success", location = "/view/usuario/alert.jsp")
    })
    public String delete() {
        try {

            MaintainUserApp maintain = new MaintainUserApp();
            boolean re = maintain.delete(Integer.parseInt(ServletActionContext.getRequest().getParameter("id")));

            if (re) {
                setSuccess(true);
                setMessage("Exclusão realizado com sucesso!");
                User s = (User) ServletActionContext.getContext().getSession().get("user");
                User a = new DaoUser().getUserById(Integer.parseInt(ServletActionContext.getRequest().getParameter("id")));
                if (a.getId() == s.getId()) {
                    ServletActionContext.getContext().getSession().put("user", null);
                    setLog(true);
                }
            } else {
                setSuccess(false);
                setMessage(maintain.getErrorMessage());
            }

        } catch (Exception e) {
            setSuccess(false);
            setMessage(e.getMessage());
        }
        setAction("delete");
        return "success";
    }

    @Action(value = "get", results = {
        @Result(name = "success", type = "json")
    })
    public String get() {
        User u = (User) ServletActionContext.getContext().getSession().get("user");

        if (u != null) {
            setUser(u);
            setSuccess(true);
        } else {
            setSuccess(false);
        }
        return "success";
    }

    @Action(value = "email", results = {
        @Result(name = "success", type = "httpheader", params = {"status", "200"})
    })
    public String email() throws Exception {
        DaoUser dao = new DaoUser();
        User u = (User) dao.validEmail(ServletActionContext.getRequest().getParameter("email"));
        boolean email = false;
        String id = ServletActionContext.getRequest().getParameter("id");

        if (u != null) {
            if (!id.equals("")) {
                if (u.getId() == Integer.parseInt(id)) {
                    email = true;
                }
            }
        } else {
            email = true;
        }

        ServletActionContext.getResponse().getWriter().write(new Boolean(email).toString());
        return "success";
    }

    @Action(value = "cpf", results = {
        @Result(name = "success", type = "httpheader", params = {"status", "200"})
    })
    public String cpf() throws Exception {
        DaoUser dao = new DaoUser();
        User u = (User) dao.validCPF(ServletActionContext.getRequest().getParameter("cpf"));
        boolean cpf = false;
        String id = ServletActionContext.getRequest().getParameter("id");

        if (u != null) {
            if (!id.equals("")) {
                if (u.getId() == Integer.parseInt(id)) {
                    cpf = true;
                }
            }
        } else {
            cpf = true;
        }

        ServletActionContext.getResponse().getWriter().write(new Boolean(cpf).toString());
        return "success";
    }

    @Action(value = "form", results = {
        @Result(name = "success", location = "/view/usuario/usuario.jsp")
    })
    public String page() {
        init();

        if (getSessionUser() == null) {
            setTitlePage("Novo cadastro");
        } else if (getSessionUser().isPermission()) {
            setTitlePage("Painel usuário");
        } else {
            setTitlePage("Editar cadastro");
        }

        String id = getApplicationRequest().getParameter("user.id");

        if (id != null) {
            User a = new DaoUser().getUserById(Integer.parseInt(id));
            setUser(a);
        } else if (getSessionUser() != null && !getSessionUser().isPermission()) {
            setUser(getSessionUser());
        } else {
            setNewSign(true);
            setUser(null);
        }


        return "success";
    }

    @Action(value = "password", results = {
        @Result(name = "success", location = "/view/usuario/alert.jsp")
    })
    public String password() {
        setAction("password");

        try {

            User u = (User) ServletActionContext.getContext().getSession().get("user");
            if (u != null) {
                String atual = ServletActionContext.getRequest().getParameter("actual.password");
                String nova = ServletActionContext.getRequest().getParameter("new.password");

                if (atual != null && nova != null) {
                    atual = new Encrypt(atual).encrypt();
                    if (u.getPassword().trim().equals(atual)) {
                        u.setPassword(new Encrypt(nova).encrypt());
                        MaintainUserApp maintain = new MaintainUserApp();
                        if (maintain.sign(u)) {
                            setSuccess(true);
                            setMessage(messageInterface.MSG003.toString());
                            ServletActionContext.getContext().getSession().put("user", u);
                        } else {
                            setSuccess(false);
                            setMessage(maintain.getErrorMessage());
                        }
                    } else {
                        setMessage(messageInterface.MSG004.toString());
                    }
                } else {
                    throw new Exception(messageInterface.MSG005.toString());
                }
            }
        } catch (Exception e) {
            setMessage(messageInterface.MSG006.toString());
        }
        return "success";
    }

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the log
     */
    public boolean isLog() {
        return log;
    }

    /**
     * @param log the log to set
     */
    public void setLog(boolean log) {
        this.log = log;
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
     * @return the newSign
     */
    public boolean isNewSign() {
        return newSign;
    }

    /**
     * @param newSign the newSign to set
     */
    public void setNewSign(boolean newSign) {
        this.newSign = newSign;
    }
}
