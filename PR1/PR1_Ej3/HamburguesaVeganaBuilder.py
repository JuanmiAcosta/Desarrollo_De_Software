from HamburguesaBuilder import HamburguesaBuilder
import time
class HamburguesaVeganaBuilder(HamburguesaBuilder):

    def aniadePan(self):
        self.hamburguesa.pan = "Pan normal"
        time.sleep(0.1)

    def aniadeLechuga(self):
        self.hamburguesa.lechuga = "Lechuga fresca"
        time.sleep(0.1)

    def aniadeTomate(self):
        self.hamburguesa.tomate = "Tomate pera"
        time.sleep(0.1)

    def aniadeCebolla(self):
        self.hamburguesa.cebolla = "Cebolla llorosa"
        time.sleep(0.1)

    def aniadePepinillos(self):
        self.hamburguesa.pepinillos = "Pepinillos"
        time.sleep(0.1)

    def aniadeBacon(self):
        self.hamburguesa.bacon = "Bacon Vegano reseco"
        time.sleep(0.6)

    def aniadeCarne(self):
        self.hamburguesa.carne = "Carne Vegana de dudosa procedencia"
        time.sleep(1)

    def aniadePrecio(self):
        self.hamburguesa.precio = 5.5