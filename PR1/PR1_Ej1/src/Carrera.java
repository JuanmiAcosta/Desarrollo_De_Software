import java.util.ArrayList;
import java.util.Random;

public abstract class Carrera implements Runnable{

    private ArrayList<Bicicleta> participantes = new ArrayList<>();

    private ArrayList<Thread> hilodBicicletas = new ArrayList<>();

    protected int duracion = 60;
    protected String tipo = "normal";

    public abstract void mostrarTipo();

    public void aniadirBici(Bicicleta bici){
        this.participantes.add(bici);
    }

    public ArrayList<Bicicleta> getParticipantes(){
        return participantes;
    }

    public ArrayList<Thread> getHilosBicicletas(){
        return hilodBicicletas;
    }

    public ArrayList<Bicicleta> getRetirados(int n){
        Random ran = new Random();
        ArrayList<Bicicleta> retirados = new ArrayList<>();
        int retirado=0;
        Bicicleta actual;
        while(retirados.size()<n){
            for (int i=0;i<n;i++){
                retirado = (int) (Math.random() * 10);
                actual=getParticipantes().get(retirado);
                if(!retirados.contains(actual) && !getHilosBicicletas().get(retirado).isAlive()) retirados.add(getParticipantes().get(retirado));
            }
        }
        return retirados;
    }

    public void addHilosBicis(Thread hilo){
        hilodBicicletas.add(hilo);
    }
}
