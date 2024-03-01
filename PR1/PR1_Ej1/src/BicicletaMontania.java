import java.util.Random;

public class BicicletaMontania extends Bicicleta{

    public BicicletaMontania(){
        Random rand = new Random();
        id = rand.nextInt(11);
        tipo = "montania";
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Soy una bici de " + this.tipo + " con id : " + this.id + "\n");
    }
}
