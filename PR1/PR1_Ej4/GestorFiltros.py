class GestorFiltros():

    def __init__(self):
        self.cadena_filtros = None

    def addCadenaFiltro(self, cadenaFiltro):
        self.cadena_filtros = cadenaFiltro

    def setTarget(self, salpicaderoTarget):
        self.cadena_filtros.setTarget(salpicaderoTarget)

    def setCadenaFiltros (self, cadena):
        self.cadena_filtros=cadena

    def ejecutarFiltros(self):
        revoluciones = self.cadena_filtros.salpicadero_target.getVelocidadAngular()
        estado = self.cadena_filtros.salpicadero_target.getEstadoMotor()

        revoluciones = self.cadena_filtros.ejecutar(revoluciones, estado)

        return revoluciones