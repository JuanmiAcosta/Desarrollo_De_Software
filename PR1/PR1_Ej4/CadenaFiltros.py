class CadenaFiltros():
    
    def __init__(self):
        self.filtros = []
        self.target = None
    
    def addFiltro(self, filtro):
        self.filtros.append(filtro)

    def setTarget(self, target):
        self.target = target
    
    def ejecutar(self, revoluciones, estado_motor):

        for filtro in self.filtros:
            revoluciones = filtro.ejecutar(revoluciones, estado_motor)

        if self.target is not None:
            self.target.ejecutar(revoluciones,estado_motor)
            self.target.printEstadoMotor()
            self.target.printSalpicadero()
        #else:
        #    self.target.ejecutar(revoluciones,estado_motor)

        return revoluciones