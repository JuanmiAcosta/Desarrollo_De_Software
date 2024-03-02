
public class BicicletaCarretera extends Bicicleta{

    public BicicletaCarretera(){
        tipo = "carretera";
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Es una bici de " + this.tipo + " con id : " + this.id + "\n");
    }
}
