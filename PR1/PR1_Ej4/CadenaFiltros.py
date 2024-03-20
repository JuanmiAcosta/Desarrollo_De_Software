from SalpicaderoTarget import  SalpicaderoTarget
class CadenaFiltros():

    def __init__(self):
        self.filtros = []
        self.salpicadero_target = None

    def addFiltro(self, filtro):
        self.filtros.append(filtro)

    def setTarget(self,target):
        self.salpicadero_target = target

    def ejecutar(self, revoluciones, estado_motor):
        for filtro in self.filtros:
            revoluciones = filtro.ejecutar(revoluciones, estado_motor)

        if self.salpicadero_target is not None:
            self.salpicadero_target.ejecutar(revoluciones,estado_motor)

        return revoluciones