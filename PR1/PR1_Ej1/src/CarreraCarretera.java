public class CarreraCarretera extends Carrera{

    public CarreraCarretera(){
        tipo="carretera";
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Soy una carrera de " + this.tipo + "\n");
    }
}
