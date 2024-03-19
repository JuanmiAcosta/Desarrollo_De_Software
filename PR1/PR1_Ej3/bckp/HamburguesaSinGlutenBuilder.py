from bckp.HamburguesaBuilder import HamburguesaBuilder

class HamburguesaSinGlutenBuilder(HamburguesaBuilder):
    def __init__(self):
        self.ingredientes = []

    def construirPanSinGluten(self):  # Pan SIN gluten
        self.ingredientes.append("Pan SIN gluten")

    def construirCarne(self):  # Carne
        self.ingredientes.append("Carne")

    def construirTomate(self):  # Tomate
        self.ingredientes.append("Tomate")

    def construirLechuga(self):  # Lechuga
        self.ingredientes.append("Lechuga")

    def construirQueso(self):  # Queso
        self.ingredientes.append("Queso")

    def construirBacon(self):  # Bacon
        self.ingredientes.append("Bacon")

    def construirCebolla(self):  # Cebolla
        self.ingredientes.append("Cebolla")

    def construirHuevo(self):  # Huevo
        self.ingredientes.append("Huevo")

    def construirSalsa(self):  # Salsa
        self.ingredientes.append("Salsa")

