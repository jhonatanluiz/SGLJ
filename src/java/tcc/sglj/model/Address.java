/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tcc.sglj.model;


import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.ManyToOne;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

/**
 *
 * @author jhonatan
 */

@Entity
@Table(name = "tb_endereco")
@SuppressWarnings("serial")
public class Address {

    @Id
    @Column(name = "id_endereco")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idAddress;

    @Column(name = "nu_residencia", nullable = false)
    private int number;

    @Column(name = "complemento", nullable = true)
    private String complement;

    @Column(name = "endereco", nullable = true)
    private String addressUser;

    @Column(name = "cidade")
    private String city;

    @Column(name = "bairro", nullable = true)
    private String district;

    @Column(name = "cep", nullable = true)
    private String zipCode;

    @ManyToOne
    @JoinColumn(name = "id_uf", nullable = true)
    private State state;


    /**
     * @return the idAddress
     */
    public int getIdAddress() {
        return idAddress;
    }

    /**
     * @param idAddress the idAddress to set
     */
    public void setIdAddress(int idAddress) {
        this.idAddress = idAddress;
    }

    /**
     * @return the number
     */
    public int getNumber() {
        return number;
    }

    /**
     * @param number the number to set
     */
    public void setNumber(int number) {
        this.number = number;
    }

    /**
     * @return the complement
     */
    public String getComplement() {
        return complement;
    }

    /**
     * @param complement the complement to set
     */
    public void setComplement(String complement) {
        this.complement = complement;
    }

    /**
     * @return the addressUser
     */
    public String getAddressUser() {
        return addressUser;
    }

    /**
     * @param addressUser the addressUser to set
     */
    public void setAddressUser(String addressUser) {
        this.addressUser = addressUser;
    }

    /**
     * @return the district
     */
    public String getDistrict() {
        return district;
    }

    /**
     * @param district the district to set
     */
    public void setDistrict(String district) {
        this.district = district;
    }

    /**
     * @return the zipCode
     */
    public String getZipCode() {
        return zipCode;
    }

    /**
     * @param zipCode the zipCode to set
     */
    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    /**
     * @return the state
     */
    public State getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(State state) {
        this.state = state;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

}
