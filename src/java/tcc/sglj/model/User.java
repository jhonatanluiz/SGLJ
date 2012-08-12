            /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tcc.sglj.model;

import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.TemporalType;
import javax.persistence.Temporal;


import java.util.Date;

/**
 *
 * @author jhonatan L S Santos
 */
@Entity
@Table(name = "tb_usuario")
public class User {

    @Id
    @Column(name = "id_usuario")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "nm_usuario")
    private String name;
    @Column(name = "nu_cpf")
    private String cpf;
    @Column(name = "ds_email")
    private String email;
    @Column(name = "cd_senha")
    private String password;
    @Column(name = "status")
    private boolean status = true;
    @Column(name = "dt_cadastro")
    @Temporal(TemporalType.DATE)
    private Date sign;
    @Column(name = "telefone")
    private String phone;
    @Column(name = "permissao")
    private boolean permission;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the cpf
     */
    public String getCpf() {
        return cpf;
    }

    /**
     * @param cpf the cpf to set
     */
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the status
     */
    public boolean isStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(boolean status) {
        this.status = status;
    }

    /**
     * @return the sign
     */
    public Date getSign() {
        return sign;
    }

    /**
     * @param sign the sign to set
     */
    public void setSign(Date sign) {
        this.sign = sign;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the permission
     */
    public boolean isPermission() {
        return permission;
    }

    /**
     * @param permission the permission to set
     */
    public void setPermission(boolean permission) {
        this.permission = permission;
    }
}