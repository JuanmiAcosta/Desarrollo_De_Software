public class FactoriaMontania implements FactoriaCarreraYBicicleta{
    @Override
    public Carrera crearCarrera() {
        return new CarreraMontania();
    }

    @Override
    public Bicicleta crearBicicleta(int id) {
        return new BicicletaMontania(id);
    }
}
