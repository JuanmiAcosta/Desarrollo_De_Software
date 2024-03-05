from abc import ABC, abstractmethod
from Protoype import Prototype
import copy

class Bicicleta(Prototype,ABC):
    def __init__(self):
        self.tipo="normal"

    @abstractmethod
    def mostrarTipo(self):
        pass

    @abstractmethod
    def clone(self):
        pass