from HamburguesaBuilder import HamburguesaBuilder
import time
class HamburguesaSinGlutenBuilder(HamburguesaBuilder):
    def aniadePan(self):
        self.hamburguesa.pan = "Pan sin gluten"
        time.sleep(0.2)

    def aniadeLechuga(self):
        self.hamburguesa.lechuga = "Lechuga verde"
        time.sleep(0.1)

    def aniadeTomate(self):
        self.hamburguesa.tomate = "Tomate pera"
        time.sleep(0.1)

    def aniadeQuesoCabra(self):
        self.hamburguesa.quesoCabra = "Queso de cabra (sin trazas)"
        time.sleep(0.1)

    def aniadeCebolla(self):
        self.hamburguesa.cebolla = "Cebolla llorosa"
        time.sleep(0.1)

    def aniadePepinillos(self):
        self.hamburguesa.pepinillos = "Pepinillos"
        time.sleep(0.1)

    def aniadeBacon(self):
        self.hamburguesa.bacon = "Bacon grasiento"
        time.sleep(0.5)

    def aniadeCarne(self):
        self.hamburguesa.carne = "Carne Wagyu (sin trazas)"
        time.sleep(0.8)