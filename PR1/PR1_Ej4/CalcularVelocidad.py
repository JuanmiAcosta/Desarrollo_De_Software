from Filtro import Filtro
import EstadoMotor as EstadoMotor
class CalcularVelocidad(Filtro):

    def __init__(self):
        self.incremento_velocidad = 0

    def ejecutar(self, revoluciones, estado_motor):

        if estado_motor == EstadoMotor.EstadoMotor.APAGADO or estado_motor == EstadoMotor.EstadoMotor.ENCENDIDO:
            self.incrementoVelocidad = 0
        elif estado_motor == EstadoMotor.EstadoMotor.ACELERANDO:
            self.incrementoVelocidad = 100
        elif estado_motor == EstadoMotor.EstadoMotor.FRENANDO:
            self.incrementoVelocidad = -100

        if revoluciones + self.incrementoVelocidad > 5000:
            self.incrementoVelocidad = 5000 - revoluciones

        rev_devolver = revoluciones + self.incrementoVelocidad

        if rev_devolver <= 0:
            return 0
        else:
            return rev_devolver