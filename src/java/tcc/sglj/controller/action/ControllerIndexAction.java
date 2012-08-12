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


/**
 *
 * @author jhonatan
 */
@ParentPackage(value = "json-default")
public class ControllerIndexAction extends Controller{
    
    @Action(value = "index", results = {
        @Result(name = "success", location = "/index.jsp")
    })
    public String index() {        
        init();      
        
        return "success";
    }
    
    
}
