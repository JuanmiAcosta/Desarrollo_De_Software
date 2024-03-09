class GestorFiltros():

    def __init__(self, salpicadero_target):
        self.cadena_filtros = []
        self.salpicadero_target = salpicadero_target

    def addFiltro(self, filtro):
        self.cadena_filtros.append(filtro)

    def ejecutarFiltros(self):
        for filtro in self.cadena_filtros:
            filtro.ejecutar(self.salpicadero_target)
