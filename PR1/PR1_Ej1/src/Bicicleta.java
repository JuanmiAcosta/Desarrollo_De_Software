public abstract class Bicicleta implements Runnable{
    protected int id = 0;
    protected String tipo = "normal";

    public abstract void mostrarTipo();
}