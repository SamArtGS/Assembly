package ensamblador;

/**
 *
 * @author Jorge
 */
public class Codigo {
    String dir;
    String codigo;
    int nbytes;
    String tipo;
    String linea;

    public Codigo(String dir, String codigo) {
        this.dir = dir;
        this.codigo = codigo;
        this.nbytes = codigo.length()/2;
    }
    
    public Codigo(String dir, String codigo, String tipo) {
        this.dir = dir;
        this.codigo = codigo;
        this.nbytes = codigo.length()/2;
        this.tipo = tipo;
    }
    
    public String LstToString(){
        return codigo;
    }

    @Override
    public String toString() {
        return dir + " " + codigo + "\t" + linea;
    }
    
}