/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tcc.sglj.dao;

import java.io.Serializable;

/**
 *
 * @author Jhonatan L S Santos
 */
public interface Dao<T, ID extends Serializable> {
    public void saveOrUpdate (T object);
}
