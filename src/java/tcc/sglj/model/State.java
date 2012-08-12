/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tcc.sglj.model;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

import java.util.Collection;

/**
 *
 * @author sled
 */
@Entity
@Table(name = "tb_uf")
@SuppressWarnings("serial")
public class State {

    @Id
    @Column(name = "id_uf")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idUf;

    @Column(name = "sg_uf")
    private String uf;

    @Column(name = "nm_uf", nullable = false)
    private String state;

    @OneToMany(cascade = CascadeType.ALL, mappedBy="state")
    private Collection<Address> address;

    /**
     * @return the idUf
     */
    public int getIdUf() {
        return idUf;
    }

    /**
     * @param idUf the idUf to set
     */
    public void setIdUf(int idUf) {
        this.idUf = idUf;
    }

    /**
     * @return the uf
     */
    public String getUf() {
        return uf;
    }

    /**
     * @param uf the uf to set
     */
    public void setUf(String uf) {
        this.uf = uf;
    }

    /**
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * @return the address
     */
    public Collection<Address> getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(Collection<Address> address) {
        this.address = address;
    }

   
}