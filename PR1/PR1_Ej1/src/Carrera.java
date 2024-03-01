import java.util.ArrayList;

public abstract class Carrera {

    private ArrayList<Bicicleta> participantes = new ArrayList<>();
    protected int duracion = 60;

    protected String tipo = "normal";

    public abstract void mostrarTipo();

    public void aniadirBici(Bicicleta bici){
        this.participantes.add(bici);
    }

    public ArrayList<Bicicleta> getParticipantes(){
        return participantes;
    }
}
