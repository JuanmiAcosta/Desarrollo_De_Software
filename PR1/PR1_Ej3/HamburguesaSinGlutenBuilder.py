from HamburguesaBuilder import HamburguesaBuilder

class HamburguesaSinGlutenBuilder(HamburguesaBuilder):
    def aniadePan(self):
        self.hamburguesa.pan = "Pan sin gluten"

    def aniadeLechuga(self):
        self.hamburguesa.lechuga = "Lechuga verde"

    def aniadeTomate(self):
        self.hamburguesa.tomate = "Tomate pera"

    def aniadeQuesoCabra(self):
        self.hamburguesa.quesoCabra = "Queso de cabra (sin trazas)"

    def aniadeCebolla(self):
        self.hamburguesa.cebolla = "Cebolla llorosa"

    def aniadePepinillos(self):
        self.hamburguesa.pepinillos = "Pepinillos"

    def aniadeBacon(self):
        self.hamburguesa.bacon = "Bacon grasiento"

    def aniadeCarne(self):
        self.hamburguesa.carne = "Carne Wagyu (sin trazas)"