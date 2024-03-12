class CadenaFiltros():
    
    def __init__(self):
        self.filtros = []
    
    def addFiltro(self, filtro):
        self.filtros.append(filtro)
    
    def ejecutar(self, revoluciones, estado_motor):

        for filtro in self.filtros:
            revoluciones = filtro.ejecutar(revoluciones, estado_motor)

        if self.target is not None:
            self.target.ejecutar(revoluciones,estado_motor)
            self.target.printEstadoMotor()
            self.target.printSalpicadero()

        return revoluciones