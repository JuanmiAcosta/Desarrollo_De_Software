
public class BicicletaMontania extends Bicicleta{

    public BicicletaMontania(){
        tipo = "montania";
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Es una bici de " + this.tipo + " con id : " + this.id + "\n");
    }
}
