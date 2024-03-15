class GestorFiltros():

    def __init__(self, salpicadero_target):
        self.cadena_filtros = None
        self.setTarget(salpicadero_target)

    def addCadenaFiltro(self, cadenaFiltro):
        self.cadena_filtros = cadenaFiltro

    def setTarget(self, salpicaderoTarget):
        self.cadena_filtros.setTarget(salpicaderoTarget)

    def ejecutarFiltros(self):
        revoluciones = self.cadena_filtros.getVelocidadAngular()
        estado = self.cadena_filtros.getEstadoMotor()

        revoluciones = self.cadena_filtros.ejecutar(revoluciones, estado)

        return revoluciones