public class CarreraCarretera extends Carrera{

    public CarreraCarretera(){
        tipo="carretera";
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Soy una carrera de " + this.tipo + "\n");
    }

    @Override
    public void run() {
        try {
            Thread.sleep(this.duracion*1000);
            System.out.println("Terminé carretera\n");
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
