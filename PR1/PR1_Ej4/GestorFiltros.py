class GestorFiltros():

    def __init__(self, salpicadero_target):
        self.cadena_filtros = []
        self.salpicadero_target = salpicadero_target

    def addCadenaFiltro(self, cadenaFiltro):
        self.cadena_filtros.append(cadenaFiltro)

    def setTarget(self, salpicaderoTarget):
        self.salpicadero_target = salpicaderoTarget

    def ejecutarFiltros(self):
        revoluciones = self.salpicadero_target.getVelocidadAngular()

        for cadena_filtros in self.cadena_filtros:
            revoluciones = cadena_filtros.ejecutar(,self.salpicadero_target.getEstadoMotor())
        estado = self.salpicadero_target.getEstadoMotor()

        for cadena in self.cadena_filtros:
            revoluciones = cadena.ejecutar(revoluciones, estado)

        if self.salpicadero_target is not None:
            self.salpicadero_target.ejecutar(revoluciones,estado)

        return revoluciones
