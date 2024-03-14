
from abc import ABC, abstractmethod

class HamburguesaBuilder(ABC):
    @abstractmethod
    def construirPan(self):  # Pan
        pass

    @abstractmethod
    def construirPan(self):  # Pan SIN gluten
        pass

    @abstractmethod
    def construirCarne(self):  # Carne
        pass

    @abstractmethod
    def construirTomate(self):  # Tomate
        pass

    @abstractmethod
    def construirLechuga(self):  # Lechuga
        pass

    @abstractmethod
    def construirQueso(self):  # Queso
        pass

    @abstractmethod
    def construirBacon(self):  # Bacon
        pass

    @abstractmethod
    def construirCebolla(self):  # Cebolla
        pass

    @abstractmethod
    def construirHuevo(self):  # Huevo
        pass

    @abstractmethod
    def construirSalsa(self):  # Salsa
        pass
