from HamburguesaBuilder import HamburguesaBuilder

class HamburguesaNormalBuilder(HamburguesaBuilder):
    def aniadePan(self):
        self.hamburguesa.pan = "Pan normal"

    def aniadeLechuga(self):
        self.hamburguesa.lechuga = "Lechuga fresca"

    def aniadeTomate(self):
        self.hamburguesa.tomate = "Tomate pera"

    def aniadeQuesoCabra(self):
        self.hamburguesa.quesoCabra = "Queso de cabra recién cortado"

    def aniadeCebolla(self):
        self.hamburguesa.cebolla = "Cebolla llorosa"

    def aniadePepinillos(self):
        self.hamburguesa.pepinillos = "Pepinillos"

    def aniadeBacon(self):
        self.hamburguesa.bacon = "Bacon grasiento"

    def aniadeCarne(self):
        self.hamburguesa.carne = "Carne Wagyu"