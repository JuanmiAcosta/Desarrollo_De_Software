import Filtro
import EstadoMotor as EstadoMotor

class CalcularVelocidad(Filtro):

    def ejecutar(self, revoluciones, estado_motor):
        incrementoVelocidad = 0

        if estado_motor == EstadoMotor.EstadoMotor.APAGADO or estado_motor == EstadoMotor.EstadoMotor.ENCENDIDO:
            incrementoVelocidad = 0
        elif estado_motor == EstadoMotor.EstadoMotor.ACELERANDO:
            incrementoVelocidad = 100
        elif estado_motor == EstadoMotor.EstadoMotor.FRENANDO:
            incrementoVelocidad = -100

        return revoluciones + incrementoVelocidad