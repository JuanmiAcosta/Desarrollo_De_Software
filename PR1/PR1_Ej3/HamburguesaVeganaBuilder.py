from HamburguesaBuilder import HamburguesaBuilder

class HamburguesaVeganaBuilder(HamburguesaBuilder):

    def aniadePan(self):
        self.hamburguesa.pan = "Pan normal"

    def aniadeLechuga(self):
        self.hamburguesa.lechuga = "Lechuga fresca"

    def aniadeTomate(self):
        self.hamburguesa.tomate = "Tomate pera"

    def aniadeCebolla(self):
        self.hamburguesa.cebolla = "Cebolla llorosa"

    def aniadePepinillos(self):
        self.hamburguesa.pepinillos = "Pepinillos"

    def aniadeBacon(self):
        self.hamburguesa.bacon = "Bacon Vegano reseco"

    def aniadeCarne(self):
        self.hamburguesa.carne = "Carne Vegana de dudosa procedencia"