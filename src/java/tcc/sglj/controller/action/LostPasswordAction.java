/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tcc.sglj.controller.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Namespace;

import tcc.sglj.message.MessageInterface;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author jhonatan
 */
@Namespace("/Account")
@ParentPackage(value = "json-default")
public class LostPasswordAction extends Controller {

    @Action(value = "/password", results = {
        @Result(name = "success", location = "/view/password/index.jsp")
    })
    public String index() {
        return "success";
    }

    @Action(value = "/send-email", results = {
        @Result(name = "success", location = "/view/password/index.jsp"),
        @Result(name = "error", location = "/view/password/index.jsp")
    })
    public String email() {
        HttpServletRequest request = ServletActionContext.getRequest();

        String cpf = request.getParameter("cpf_usuario");
        String email = request.getParameter("email_usuario");


        if (cpf != null) {
            
        } else if (email != null) {
            
        } else {
            setSuccess(false);
            setMessage("error");
            return "error";
        }

        return "success";
    }
}
