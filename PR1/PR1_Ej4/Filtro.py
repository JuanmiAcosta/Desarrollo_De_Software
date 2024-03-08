from abc import ABC, abstractmethod

class Filtro(ABC):

    @abstractmethod
    def filtrar(self, revoluciones, ):
        pass

    