import java.util.ArrayList;
import java.util.Random;

public abstract class Carrera implements Runnable{

    private ArrayList<Bicicleta> participantes = new ArrayList<>();

    public static int NUM_BICIS=10;

    protected int duracion = 10;

    protected String tipo = "normal";

    public abstract void mostrarTipo();


    public void aniadirBici(Bicicleta bici){
        this.participantes.add(bici);
    }

    public ArrayList<Bicicleta> getParticipantes(){
        return participantes;
    }

    @Override
    public synchronized void run(){
        System.out.println(Thread.currentThread().getName() + " is starting");

        try {

            Boolean bici_montania;
            Random tipo_bici = new Random();

            for (int i=0; i<NUM_BICIS; i++) {
                bici_montania = tipo_bici.nextBoolean();
                if (bici_montania){
                    FactoriaCarreraYBicicleta fac2 = new FactoriaMontania();
                    Bicicleta bici = fac2.crearBicicleta();
                    bici.setId(i);
                    this.aniadirBici(bici);
                }else{
                    FactoriaCarreraYBicicleta fac2 = new FactoriaCarretera();
                    Bicicleta bici = fac2.crearBicicleta();
                    bici.setId(i);
                    this.aniadirBici(bici);
                }
            }

            Thread.sleep(1000*duracion);

        } catch(InterruptedException ie) {
            ie.printStackTrace();
        }

        System.out.println(Thread.currentThread().getName() + " is finished");
    }
}
