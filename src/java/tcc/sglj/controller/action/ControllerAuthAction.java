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

import tcc.sglj.model.User;
import tcc.sglj.util.Encrypt;
import tcc.sglj.app.Authenticate;

/**
 *
 * @author jhonatan
 */
@ParentPackage(value = "json-default")
public class ControllerAuthAction {

    private boolean success;
    private String message;
    private User user;

    @Action(value = "autenticar", results = {
        @Result(name = "success", type = "json")
    })
    public String auth() {

        getUser().setPassword(new Encrypt(getUser().getPassword()).encrypt());
        User valid = Authenticate.authentic(getUser());

        if (valid != null) {
            ServletActionContext.getContext().getSession().put("sistema", "SGLJ");            
            ServletActionContext.getContext().getSession().put("user", valid);
            setSuccess(true);
            return "success";
        } else {
            setSuccess(false);
            setMessage("Usuário ou senha estão incorretos. verifique se o email e senha foram digitados corretamente.");
        }
        return "success";
    }

    @Action(value = "sair",
    results =
    @Result(name = "success", location = "/index.jsp"))
    public String logout() {
        ServletActionContext.getContext().getSession().remove("user");
        setSuccess(true);
        return "success";
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
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
     * @return the success
     */
    public boolean getSuccess() {
        return success;
    }

    /**
     * @param success the success to set
     */
    public void setSuccess(boolean success) {
        this.success = success;
    }
}
