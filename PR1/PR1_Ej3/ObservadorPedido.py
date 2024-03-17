from abc import ABC, abstractmethod

class ObservadorPedido(ABC):
    @abstractmethod
    def update(self, pedido):
        pass