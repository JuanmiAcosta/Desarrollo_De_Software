import java.util.ArrayList;

public abstract class Carrera implements Runnable{

    private ArrayList<Bicicleta> participantes = new ArrayList<>();
<<<<<<< HEAD

    private Thread hilo;

    protected int duracion = 10;

=======
    protected int dura = 60;
>>>>>>> 83a029a4bdf7634d6bb0223802c537997d451447
    protected String tipo = "normal";

    public abstract void mostrarTipo();


    public void aniadirBici(Bicicleta bici){
        this.participantes.add(bici);
    }
 //EMpiezan las dos carreras, ya que están sincronizadas
    public void start(){
        if(hilo==null){
            hilo=new Thread(this);
            hilo.start();
        }
    }

    public ArrayList<Bicicleta> getParticipantes(){
        return participantes;
    }
}
