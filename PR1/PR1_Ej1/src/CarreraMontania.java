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
            Thread.sleep(this.duracion * 1000);
            System.out.println("Terminé montania\n");
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
