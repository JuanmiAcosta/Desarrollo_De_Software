from abc import ABC, abstractmethod
from Protoype import Prototype
import copy

class Bicicleta(ABC,Prototype):
    def __init__(self):
        self.id=0
        self.tipo="normal"

    @abstractmethod
    def mostrarTipo(self):
        pass

    def clone(self):
        return copy.copy(self)