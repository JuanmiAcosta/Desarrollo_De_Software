from enum import Enum

class EstadoMotor(Enum):
    APAGADO = 1
    ENCENDIDO = 2
    ACELERANDO = 3
    FRENANDO = 4