from HamburguesaBuilder import HamburguesaBuilder
import time
class HamburguesaNormalBuilder(HamburguesaBuilder):
    def aniadePan(self):
        self.hamburguesa.pan = "Pan normal"
        time.sleep(0.1)

    def aniadeLechuga(self):
        self.hamburguesa.lechuga = "Lechuga fresca"
        time.sleep(0.1)

    def aniadeTomate(self):
        self.hamburguesa.tomate = "Tomate pera"
        time.sleep(0.1)

    def aniadeQuesoCabra(self):
        self.hamburguesa.quesoCabra = "Queso de cabra recién cortado"
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
        self.hamburguesa.carne = "Carne Wagyu"
        time.sleep(0.8)
