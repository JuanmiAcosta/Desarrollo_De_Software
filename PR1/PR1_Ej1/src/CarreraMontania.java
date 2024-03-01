public class CarreraMontania extends Carrera{

    public CarreraMontania(String nombre){
        tipo="montania";
        carreras.add(this);
        nombreCarrera=nombre;
    }
    @Override
    public void mostrarTipo() {
        System.out.println("Soy una carrera de " + this.tipo +"\n");
    }

    @Override
    public void run() {
        try {
            Thread.sleep(this.duracion * 1000);
            for (Carrera carrera: this.getCarreras()){
                System.out.printf("Terminada carrera " + carrera.getNombre() +"\n");
            }
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
