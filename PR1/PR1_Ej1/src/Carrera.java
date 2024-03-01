import java.util.ArrayList;

public abstract class Carrera implements Runnable{

    public static ArrayList<Carrera> carreras = new ArrayList<>();

    protected String nombreCarrera = "Carrera";

    private ArrayList<Bicicleta> participantes = new ArrayList<>();

    public static Thread hilo = new Thread(); //Un hilo para todas las carreras

    protected int duracion = 3;

    protected String tipo = "normal";

    public abstract void mostrarTipo();

    public String getNombre(){
        return this.nombreCarrera;
    }

    public void aniadirBici(Bicicleta bici){
        this.participantes.add(bici);
    }

    public ArrayList<Bicicleta> getParticipantes(){
        return participantes;
    }

    public ArrayList<Carrera> getCarreras(){
        return carreras;
    }
}
