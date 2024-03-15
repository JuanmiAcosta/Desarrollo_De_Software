

class Hamburguesa:
        def __init__(self):
            self.pan = None
            self.lechuga = None
            self.tomate = None
            self.quesoCabra = None
            self.cebolla = None
            self.pepinillos = None
            self.bacon = None
            self.carne = None

        def __str__(self):

            ingredientes = []

            if (self.pan != None) :
                ingredientes.append(f"{self.pan}")
            if (self.lechuga != None) :
                ingredientes.append(f"{self.lechuga}")
            if (self.tomate != None) :
                ingredientes.append(f"{self.tomate}")
            if (self.quesoCabra != None) :
                ingredientes.append(f"{self.quesoCabra}")
            if (self.cebolla != None) :
                ingredientes.append(f"{self.cebolla}")
            if (self.pepinillos != None) :
                ingredientes.append(f"{self.pepinillos}")
            if (self.bacon != None) :
                ingredientes.append(f"{self.bacon}")
            if (self.carne != None) :
                ingredientes.append(f"{self.carne}")

            print(ingredientes)
