import Filtro

class RepercutirRozamiento(Filtro):

    def ejecutar(self, revoluciones, estado_motor):
        return revoluciones - (revoluciones*0.4)
