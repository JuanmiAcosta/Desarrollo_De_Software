class Cocinero:

    def __init__(self, hamburguesabuilder):
        self.builder = hamburguesabuilder

    def construirHamburguesaNormal(self):
        self.builder.construirPan()
        self.builder.construirTomate()
        self.builder.construirLechuga()
        self.builder.construirCarne()
        self.builder.construirQueso()
        self.builder.construirBacon()
        self.builder.construirCebolla()
        self.builder.construirHuevo()
        self.builder.construirSalsa()

        return self.builder.ingredientes

    def construirHamburguesaSinGluten(self):
        self.builder.construirPanSinGluten()
        self.builder.construirCarne()
        self.builder.construirTomate()
        self.builder.construirLechuga()
        self.builder.construirQueso()
        self.builder.construirBacon()
        self.builder.construirCebolla()
        self.builder.construirHuevo()
        self.builder.construirSalsa()

    def quitarTomate(self):
        self.builder.ingredientes.remove("Tomate")

    def quitarLechuga(self):
        self.builder.ingredientes.remove("Lechuga")

    def quitarQueso(self):
        self.builder.ingredientes.remove("Queso")

    def quitarBacon(self):
        self.builder.ingredientes.remove("Bacon")

    def quitarCebolla(self):
        self.builder.ingredientes.remove("Cebolla")

    def quitarHuevo(self):
        self.builder.ingredientes.remove("Huevo")

    def quitarSalsa(self):
        self.builder.ingredientes.remove("Salsa")
