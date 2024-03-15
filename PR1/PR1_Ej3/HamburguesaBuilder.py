from abc import ABC, abstractmethod
from Hamburguesa import Hamburguesa

class HamburguesaBuilder(ABC):
    def __init__(self):
        self.hamburguesa = None

    def create_new_hamburguesa(self):
        self.hamburguesa = Hamburguesa()

    @abstractmethod
    def aniadePan(self):
        pass

    @abstractmethod
    def aniadeLechuga(self):
        pass

    @abstractmethod
    def aniadeTomate(self):
        pass

    def aniadeQuesoCabra(self): # Este método no tiene por qué ser implementado, las hamburguesas veganas no llevan queso de cabra
        pass

    @abstractmethod
    def aniadeCebolla(self):
        pass

    @abstractmethod
    def aniadePepinillos(self):
        pass

    @abstractmethod
    def aniadeBacon(self):
        pass

    @abstractmethod
    def aniadeCarne(self):
        pass