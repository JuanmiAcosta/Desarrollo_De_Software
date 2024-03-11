class GestorFiltros():

    def __init__(self, salpicadero_target):
        self.cadena_filtros = []
        self.salpicadero_target = salpicadero_target

    def addFiltro(self, filtro):
        self.cadena_filtros.append(filtro)

    def setTarget(self, salpicaderoTarget):
        self.salpicadero_target = salpicaderoTarget

    def ejecutarFiltros(self):
        revoluciones = 0

        for cadena_filtros in self.cadena_filtros:
            cadena_filtros.ejecutar(self.salpicadero_target.getVelocidadAngular(),self.salpicadero_target.getEstadoMotor())

        return revoluciones
