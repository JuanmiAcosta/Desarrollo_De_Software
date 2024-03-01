public class FactoriaCarretera implements FactoriaCarreraYBicicleta{
    @Override
    public Carrera crearCarrera(String nombre) {
        return new CarreraCarretera(nombre);
    }

    @Override
    public Bicicleta crearBicicleta() {
        return new BicicletaCarretera();
    }
}
