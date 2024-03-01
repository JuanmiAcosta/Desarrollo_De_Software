public class Main {
    public static void main(String[] args) {

        FactoriaCarreraYBicicleta fac1 = new FactoriaCarretera();
        FactoriaCarreraYBicicleta fac2 = new FactoriaMontania();

        Bicicleta bici1 = fac1.crearBicicleta();
        Bicicleta bici2 = fac2.crearBicicleta();

        Carrera car1 = fac1.crearCarrera();
        Carrera car2 = fac2.crearCarrera();

        bici1.mostrarTipo();
        bici2.mostrarTipo();

        car1.mostrarTipo();
        car2.mostrarTipo();

        car1.aniadirBici(bici1);
        car1.aniadirBici(bici2);

        System.out.printf("Los participantes de la carrera 1 son las bicis con id ");

        for (Bicicleta bici: car1.getParticipantes()){
            System.out.printf(" " + bici.id + " y tipo " + bici.tipo + "; ");
            System.out.println("prueba\n");
        }
    }
}