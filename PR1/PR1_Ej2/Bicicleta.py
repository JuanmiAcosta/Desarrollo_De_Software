from abc import ABC, abstractmethod


class Bicicleta(ABC):
    def __init__(self):
        self.id=0
        self.tipo="normal"

    @abstractmethod
    def mostrarTipo(self):
        pass