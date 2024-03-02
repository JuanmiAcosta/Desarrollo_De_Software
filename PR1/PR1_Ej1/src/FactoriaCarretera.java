public class FactoriaCarretera implements FactoriaCarreraYBicicleta{
    @Override
    public Carrera crearCarrera() {
        return new CarreraCarretera();
    }

    @Override
    public Bicicleta crearBicicleta(int id) {
        return new BicicletaCarretera(id);
    }
}
