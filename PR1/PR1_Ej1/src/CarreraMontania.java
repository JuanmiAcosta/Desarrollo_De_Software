public class CarreraMontania extends Carrera{

    public CarreraMontania(){
        tipo="montania";
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Es una carrera de " + this.tipo +"\n");
    }

}
