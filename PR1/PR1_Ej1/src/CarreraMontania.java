import java.util.ArrayList;
import java.util.Random;

public class CarreraMontania extends Carrera{

    public CarreraMontania(){
        tipo="montania";
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Soy una carrera de " + this.tipo +"\n");
    }

    @Override
    public void run() {
        try {
            for(int i=0;i<getHilosBicicletas().size();i++){
                getHilosBicicletas().get(i).start();
            }
            Thread.sleep(this.duracion * 1000);
            System.out.println("\nTermino la carrera de montaña");
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
