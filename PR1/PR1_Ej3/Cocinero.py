from HamburguesaBuilder import HamburguesaBuilder
from Subject import Subject
from Pedido import Pedido
class Cocinero(Subject):
    def __init__(self, builder):
        self._builder = builder

        self.status = "Tomando pedido"
        self.observers = []
        self.pedidoActual = Pedido()

    def build_hamburguesa(self):
        self.status = "Cocinando"

        self._builder.create_new_hamburguesa()
        self._builder.aniadePan()
        self._builder.aniadeLechuga()
        self._builder.aniadeTomate()
        if hasattr(self._builder, 'aniadeQuesoCabra'):
            self._builder.aniadeQuesoCabra()
        self._builder.aniadeCebolla()
        self._builder.aniadePepinillos()
        self._builder.aniadeBacon()
        self._builder.aniadeCarne()

        self.pedidoActual.aniadeHamburguesa(self._builder.hamburguesa)
        self.status = "Tomando pedido"

    def cambiaReceta(self, builder):
        self._builder = builder

    def attach(self, observer):
        self.observers.append(observer)

    def detach(self, observer):
        self.observers.remove(observer)

    def notify(self):
        for notified in self.observers:
            notified.update(self.pedidoActual)
        self.pedidoActual = Pedido()