import java.util.Random;
public class BicicletaCarretera extends Bicicleta{

    public BicicletaCarretera(){
        Random rand = new Random();
        id = rand.nextInt(101);
        tipo = "carretera";
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Soy una bici de " + this.tipo + " con id : " + this.id + "\n");
    }
}
