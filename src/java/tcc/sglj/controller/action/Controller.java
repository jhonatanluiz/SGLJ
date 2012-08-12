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

import tcc.sglj.model.User;

import java.util.Map;
import java.util.HashMap;

/**
 *
 * @author jhonatan
 */
public class Controller {
    
    private User sessionUser;
    private String titlePage;
    private String message;
    private boolean success;
    private HttpServletRequest applicationRequest;
    private Map<String, String> applicationContext;
    
    public void init() {
        setApplicationContext(new HashMap<String, String>());
        setApplicationRequest(ServletActionContext.getRequest());
        
        getApplicationContext().put("action",ServletActionContext
                .getActionContext(getApplicationRequest())
                .getActionInvocation().getProxy().getActionName());
        
        
        getApplicationContext().put("controller",ServletActionContext
                .getActionContext(getApplicationRequest())
                .getActionInvocation().getProxy().getNamespace()
                .replaceAll("/", ""));
        
        getApplicationContext().put("application",
                getApplicationRequest().getContextPath()
                .replaceAll("/", ""));
        
        getApplicationContext().put("uri",getApplicationRequest()
                .getRequestURI());
        getApplicationContext().put("url",getApplicationRequest()
                .getRequestURL().toString());
        
        setSessionUser((User) ServletActionContext
                .getContext().getSession().get("user"));
        
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
     * @return the success
     */
    public boolean isSuccess() {
        return success;
    }

    /**
     * @param success the success to set
     */
    public void setSuccess(boolean success) {
        this.success = success;
    }

    /**
     * @return the applicationRequest
     */
    public HttpServletRequest getApplicationRequest() {
        return applicationRequest;
    }

    /**
     * @param applicationRequest the applicationRequest to set
     */
    public void setApplicationRequest(HttpServletRequest applicationRequest) {
        this.applicationRequest = applicationRequest;
    }

    /**
     * @return the applicationContext
     */
    public Map<String, String> getApplicationContext() {
        return applicationContext;
    }

    /**
     * @param applicationContext the applicationContext to set
     */
    public void setApplicationContext(HashMap<String, String> applicationContext) {
        this.applicationContext = applicationContext;
    }

    /**
     * @return the titlePage
     */
    public String getTitlePage() {
        return titlePage;
    }

    /**
     * @param titlePage the titlePage to set
     */
    public void setTitlePage(String titlePage) {
        this.titlePage = titlePage;
    }

    /**
     * @return the sessionUser
     */
    public User getSessionUser() {
        return sessionUser;
    }

    /**
     * @param sessionUser the sessionUser to set
     */
    public void setSessionUser(User sessionUser) {
        this.sessionUser = sessionUser;
    }
}
