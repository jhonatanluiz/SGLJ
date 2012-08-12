/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tcc.sglj.controller.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ParentPackage;

import tcc.sglj.message.MessageInterface;
import tcc.sglj.model.CarMark;
import tcc.sglj.dao.DaoCarMark;
import tcc.sglj.app.MaintainCarMarkApp;

/**
 *
 * @author jhonatan
 */
@ParentPackage(value = "json-default")
public class ControllerCarAction extends Controller {

    private CarMark carMark;
    static MessageInterface messageInterface;

    @Action(value = "form", results = {
        @Result(name = "success", location = "/view/car/car.jsp")
    })
    public String page() {
        init();
        return "success";
    }

    @Action(value = "sign-car-mark", results = {
        @Result(name = "success", location = "/view/car/message.jsp")
    })
    public String signCarMark() {
        MaintainCarMarkApp maintain = new MaintainCarMarkApp();

        try {
            if (maintain.sign(getCarMark())) {
                setSuccess(true);
                setMessage(messageInterface.MSG001.toString());
            } else {
                setSuccess(false);
                setMessage(maintain.getErrorMessage());
            }
        } catch (Exception e) {
            setSuccess(false);
            setMessage(messageInterface.MSG006.toString() + "Detalhe do error: "
                    + maintain.getErrorMessage());
        }
        return "success";
    }

    /**
     * @return the carMark
     */
    public CarMark getCarMark() {
        return carMark;
    }

    /**
     * @param carMark the carMark to set
     */
    public void setCarMark(CarMark carMark) {
        this.carMark = carMark;
    }
}
