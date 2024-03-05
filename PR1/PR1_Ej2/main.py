from FactoriaCarretera import FactoriaCarretera
from FactoriaMontania import FactoriaMontania
import threading

def main():

    fac1 = FactoriaCarretera()
    fac2 = FactoriaMontania()

    car1 = fac1.crearCarrera()
    car2 = fac2.crearCarrera()

    bici1 = fac1.crearBicicleta()
    bici2 = fac2.crearBicicleta()

    t1 = threading.Thread(target=car1.run, args=[bici1])
    t2 = threading.Thread(target=car2.run, args=[bici2])

    t1.start()
    t2.start()

    t1.join()
    t2.join()

if __name__ == '__main__':
    main()

