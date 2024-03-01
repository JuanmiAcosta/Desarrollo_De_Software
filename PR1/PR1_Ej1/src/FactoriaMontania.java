public class FactoriaMontania implements FactoriaCarreraYBicicleta{
    @Override
    public Carrera crearCarrera(String nombre) {
        return new CarreraMontania(nombre);
    }

    @Override
    public Bicicleta crearBicicleta() {
        return new BicicletaMontania();
    }
}
