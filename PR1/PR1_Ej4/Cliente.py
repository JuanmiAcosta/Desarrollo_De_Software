import SalpicaderoTarget

class Cliente():

    def __init__(self, gestor_filtro):
        self.gestor_filtro = gestor_filtro

    def ejecutarFiltros(self, velocidad_lineal, velocidad_angular, distancia, estado_motor):
        salpicadero = SalpicaderoTarget.SalpizaderoTarget(velocidad_lineal, velocidad_angular, distancia, estado_motor)
        self.gestor_filtro.ejecutarFiltros(salpicadero)


    