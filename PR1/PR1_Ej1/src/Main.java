import java.util.ArrayList;

public class Main {
    static final int nBicicletas = 10;
    public static void main(String[] args) throws InterruptedException {

        FactoriaCarreraYBicicleta fac1 = new FactoriaCarretera();
        FactoriaCarreraYBicicleta fac2 = new FactoriaMontania();

        Carrera car1 = fac1.crearCarrera();
        Carrera car2 = fac2.crearCarrera();

        Bicicleta bici1;
        System.out.println("\nInscripsciones de Carrera Carretera:");

        for(int i=0;i<nBicicletas;i++){
            bici1= fac1.crearBicicleta(i+1);
            Thread hilo = new Thread(bici1);
            car1.addHilosBicis(hilo);
            car1.aniadirBici(bici1);
            System.out.println("Bicicleta con ID: "+bici1.id);
        }

        System.out.println("\nInscripsciones de Carrera Montaña:");
        for(int i=0;i<nBicicletas;i++) {
            bici1 = fac2.crearBicicleta(i+1);
            Thread hilo = new Thread(bici1);
            car2.addHilosBicis(hilo);
            car2.aniadirBici(bici1);
            System.out.println("Bicicleta con ID: " + bici1.id);
        }

        Thread hilo1 = new Thread(car1);
        Thread hilo2 = new Thread(car2);

        System.out.println("\nEmpiezan ambas carreras a la vez \n");
        hilo1.start();
        hilo2.start();
        ArrayList<Bicicleta> retirados1 = car1.getRetirados(2);
        ArrayList<Bicicleta> retirados2 = car2.getRetirados(1);

        Thread.sleep(10000); //Sincronizar output
        System.out.println("\nSe retiro de la Carrera carretera: ");
        for(int i=0;i<retirados1.size();i++){
            System.out.println("Bicicleta con ID: " +  retirados1.get(i).id + " y tipo " + retirados1.get(i).tipo);
        }

        System.out.println("\nSe retiro de la Carrera montaña: ");
        for(int i=0;i<retirados2.size();i++){
            System.out.println("Bicicleta con ID: " +  retirados2.get(i).id + " y tipo " + retirados2.get(i).tipo);
        }

    }
}