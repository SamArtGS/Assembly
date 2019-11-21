/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ensamblador;

import static ensamblador.sym.EOF;
import java.io.IOException;

/**
 *
 * @author Jorge
 */
public class Ensamblador {

    /**
     * @param args the command line arguments
     * @throws java.lang.Exception
     */
    public static void main(String[] args) throws Exception{
        try {
            if(args.length <2)
                throw new ArrayIndexOutOfBoundsException("Fatal error: no input files");
            String in = "";
            for(String s : args)
                in += s + " ";
            new input.parser(new input.Yylex(new java.io.StringReader(in))).parse();
            new ensamblador.parser().cargar(input.parser.fileName, input.parser.HexName, input.parser.LstName);
            
        } catch(ArrayIndexOutOfBoundsException e){
            System.err.println(e.getMessage());
        }catch (IOException ex) {
            System.err.println(ex.getMessage());
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
            
            
            /*
            Yylex lexer = new Yylex(new FileReader("C:\\Users\\Jorge\\Documents\\NetBeansProjects\\Ensamblador\\entrada.asm"));
            parser p = new parser(lexer);
            p.parse();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Ensamblador.class.getName()).log(Level.SEVERE, null, ex);
        }
*/
    }
    
}
