package ensamblador;

import java.util.ArrayList;

/**
 *
 * @author Jorge
 */
public class Etiquetas {
    int direccion;
    boolean definicion;
    ArrayList<Codigo> llamadas = new ArrayList();

    public void Hola(){
        System.out.println("File Accept");
    }

    public Etiquetas(boolean definicion) {
        this.definicion = definicion;
    }
    public Etiquetas(int direccion, boolean definicion) {
        this.direccion = direccion;
        this.definicion = definicion;
    }
    
    

}