public class CarreraMontania extends Carrera{

    public CarreraMontania(){
        tipo="montania";
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Soy una carrera de " + this.tipo +"\n");
    }
}
