import java.util.Random;
public class BicicletaCarretera extends Bicicleta{
    public BicicletaCarretera(int id){
        this.id = id;
        tipo = "carretera";
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Soy una bici de " + this.tipo + " con id : " + this.id + "\n");
    }

    @Override
    public void run() {
        System.out.println("Empezo a correr la bici de Carretera con ID : " + id);
    }
}