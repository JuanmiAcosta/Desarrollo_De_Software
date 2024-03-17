

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

            ingredientes = ''

            if (self.pan != None) :
                ingredientes=ingredientes+f"{self.pan}"
            if (self.lechuga != None) :
                ingredientes=ingredientes+f" {self.lechuga},"
            if (self.tomate != None) :
                ingredientes=ingredientes+f" {self.tomate},"
            if (self.quesoCabra != None) :
                ingredientes=ingredientes+f" {self.quesoCabra},"
            if (self.cebolla != None) :
                ingredientes=ingredientes+f" {self.cebolla},"
            if (self.pepinillos != None) :
                ingredientes=ingredientes+f" {self.pepinillos},"
            if (self.bacon != None) :
                ingredientes=ingredientes+f" {self.bacon},"
            if (self.carne != None) :
                ingredientes=ingredientes+f" {self.carne}."

            return ingredientes
