from EstadoMotor import EstadoMotor
import math

class SalpizaderoTarget():

    def __init__(self):
        self.gestores_filtros = []
        self.estado_motor_actual = EstadoMotor.APAGADO
        self.velocidad_lineal = 0
        self.velocidad_angular = 0
        self.distancia = 0

    def __init__(self, velocidad_lineal, velocidad_angular, distancia, estado_motor):
        self.filtros = []
        self.estado_motor_actual = estado_motor
        self.velocidad_lineal = velocidad_lineal
        self.velocidad_angular = velocidad_angular
        self.distancia = distancia

    def ejecutar(self, revoluciones, estado_motor):
        self.estado_motor_actual = estado_motor
        self.velocidad_lineal = 2*math.pi*0.15*revoluciones*(60/1000)

    def printEstadoMotor(self):
        print (f'Estado motor: {self.estado_motor_actual.name}')

    def printSalpicadero(self):
        print (f'Velocidad lineal: {self.velocidad_lineal}')
        print (f'Velocidad angular: {self.velocidad_angular}')
        print (f'Distancia: {self.distancia}')  

    def setEstadoMotor(self, estado_motor):
        self.estado_motor_actual = estado_motor
    
    def setVelocidadLineal(self, velocidad_lineal):
        self.velocidad_lineal = velocidad_lineal

    def setVelocidadAngular(self, velocidad_angular):
        self.velocidad_angular = velocidad_angular

    def setDistancia(self, distancia):
        self.distancia = distancia

    def getEstadoMotor(self):
        return self.estado_motor_actual
    
    def getVelocidadLineal(self):
        return self.velocidad_lineal
    
    def getVelocidadAngular(self):
        return self.velocidad_angular
    
    def getDistancia(self):
        return self.distancia

    
  
