class CadenaFiltros():
    
    def __init__(self):
        self.filtros = []
    
    def addFiltro(self, filtro):
        self.filtros.append(filtro)
    
    def ejecutar(self, revoluciones, estado_motor):

        for filtro in self.filtros:
            revoluciones = filtro.ejecutar(revoluciones, estado_motor)

        return revoluciones