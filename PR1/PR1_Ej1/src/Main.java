public class Main {
    public static void main(String[] args) {

        FactoriaCarreraYBicicleta fac1 = new FactoriaCarretera();
        FactoriaCarreraYBicicleta fac2 = new FactoriaMontania();

        Carrera car1 = fac1.crearCarrera();
        Carrera car2 = fac2.crearCarrera();

        Thread t_car1 = new Thread(car1);
        Thread t_car2 = new Thread(car2);

        t_car1.start();
        t_car2.start();

    }
}