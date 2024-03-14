from abc import ABC, abstractmethod

class Filtro(ABC):

    @abstractmethod
    def ejecutar(self, revoluciones, estado_motor):
        pass

    