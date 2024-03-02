import java.util.ArrayList;
import java.util.Random;

public class BicicletaMontania extends Bicicleta{
    public BicicletaMontania(int id){
        this.id = id;
        tipo = "montaña";
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Soy una bici de " + this.tipo + " con id : " + this.id + "\n");
    }

    @Override
    public void run() {
        System.out.println("Empezo a correr la bici de Montaña con ID : " + id);
    }
}
