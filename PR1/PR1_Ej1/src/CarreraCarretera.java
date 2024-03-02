public class CarreraCarretera extends Carrera{

    public CarreraCarretera(){
        tipo="carretera";
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Es una carrera de " + this.tipo + "\n");
    }

}
