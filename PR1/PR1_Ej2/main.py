from FactoriaCarretera import FactoriaCarretera
from FactoriaMontania import FactoriaMontania
import threading

def main():

    fac1 = FactoriaCarretera()
    fac2 = FactoriaMontania()

    car1 = fac1.crearCarrera()
    car2 = fac2.crearCarrera()

    t1 = threading.Thread(target=car1.run)
    t2 = threading.Thread(target=car2.run)

    t1.start()
    t2.start()

    t1.join()
    t2.join()

if __name__ == '__main__':
    main()

