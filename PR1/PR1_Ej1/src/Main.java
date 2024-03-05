import java.util.ArrayList;
import java.util.Random;

public class Main {
    public static void main(String[] args) throws InterruptedException {

        FactoriaCarreraYBicicleta fac1 = new FactoriaCarretera();
        FactoriaCarreraYBicicleta fac2 = new FactoriaMontania();

        Carrera car1 = fac1.crearCarrera();
        Carrera car2 = fac2.crearCarrera();

        Bicicleta bici1;
        int nBicicletas = (int) (Math.random() * 100);
        System.out.println("En cada carrera vamos a tener: "+nBicicletas+" inscritas");
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
        ArrayList<Bicicleta> retirados1 = car1.getRetirados((int) Math.floor(0.2*nBicicletas));
        ArrayList<Bicicleta> retirados2 = car2.getRetirados((int) Math.floor(0.1*nBicicletas));

        Thread.sleep(10000); //Sincronizar output
        System.out.println("\nSe han retirado "+retirados1.size()+ " bicicletas de la Carrera carretera: ");
        for(int i=0;i<retirados1.size();i++){
            System.out.println("Bicicleta con ID: " +  retirados1.get(i).id + " y tipo " + retirados1.get(i).tipo);
        }

        System.out.println("\nSe han retirado "+retirados1.size()+ " bicicletas de la Carrera de Montaña: ");
        for(int i=0;i<retirados2.size();i++){
            System.out.println("Bicicleta con ID: " +  retirados2.get(i).id + " y tipo " + retirados2.get(i).tipo);
        }

    }
}