public abstract class Bicicleta implements Runnable{
    protected int id = 0;
    protected String tipo = "normal";

    public abstract void mostrarTipo();

    public void setId(int id){
        this.id=id;
    }

    @Override
    public synchronized void run(){

    }
}
