import SalpicaderoTarget

class Cliente():

    def __init__(self, gestor_filtro):
        self.gestor_filtro = gestor_filtro

    def ejecutarFiltros(self):
        return self.gestor_filtro.ejecutarFiltros()