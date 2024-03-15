from HamburguesaBuilder import HamburguesaBuilder

class Cocinero:
    def __init__(self, builder):
        self._builder = builder

    def build_hamburguesa(self):
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

