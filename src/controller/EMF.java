package controller;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Created by User on 13/12/2015.
 */
public class EMF {
    private static final EntityManagerFactory emfInstance = Persistence.createEntityManagerFactory("NewPersistenceUnit");

    public EMF() {}

    public static EntityManagerFactory get() {
        return emfInstance;
    }
}
